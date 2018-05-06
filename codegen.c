
/**
 *
 * @date Spring 2018
 * @author Omar Soliman
 * @title Code generation functions
 *    _____
 *   /\   /\
 *  /  \ /  \
 * |    xmst |
 *  \  / \  /
 *   \/___\/
 *
 **/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "codegen.h"
#include "printtree.h"
#include "semantic.h"

extern int globalOffset;

int leftside = 1;
int ifcount = 0;

typedef struct GlobalStorage {

    TreeNode *t;
    struct GlobalStorage *next;

} GlobalStorage;

//setup storage of ghost frames for referencing, hopefully won't need more than 64 active frames
typedef struct ghost {
    int offset;
    char *name;
} ghost;
ghost ghostFrames[64];
int counterGhost = 0;

GlobalStorage *globals;


int linecode = 42;


//marks if return present in compound
int hasReturn = 0;

//marks starting point of various variables
//TODO set as globalOffset when introducing globals
int varstart = 0;

//saves offset of values to be assigned (=, +=, etc)
int currentOffset = 0;
char *currentOffsetName = NULL;

//flips between register 3/4 for processing expressions
int flip = 0;

int isCall = 0;
/*
 * Generate TM machine code
 */
void codeGen(TreeNode* t) {
	FILE* codeout = fopen("testfile.tm","w+");
	//printf("we made it!\n");
	//printFileInfo(filename, codeout);
	//genPrototypes(codeout);
	//printSymbolTable(stdout);
    TreeNode *tmp = t;
    int i = 0;
    //set tree past I/O functions
    for(i = 0; i < 7; i++) {
        tmp = tmp->sibling;
    }

    //reset values in between
    printFileInfo("testfile.tm", stdout);
    printFileInfo("testfile.tm", codeout);
    genPrototypes(stdout);
    genPrototypes(codeout);

    printCodeTree(tmp, codeout);
    initPrintCode(codeout);

    linecode = 42;

    printCodeTree(tmp, stdout);
    initPrintCode(stdout);
	fclose(codeout);

	return;
}





