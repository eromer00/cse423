
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

int linecode = 42;

//marks if return present in compound
int hasReturn = 0;

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

    //stores name of function for comments
    char *curfun = NULL;

    int isCompound = 0;
    char* isCalling = NULL;
    /* 
    * Values for printing
    *
    * Store everything besides constants in storeVal
    * if constant a char, set storeChar to 1
    */
    char *storeVal = NULL;
    int storeInt = 0;
    int storeChar = 0;

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
				break;

				case RepeatK:
					storeVal = "While";
				break;

				case BreakK:
					storeVal = "Break";
				break;

				case ReturnK:
                    hasReturn = 1;
					storeVal = "Return";
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
				//Operational expression
				case OpK:
					switch (tree->attr.op)
					{
						case mod:
					        storeVal = "%";
						break;

						case bNOT:
					        storeVal = "NOT";
						break;

						case bAND:
					        storeVal = "AND";
						break;

						case bOR:
					        storeVal = "OR";
						break;

						case eqeq:
					        storeVal = "==";
						break;

						case neq:
					        storeVal = "!=";
						break;

						case lteq:
					        storeVal, "<=";
						break;

						case lthan:
					        storeVal = "<";
						break;

						case gteq:
					        storeVal = ">=";
						break;

						case gthan:
					        storeVal = ">";
						break;

						case qmark:
					        storeVal = "?";
						break;

						case plus:
					        storeVal = "+";
						break;

						case pplus:
					        storeVal = "++";
						break;

						case dash:
					        storeVal = "-";
						break;

						case ddash:
					        storeVal = "--";
						break;

						case assign:
					        storeVal = "=";
						break;

						case passign:
					        storeVal = "+=";
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
						break;

						case fslash:
					        storeVal = "/";
						break;

						default:
						break;
					}
				break;

				//Constant expression
				case ConstK:

					if(tree->expType != Boolean)
					{
						if(tree->expType != Char)
					        storeInt = tree->attr.value;
						else
					        storeChar = 1;
                            storeInt = tree->attr.cvalue;
					}
					else
					{
						if(tree->attr.value == 1)
					        storeVal = "true";
						else
					        storeVal = "false";
					}
				break;

				//ID expression
				case IdK:
					if(!tree->isFunc)
					{
						if(tree->isArray) { 
                            storeVal = tree->attr.name;
                        } else
					        storeVal = tree->attr.name;
					}
					else {
					    //we found a function call. Do these things:
					    //move frame pointer
					    //setup parameters
					    //store return address in ac
					    //call function
					    //save result in ac
					    printf("found a call!\n");
                        storeVal = tree->attr.name;
                        fprintf(output, "*\t\t\t Begin call to %s\n", tree->attr.name);
                        fprintf(output,"%d:     ST  1,-2(1)\tStore old fp in ghost frame\n", linecode); linecode++;
                        isCalling = tree->attr.name;
                        
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
				break;

				//Function
				case funDec:
                        fprintf(output, "* FUNCTION %s\n", tree->attr.name);
                        fprintf(output, " %d:     ST  3,-1(1)\tStore return address.\n", linecode); linecode++;
                        
                        
                        curfun = tree->attr.name;
                        storeVal = tree->attr.name;
                        
                        Symbol *s = stackSearch(curfun);
                        s->offset = linecode-1;
				break;

				//Record
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
				/*
				* Print the child tag and our child node
				*/
				printCodeTree(tree->child[i], output);
			}
		}


        //check scope of function
        if(curfun != NULL) {
            //check return value of function, give generic return code
            if(hasReturn == 0) {
                fprintf(output, "* Add standard closing in case there is no return statement\n");
                fprintf(output, " %d:    LDC  2,0(6)\tSet return value to 0\n", linecode); linecode++;
                fprintf(output, " %d:     LD  3,-1(1)\tLoad return address\n", linecode); linecode++;
                fprintf(output, " %d:     LD  1,0(1)\tAdjust fp\n", linecode); linecode++;
                fprintf(output, " %d:    LDA 7,0(3)\tReturn\n", linecode); linecode++;
            }
            fprintf(output, "* END FUNCTION %s\n", curfun);
            if(strcmp("main", curfun) == 0) {
                fprintf(output, "  0:    LDA  7,%d(7)\tJump to init [backpatch]\n", linecode - 1);  
            }
            curfun = NULL;
        }

        //just adding comments for compounds
        if(isCompound) {
            fprintf(output, "* END COMPOUND\n");
        }
        //make the call since parameters have been loaded
        if(isCalling){
            fprintf(output, "*\t\t\t Jump to %s\n",isCalling);
            fprintf(output, "%d:    LDA 1, -2(1)\tLoad address of new frame\n", linecode); linecode++;
            fprintf(output, "%d:    LDA 3, 1(7)\tReturn address in ac\n",linecode);linecode++;
            Symbol *s = stackSearch(isCalling);
            fprintf(output, "%d:    LDA 3, -%d(7)\tCALL %s\n", linecode, linecode-(s->offset)+1, isCalling); linecode++;
            fprintf(output, "%d:    LDA 3, 0(2)\tsave result in ac\n",linecode);linecode++;
        }


		//Point to the next node in the AST
		tree = tree->sibling;


        //NEW - printing prefix to better understand code generation process
        /*
        if(storeVal != NULL) {
            fprintf(output, "%s\n", storeVal);
        } else {
            if(storeChar == 1)
                fprintf(output, "%c\n", storeInt);
            else
                fprintf(output, "%d\n", storeInt);
        }
        */

	}
	//END WHILE

	return;
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
    fprintf(output, " %d:     LD  0,0(0)\tSet the global pointer\n", linecode); linecode++;
    fprintf(output, " %d:    LDA  1,0(0)\tset first frame at end of globals\n", linecode); linecode++;
    fprintf(output, " %d:     ST  1,0(1)\tstore old fp (point to self)\n", linecode); linecode++;

    fprintf(output, "* INIT GLOBALS AND STATICS\n");
    fprintf(output, "* END INIT GLOBALS AND STATICS\n");
    fprintf(output, " %d:    LDA  3,1(7)\tReturn address in ac\n", linecode); linecode++;
    //TODO jump to functions may need to handle functions declared ahead of pc.
    Symbol *s = stackSearch("main");
    fprintf(output, " %d:    LDA  7,-%d(7)\tJump to main\n", linecode, linecode-(s->offset)+1); linecode++;
    fprintf(output, " %d:   HALT  0,0,0\tDONE!\n", linecode); linecode++;
    fprintf(output, "* END INIT\n");
}
