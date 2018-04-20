
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
#include "codegen.h"
#include "printtree.h"
#include "semantic.h"


/*
* Track indentation level for AST printing
*
* identNum - Current indent level
* Macro indent increases level by 1
* Macro unindent decreases level by 1
*/
#define INDENT idNum++
#define UNINDENT idNum--
int idNum;
long pos;


/*
 * Generate TM machine code
 */
void codeGen(TreeNode* t) {

	FILE* codeout = fopen("testfile.tm","w+");
	//printf("we made it!\n");
	//printFileInfo(filename, codeout);
	//genPrototypes(codeout);
	//printSymbolTable(stdout);

    printCodeTree(t, codeout);
    printCodeTree(t, stdout);
	fclose(codeout);

	return;
}


/*
* Print the AST
*
* tree - Root node to start printing at
* tFlag - Flag to print types
*/
void printCodeTree(TreeNode* tree, FILE *output) {

    int tFlag = 0;
	/*
	* Sibling index
	*
	* Start at -1 since it increments on first run
	* Keeps track of sibling count
	*/
	int sibCnt = -1;

	/*
	* Sibling flag
	*
	* Indicate if current node is a sibling
	* This tells us to start printing Sibling tag
	*/
	int isSib = 0;

	/*
	* Child flag
	*
	* Indicate if current node had children
	* This tells us if we need to unindent
	*/
	int hadChild = 0;

	//Check if we exist before printing
	while (tree != NULL)
	{
		/*
		* If we are a sibling, print our tag and count
		*/
		if(isSib == 1)
			fprintf(output, "Sibling: %d  ", sibCnt);

		//Statement node printing
		if (tree->nodekind == StmtK)
		{
			switch (tree->kind.stmt)
			{
				case IfK:
					fprintf(output, "If");
				break;

				case RepeatK:
					fprintf(output, "While");
				break;

				case BreakK:
					fprintf(output, "Break");
				break;

				case ReturnK:
					fprintf(output, "Return");
				break;

				case CompoundK:
					fprintf(output, "Compound ");
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
							fprintf(output, "Op: %%");
						break;

						case bNOT:
							fprintf(output, "Op: not");
						break;

						case bAND:
							fprintf(output, "Op: and");
						break;

						case bOR:
							fprintf(output, "Op: or");
						break;

						case eqeq:
							fprintf(output, "Op: ==");
						break;

						case neq:
							fprintf(output, "Op: !=");
						break;

						case lteq:
							fprintf(output, "Op: <=");
						break;

						case lthan:
							fprintf(output, "Op: <");
						break;

						case gteq:
							fprintf(output, "Op: >=");
						break;

						case gthan:
							fprintf(output, "Op: >");
						break;

						case qmark:
							fprintf(output, "Op: ?");
						break;

						case plus:
							fprintf(output, "Op: +");
						break;

						case pplus:
							fprintf(output, "Assign: ++");
						break;

						case dash:
							fprintf(output, "Op: -");
						break;

						case ddash:
							fprintf(output, "Assign: --");
						break;

						case assign:
							fprintf(output, "Assign: =");
						break;

						case passign:
							fprintf(output, "Assign: +=");
						break;

						case sassign:
							fprintf(output, "Assign: -=");
						break;

						case massign:
							fprintf(output, "Assign: *=");
						break;

						case dassign:
							fprintf(output, "Assign: /=");
						break;

						case period:
							fprintf(output, "Op: .");
						break;

						case lsb:
							fprintf(output, "Op: [");
						break;

						case asterisk:
							fprintf(output, "Op: *");
						break;

						case fslash:
							fprintf(output, "Op: /");
						break;

						default:
						break;
					}
				break;

				//Constant expression
				case ConstK:

					if(tree->expType != Boolean)
					{
						fprintf(output, "Const: ");

						if(tree->expType != Char)
							fprintf(output,"%d",tree->attr.value);
						else
							fprintf(output,"'%c'",tree->attr.cvalue);
					}
					else
					{
						if(tree->attr.value == 1)
							fprintf(output, "Const: true");
						else
							fprintf(output, "Const: false");
					}
				break;

				//ID expression
				case IdK:
					if(!tree->isFunc)
					{
						fprintf(output, "Id: %s ", tree->attr.name);

						if(tree->isArray)
							fprintf(output, "is array ");
					}
					else
						fprintf(output, "Call: %s", tree->attr.name);
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

					if(!tree->isParam)
						fprintf(output, "Var %s ", tree->attr.name);
					else
						fprintf(output, "Param %s ", tree->attr.name);

					if(tree->isArray)
						fprintf(output, "is array ");
/*
					//if(tree->isStatic)
					//	fprintf(output, "is static ");

					//Check if variable is a custom type

					if(!tree->isRecord)
						switch (tree->expType)
						{
							case Void:
								fprintf(output, "of type void");
							break;

							case Integer:
								fprintf(output, "of type int");
							break;

							case Boolean:
								fprintf(output, "of type bool");
							break;

							case Char:
								fprintf(output, "of type char");
							break;

							default:
							break;
						}
					else

						//fprintf(output, "of record type %s", tree->recType);
						fprintf(output, "of type record");
*/
				break;

				//Function
				case funDec:

					//fprintf(output, "Func %s returns type ", tree->attr.name);

					fprintf(output, "Func %s ", tree->attr.name);
/*
					switch (tree->expType)
					{
						case Void:
							fprintf(output, "void");
						break;

						case Integer:
							fprintf(output, "int");
						break;

						case Boolean:
							fprintf(output, "bool");
						break;

						case Char:
							fprintf(output, "char");
						break;

						case Unknown:
							fprintf(output, "UNKNOWN");
						break;

						default:
						break;
					}
*/
				break;

				//Record
				case recDec:
					fprintf(output, "Record %s ", tree->attr.name);
				break;

				default:
				break;
			}
		}

		/*
		* Print type if tFlag is set
		*/
		if(tFlag)
		{
			//Print mem info for IDs only
			if( ((tree->nodekind == DeclK) || (tree->kind.exp == IdK)) || (tree->kind.stmt == CompoundK) )
				fprintf(output,"[ref: %d, size: %d, loc: %d]",1,tree->size,tree->offset);

			if(tree->expType != Unknown)
				fprintf(output," [type %d]", tree->expType);
			else
				fprintf(output," [undefined type]");
		}

		/*
		* Print line number of node after AST properties
		*/
		fprintf(output, " [line: %d]\n", tree->lineno);

		/*
		* Memorize our location in the output file
		* before printing the current level of indents.
		* Initially there will be none, and later if we
		* are actually leaving a child node we will have
		* to adjust the amount printed (it will be too much)
		*/
		pos = ftell(output);
		printSpaces(output,idNum);

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
				* If this is the first child, we have to increase
				* indent, print the extra indent to the already
				* printed level, and indicate we encountered a child
				*/
				if(i == 0)
				{
					INDENT;
					printSpaces(output,1);
					hadChild = 1;
				}

				/*
				* Print the child tag and our child node
				*/
				fprintf(output, "Child: %d  ", i);
				printCodeTree(tree->child[i], output);
			}
			/*
			* If child 0 doesn't exist, and one of the next childs
			* do exist, we have to increase indent anyways, print
			* the extra indent to the already printed level, and
			* indicate we encountered a child
			*/
			else if( (i == 0) && ( (tree->child[1] != NULL) || (tree->child[2] != NULL) ) )
			{
				INDENT;
				printSpaces(output,1);
				hadChild = 1;
			}
		}

		/*
		* Now that we are done printing our children,
		* we need to check if we actually did anything
		* before we print our siblings. If we did print
		* childs, we need to overwrite the preemptively
		* written indent level, unindent, then reprint
		* the correct amount
		*/
		if(hadChild) {
			removeSpace(output,pos);
			UNINDENT;
			printSpaces(output,idNum);
		}

		//Reset child flag before printing siblings
		hadChild = 0;

		//Point to the next node in the AST
		tree = tree->sibling;

		/*
		* Indicate you are now a sibling and increment
		* index, so that the first sibling is 0, etc.
		*/
		isSib = 1;
		sibCnt++;
	}
	//END WHILE

	return;
}

void printFileInfo(char *fname, FILE* out){
    fprintf(out, "* C- compiler version C-F16\n"
    "* Built: April 13, 2018\n"
    "* Author: Franz Chavez\n"
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