/*
* Print the AST
*
* tree - Root node to start printing at
*/
void printCodeTree(TreeNode* tree, FILE *output) {

    int setIf = 0;

    int instCounter = 0;
    int inst[2] = {0};
    int instOp[2] = {0};

    TreeNode *inst1, *inst2;
    inst1 = NULL;
    inst2 = NULL;
    
    //stores name of function for comments
    char *curfun = NULL;

    //sets up calls after children finish
    int doCalls = 0;

    int isCompound = 0;
    /* 
    * Values for printing
    *
    * Store everything besides constants in storeVal
    * if constant a char, set storeChar to 1
    */
    char *storeVal = NULL;
    int storeInt = 0;
    int storeChar = 0;

    /*
    *   Values for determining operations on constants/variables
    *   0 - do nothing
    *   1 - load const int
    *   2 - load const char
    *   3 - load const true
    *   4 - load const false
    *   5 - load variable array
    *   6 - load variable
    */
    int opTodo = 0;


	//Check if we exist before printing
	while (tree != NULL)
	{

		//Statement node printing
		if (tree->nodekind == StmtK)
		{
			switch (tree->kind.stmt)
			{
				case IfK:
					storeVal = "If";
                    fprintf(output, "* IF\n");
                    setIf = 1;
				break;

				case RepeatK:
					storeVal = "While";
                    fprintf(output, "* WHILE\n");
				break;

				case BreakK:
					storeVal = "Break";
				break;

				case ReturnK:
                    hasReturn = 1;
					storeVal = "Return";
                    fprintf(output, "* RETURN\n");
				break;

				case CompoundK:
					storeVal = "Compound";
                    isCompound = 1;
                    fprintf(output, "* COMPOUND\n* Compound Body\n");
				break;

				default:
				break;
			}
		}
		//Expression node printing
		else if (tree->nodekind == ExpK)
		{
			switch (tree->kind.exp)
			{
				//Constant expression
				case ConstK:

					if(tree->expType != Boolean)
					{
						if(tree->expType != Char) {
					        storeInt = tree->attr.value;
                            //is a parameter
                            if(isCall <= 0) {
                                opTodo = 1;
                                //fprintf(output, "%d:    LDC  3,%d(6)\tLoad int constant\n", linecode, tree->attr.value);
                                //save left side
                                //leftside = 1;
                            } else {
                                fprintf(output, "%d:    LDC  3,%d(6)\tLoad int constant\n", linecode, tree->attr.value); linecode++;
                                fprintf(output, "%d:     ST  3,%d(1)\tStore Parameter\n", linecode, varstart); linecode++;
                            }
                            
						} else {
					        storeChar = 1;
                            storeInt = tree->attr.cvalue;                            
                            //convert to integer representation, load constant
                            if(isCall <= 0) {
                                opTodo = 2;
                                //fprintf(output, "%d:    LDC  3,%d(6)\tLoad char constant\n", linecode, tree->attr.cvalue - '0'); 
                            } else {
                                fprintf(output, "%d:    LDC  3,%d(6)\tLoad char constant\n", linecode, tree->attr.cvalue - '0'); linecode++;
                                fprintf(output, "%d:     ST  3,%d(1)\tStore Parameter\n", linecode, varstart); linecode++;
                            }
                        }
					}
					else
					{
						if(tree->attr.value == 1) {
					        storeVal = "true";
                            if(isCall <= 0) {
                                opTodo = 3;
                                //fprintf(output, "%d:    LDC  3,1(6)\tLoad true constant\n", linecode);
                            } else {
                                fprintf(output, "%d:    LDC  3,1(6)\tLoad true constant\n", linecode); linecode++;
                                fprintf(output, "%d:     ST  3,%d(1)\tStore Parameter\n", linecode, varstart); linecode++;
                            }
						} else {
					        storeVal = "false";
                            if(isCall <= 0) {
                                opTodo = 4;
                                //fprintf(output, "%d:    LDC  3,0(6)\tLoad false constant\n", linecode);
                            } else {
                                fprintf(output, "%d:    LDC  3,0(6)\tLoad false constant\n", linecode); linecode++;
                                fprintf(output, "%d:     ST  3,%d(1)\tStore Parameter\n", linecode, varstart); linecode++;
                            }
                        }
					}
				break;

				//ID expression
				case IdK:
					if(!tree->isFunc)
					{
                        //TODO move after children call for proper evaluation
						if(tree->isArray) { 
                            storeVal = tree->attr.name;
                            currentOffset = tree->offset;
                            currentOffsetName = tree->attr.name;

                            if(isCall <= 0) {
                                opTodo = 5;
                                //fprintf(output, "%d:    LDC  3,%d(6)\tLoad array variable\n", linecode, tree->offset);
                            } else {
                                fprintf(output, "%d:    LDC  3,%d(6)\tLoad address of base of array\n", linecode, tree->offset); linecode++;
                                fprintf(output, "%d:     ST  3,%d(1)\tStore Parameter\n", linecode, varstart); linecode++;
                            }
                        } else {
					        storeVal = tree->attr.name;
                            currentOffset = tree->offset;
                            currentOffsetName = tree->attr.name;

                            if(isCall <= 0) {
                                opTodo = 6;
                                //fprintf(output, "%d:    LDC  3,%d(6)\tLoad variable\n", linecode, tree->offset);
                            } else {
                                fprintf(output, "%d:     LD  3,%d(1)\tLoad variable\n", linecode, tree->offset); linecode++;
                                fprintf(output, "%d:     ST  3,%d(1)\tStore Parameter\n", linecode, varstart); linecode++;
                            }
                        }
                        
					}
					else {
					    //we found a function call. Do these things:
					    //move frame pointer
					    //setup parameters
					    //store return address in ac
					    //call function
					    //save result in ac
                        storeVal = tree->attr.name;
                        fprintf(output, "*\t\t\t Begin call to %s\n", tree->attr.name);
                        
                        //generating ghost frame information
                        fprintf(output,"%d:     ST  1,%d(1)\tStore old fp in ghost frame\n", linecode, varstart); linecode++;
                        ghostFrames[counterGhost].offset = varstart;
                        ghostFrames[counterGhost].name = tree->attr.name;
                        counterGhost++;

                        //adjust for ghost frame
                        varstart -= 2;
                        isCall += 1;
                    }
				break;

				default:
				break;
			}
		}
		//Declaration node printing
		else if (tree->nodekind == DeclK)
		{
			switch (tree->kind.decl)
			{ 
				//Variable
				case varDec:
                        storeVal = tree->attr.name;
                        //TODO check if global
                        if(tree->ref == 1) {
                            //store to be called in various functions
                        }
				break;

				//Function
				case funDec:
                        fprintf(output, "* FUNCTION %s\n", tree->attr.name);
                        fprintf(output, "%d:     ST  3,-1(1)\tStore return address.\n", linecode); linecode++;
                        
                        
                        curfun = tree->attr.name;
                        storeVal = tree->attr.name;
                        
                        Symbol *s = stackSearch(curfun);
                        s->offset = linecode-1;

                        varstart = tree->size;
				break;

				//Record - ignored
				case recDec:
                        storeVal = tree->attr.name;
				break;

				default:
				break;
			}
		}





		/*
		* Now that we've printed ourself and the next level
		* of indentation, try printing any children we have
		*/
		for (int i = 0; i < MAXCHILDREN; i++)
		{
			/*
			* Check if current child exists
			*/
			if(tree->child[i] != NULL)
			{
            
                if(setIf > 0 && i == 1) {
				    printCodeTree(tree->child[i], output);
                    fprintf(output, "%d:    JZR  3,3(7) Jump around the THEN if false [backpatch]\n", ifcount);
                    ifcount = linecode;
                    linecode++;
                } else if(setIf > 0 && i == 2) {
				    printCodeTree(tree->child[i], output);
                    fprintf(output, "%d:    LDA  7,2(7) Jump around the ELSE [backpatch]\n", ifcount);
                    ifcount = 0;
                    setIf = 0;
                } else {
				    /*
				    * Print the child tag and our child node
				    */
				    printCodeTree(tree->child[i], output);
                }
			}
		}


        TreeNode *tmp; 

        if (tree->nodekind == ExpK)
		{
            if(tree->kind.exp == OpK) {
					        switch (tree->attr.op)
					        {
						        case mod:
					                storeVal = "%";
						        break;

						        case bNOT:
					                storeVal = "NOT";
                                    fprintf(output, "%d:    LDC  4,1(6)\tLoad 1\n", linecode); linecode++;
                                    fprintf(output, "%d:    XOR  3,3,4\tOp NOT\n", linecode); linecode++;
						        break;

						        case bAND:
					                storeVal = "AND";
                                    fprintf(output, "%d:    ADD  3,4,3\tOp AND\n", linecode); linecode++;
						        break;

						        case bOR:
					                storeVal = "OR";
                                    fprintf(output, "%d:    ADD  3,4,3\tOp AND\n", linecode); linecode++;
						        break;

						        case eqeq:
					                storeVal = "==";
                                    expressionCode(tree, output);
                                    fprintf(output, "%d:    TEQ  3,4,3\tOp ==\n", linecode); linecode++;
                                    //add backpatch setup
                                    ifcount = linecode;
                                    linecode++;
						        break;

						        case neq:
					                storeVal = "!=";
                                    expressionCode(tree, output);
                                    fprintf(output, "%d:    TNE  3,4,3\tOp ==\n", linecode); linecode++;
                                    //add backpatch setup
                                    ifcount = linecode;
                                    linecode++;
						        break;

						        case lteq:
					                storeVal, "<=";
                                    expressionCode(tree, output);
                                    fprintf(output, "%d:    TLE  3,4,3\tOp <=\n", linecode); linecode++;
                                    //add backpatch setup
                                    ifcount = linecode;
                                    linecode++;
						        break;

						        case lthan:
					                storeVal = "<";
                                    expressionCode(tree, output);
                                    fprintf(output, "%d:    TLT  3,4,3\tOp <\n", linecode); linecode++;
                                    //add backpatch setup
                                    ifcount = linecode;
                                    linecode++;
						        break;

						        case gteq:
					                storeVal = ">=";
                                    expressionCode(tree, output);
                                    fprintf(output, "%d:    TGE  3,4,3\tOp >=\n", linecode); linecode++;
                                    //add backpatch setup
                                    ifcount = linecode;
                                    linecode++;
						        break;

						        case gthan:
					                storeVal = ">";
                                    expressionCode(tree, output);
                                    fprintf(output, "%d:    TGT  3,4,3\tOp <\n", linecode); linecode++;
                                    //add backpatch setup
                                    ifcount = linecode;
                                    linecode++;
						        break;

						        case qmark:
					                storeVal = "?";
						        break;

						        case plus:
					                storeVal = "+";
                                    expressionCode(tree, output);
                                    fprintf(output, "%d:    ADD  3,4,3\tOp +\n", linecode);
                                    linecode++;
                                    fprintf(output, "%d:     ST  3,%d(1)\tSave left side\n", linecode, varstart); linecode++;
                                    leftside = 1;
						        break;

						        case pplus:
					                storeVal = "++";
						        break;

						        case dash:
					                storeVal = "-";
                                    expressionCode(tree, output);
                                    fprintf(output, "%d:    SUB  3,4,3\tOp -\n", linecode);
                                    linecode++;
                                    fprintf(output, "%d:     ST  3,%d(1)\tSave left side\n", linecode, varstart); linecode++;
                                    leftside = 1;
						        break;

						        case ddash:
					                storeVal = "--";
						        break;

						        case assign:
					                storeVal = "=";
                                    tmp = tree->child[0];
                                    if(tmp != NULL) {
                                        fprintf(output, "%d:     ST  3,%d(1)\tStore variable %s\n", linecode, tmp->offset, tmp->attr.name); linecode++;
                                    }
                                    currentOffsetName = NULL;
                                    currentOffset = 0;
                                    leftside = 1;
						        break;

						        case passign:
					                storeVal = "+=";
                                    tmp = tree->child[0];
                                    if(tmp != NULL) {
                                        fprintf(output, "%d:     LD  3,%d(1)\tLoad variable\n", linecode, varstart); linecode++;
                                        fprintf(output, "%d:     ST  3,%d(1)\tStore variable\n", linecode, varstart); linecode++;
                                        fprintf(output, "%d:     LD  3,%d(1)\tLoad variable\n", linecode, tmp->offset); linecode++;
                                        fprintf(output, "%d:     LD  4,%d(1)\tLoad left into ac1\n", linecode, varstart); linecode++;
                                        fprintf(output, "%d:    ADD  3,4,3\tOp +\n", linecode); linecode++;
                                        fprintf(output, "%d:     ST  3,%d(1)\tSave left side\n", linecode, varstart); linecode++;
                                        fprintf(output, "%d:     ST  3,%d(1)\tStore variable %s\n", linecode, tmp->offset, tmp->attr.name); linecode++;
                                    }
                                    currentOffsetName = NULL;
                                    currentOffset = 0;
                                    leftside = 1;
						        break;

						        case sassign:
					                storeVal = "-=";
						        break;

						        case massign:
					                storeVal = "*=";
						        break;

						        case dassign:
					                storeVal = "/=";
						        break;

						        case period:
					                storeVal = ".";
						        break;

						        case lsb:
					                storeVal = "[";
						        break;

						        case asterisk:
					                storeVal = "*";
                                    expressionCode(tree, output);
                                    fprintf(output, "%d:    MUL  3,4,3\tOp *\n", linecode);
                                    linecode++;
                                    fprintf(output, "%d:     ST  3,%d(1)\tSave left side\n", linecode, varstart); linecode++;
                                    leftside = 1;
                                    
						        break;

						        case fslash:
                                    printf("%d lkjhasdflkhaslkdfh\n", tree->lineno);
					                storeVal = "/";
                                    expressionCode(tree, output);
                                    fprintf(output, "%d:    DIV  3,4,3\tOp /\n", linecode);
                                    linecode++;
                                    fprintf(output, "%d:     ST  3,%d(1)\tSave left side\n", linecode, varstart); linecode++;
                                    leftside = 1;
						        break;

						        default:
						        break;
					        }
            }
        }


        switch(opTodo) {
            case 1:
                //load const int                
                fprintf(output, "%d:     LDC  3,%d(6)\tLoad int constant\n", linecode, tree->attr.value); linecode++;
                break;
            case 2:
                //load const char
                fprintf(output, "%d:     LDC  3,%d(6)\tLoad char constant\n", linecode, tree->attr.value); linecode++;
                break;
            case 3:
                //load const true
                fprintf(output, "%d:     LDC  3,1(6)\tLoad true constant\n", linecode); linecode++;
                break;
            case 4:
                //load const false
                fprintf(output, "%d:     LDC  3,0(6)\tLoad false constant\n", linecode); linecode++;
                break;
            case 5:
                //load variable array
                fprintf(output, "%d:     LD  3,%d(1)\tLoad address of base array\n", linecode, tree->offset); linecode++;
                break;
            case 6:
                //load variable
                fprintf(output, "%d:     LD  3,%d(1)\tLoad variable\n", linecode, tree->offset); linecode++;
                break;
            default:
                break;
        }


        //check scope of function
        if(curfun != NULL) {
            //check return value of function, give generic return code
            if(hasReturn == 1) {
                hasReturn = 0;
                fprintf(output, "%d:    LDA  2,0(3)\tCopy result to rt register\n", linecode); linecode++;
                fprintf(output, "%d:     LD  3,-1(1)\tLoad return address\n", linecode); linecode++;
                fprintf(output, "%d:     LD  1,0(1)\tAdjust fp\n", linecode); linecode++;
                fprintf(output, "%d:    LDA  7,0(3)\tReturn\n", linecode); linecode++;
            } 
                fprintf(output, "* Add standard closing in case there is no return statement\n");
                fprintf(output, "%d:    LDC  2,0(6)\tSet return value to 0\n", linecode); linecode++;
                fprintf(output, "%d:     LD  3,-1(1)\tLoad return address\n", linecode); linecode++;
                fprintf(output, "%d:     LD  1,0(1)\tAdjust fp\n", linecode); linecode++;
                fprintf(output, "%d:    LDA  7,0(3)\tReturn\n", linecode); linecode++;
                fprintf(output, "* END FUNCTION %s\n", curfun);
            if(strcmp("main", curfun) == 0) {
                fprintf(output, "0:    LDA  7,%d(7)\tJump to init [backpatch]\n", linecode - 1);  
            }
            curfun = NULL;
        }

        //just adding comments for compounds
        if(isCompound) {
            fprintf(output, "* END COMPOUND\n");
        }
        //make the call since parameters have been loaded
        if(isCall > 0){
            fprintf(output, "*\t\t\t Jump to %s\n",ghostFrames[counterGhost - 1].name);
            //adjusting for ghost frame            
            counterGhost--;
            fprintf(output, "%d:    LDA 1,%d(1)\tLoad address of new frame\n", linecode, ghostFrames[counterGhost].offset); linecode++;
            varstart = ghostFrames[counterGhost].offset;

            fprintf(output, "%d:    LDA 3,1(7)\tReturn address in ac\n",linecode);linecode++;
            Symbol *s = stackSearch(ghostFrames[counterGhost].name);
            fprintf(output, "%d:    LDA 7,-%d(7)\tCALL %s\n", linecode, linecode-(s->offset)+1, ghostFrames[counterGhost].name); linecode++;
            fprintf(output, "%d:    LDA 3,0(2)\tsave result in ac\n",linecode);linecode++;
            //store parameter just in case
            fprintf(output, "%d:     ST  3,%d(1)\tStore parameter\n", linecode, varstart); linecode++;

            isCall -= 1;
        }

		//Point to the next node in the AST
		tree = tree->sibling;


	}
	//END WHILE
      


	return;
}

void expressionCode(TreeNode *tree, FILE *output) {
    if(tree->child[0] != NULL && tree->child[1] != NULL) {
        //child 0 code
        //load variable from memory
        if(tree->child[0]->kind.exp == OpK) {
            fprintf(output, "%d:     LD  3,%d(1)\tLoad variable\n", linecode, varstart); linecode++;
            fprintf(output, "%d:     ST  3,%d(1)\tSave left side\n", linecode, varstart);
            linecode++; 
        } else {
            //load constant
            if(tree->child[0]->kind.exp == ConstK) {
                fprintf(output, "%d:    LDC  3,%d(6)\tLoad constant\n", linecode, tree->child[0]->attr.value); linecode++;
                fprintf(output, "%d:     ST  3,%d(1)\tSave left side\n", linecode, varstart); linecode++;
            } 
            //load variable
            else {
                fprintf(output, "%d:     LD  3,%d(1)\tLoad variable\n", linecode, tree->child[0]->offset); linecode++;
                fprintf(output, "%d:     ST  3,%d(1)\tSave left side\n", linecode, varstart); linecode++;
            }
        }
        //child 1 code
        //load variable from memory
        if(tree->child[1]->kind.exp == OpK) {
            fprintf(output, "%d:     LD  3,%d(1)\tLoad variable\n", linecode, varstart); linecode++;
            fprintf(output, "%d:     LD  4,%d(1)\tLoad left into ac1\n", linecode, varstart);
            linecode++; 
        } else {
            //load constant
            if(tree->child[1]->kind.exp == ConstK) {
                fprintf(output, "%d:    LDC  3,%d(6)\tLoad constant\n", linecode, tree->child[1]->attr.value); linecode++;
                fprintf(output, "%d:     LD  4,%d(1)\tLoad left into ac1\n", linecode, varstart); linecode++;
            } 
            //load variable
            else {
                fprintf(output, "%d:     LD  3,%d(1)\tLoad variable\n", linecode, tree->child[1]->offset); linecode++;
                fprintf(output, "%d:     LD  4,%d(1)\tLoad left into ac1\n", linecode, varstart); linecode++;
            }
        }
    }
}


void printFileInfo(char *fname, FILE* out){
    fprintf(out, "* C- compiler version C-F16\n"
    "* Built: April 13, 2018\n"
    "* Author: Franz Chavez, Erik Romero, Carlos Rubio\n"
    "* File compiled:  %s\n"
    "* \n"
    "* ** ** ** ** ** ** ** ** ** ** ** **\n", fname);
}

void genPrototypes(FILE* out){
    fprintf(out, ""
    "* FUNCTION input\n"
    "  1:     ST  3,-1(1)	Store return address \n"
    "  2:     IN  2,2,2	Grab int input \n"
    "  3:     LD  3,-1(1)	Load return address \n"
    "  4:     LD  1,0(1)	Adjust fp \n"
    "  5:    LDA  7,0(3)	Return \n"
    "* END FUNCTION input\n"
    "* \n"
    "* ** ** ** ** ** ** ** ** ** ** ** **\n"
    "* FUNCTION output\n"
    "  6:     ST  3,-1(1)	Store return address \n"
    "  7:     LD  3,-2(1)	Load parameter \n"
    "  8:    OUT  3,3,3	Output integer \n"
    "  9:    LDC  2,0(6)	Set return to 0 \n"
    " 10:     LD  3,-1(1)	Load return address \n"
    " 11:     LD  1,0(1)	Adjust fp \n"
    " 12:    LDA  7,0(3)	Return \n"
    "* END FUNCTION output\n"
    "* \n"
    "* ** ** ** ** ** ** ** ** ** ** ** **\n"
    "* FUNCTION inputb\n"
    " 13:     ST  3,-1(1)	Store return address \n"
    " 14:    INB  2,2,2	Grab bool input \n"
    " 15:     LD  3,-1(1)	Load return address \n"
    " 16:     LD  1,0(1)	Adjust fp \n"
    " 17:    LDA  7,0(3)	Return \n"
    "* END FUNCTION inputb\n"
    "* \n"
    "* ** ** ** ** ** ** ** ** ** ** ** **\n"
    "* FUNCTION outputb\n"
    " 18:     ST  3,-1(1)	Store return address \n"
    " 19:     LD  3,-2(1)	Load parameter \n"
    " 20:   OUTB  3,3,3	Output bool \n"
    " 21:    LDC  2,0(6)	Set return to 0 \n"
    " 22:     LD  3,-1(1)	Load return address \n"
    " 23:     LD  1,0(1)	Adjust fp \n"
    " 24:    LDA  7,0(3)	Return \n"
    "* END FUNCTION outputb\n"
    "* \n"
    "* ** ** ** ** ** ** ** ** ** ** ** **\n"
    "* FUNCTION inputc\n"
    " 25:     ST  3,-1(1)	Store return address \n"
    " 26:    INC  2,2,2	Grab char input \n"
    " 27:     LD  3,-1(1)	Load return address \n"
    " 28:     LD  1,0(1)	Adjust fp \n"
    " 29:    LDA  7,0(3)	Return \n"
    "* END FUNCTION inputc\n"
    "* \n"
    "* ** ** ** ** ** ** ** ** ** ** ** **\n"
    "* FUNCTION outputc\n"
    " 30:     ST  3,-1(1)	Store return address\n" 
    " 31:     LD  3,-2(1)	Load parameter \n"
    " 32:   OUTC  3,3,3	Output char \n"
    " 33:    LDC  2,0(6)	Set return to 0 \n"
    " 34:     LD  3,-1(1)	Load return address \n"
    " 35:     LD  1,0(1)	Adjust fp \n"
    " 36:    LDA  7,0(3)	Return \n"
    "* END FUNCTION outputc\n"
    "* \n"
    "* ** ** ** ** ** ** ** ** ** ** ** **\n"
    "* FUNCTION outnl\n"
    " 37:     ST  3,-1(1)	Store return address\n" 
    " 38:  OUTNL  3,3,3	Output a newline \n"
    " 39:     LD  3,-1(1)	Load return address \n"
    " 40:     LD  1,0(1)	Adjust fp \n"
    " 41:    LDA  7,0(3)	Return \n"
    "* END FUNCTION outnl\n"
    "* \n"
    "* ** ** ** ** ** ** ** ** ** ** ** **\n");
    
    //Now we need to set up the function start address information
    //these function addresses were added during addProto() call in semantic.h
}

void initPrintCode(FILE *output) {
    //done looping the tree, do init code
    fprintf(output, "* INIT\n");
    fprintf(output, "%d:     LD  0,0(0)\tSet the global pointer\n", linecode); linecode++;
    fprintf(output, "%d:    LDA  1,0(0)\tset first frame at end of globals\n", linecode); linecode++;
    fprintf(output, "%d:     ST  1,0(1)\tstore old fp (point to self)\n", linecode); linecode++;

    fprintf(output, "* INIT GLOBALS AND STATICS\n");
    fprintf(output, "* END INIT GLOBALS AND STATICS\n");
    fprintf(output, "%d:    LDA  3,1(7)\tReturn address in ac\n", linecode); linecode++;
    //TODO jump to functions may need to handle functions declared ahead of pc.
    Symbol *s = stackSearch("main");
    fprintf(output, "%d:    LDA  7,-%d(7)\tJump to main\n", linecode, linecode-(s->offset)+1); linecode++;
    fprintf(output, "%d:   HALT  0,0,0\tDONE!\n", linecode); linecode++;
    fprintf(output, "* END INIT\n");
}
