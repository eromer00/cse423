
/**
 *
 * @date Spring 2018
 * @author Omar Soliman
 * @title AST functions
 *    _____
 *   /\   /\
 *  /  \ /  \
 * |    xmst |
 *  \  / \  /
 *   \/___\/
 *
 **/

//System library imports
#include<stdio.h>
#include<stdlib.h>

//AST definition import
#include "printtree.h"
#include <string.h>

//Reference line number from parser
extern int line_num;

/*
* Track indentation level for AST printing
*
* identNum - Current indent level
* Macro indent increases level by 1
* Macro unindent decreases level by 1
*/
#define INDENT identNum++
#define UNINDENT identNum--
int identNum = 0;

/*
* Position of the cursor in the output file
*
* Use to mark our place in output before
* performing write we may want to overwrite
*/
long pos;

/*
 * Expression string array
 *
 * Void    |0
 * Integer |1
 * Boolean |2
 * Char    |3
 * Unknown |4
 */
extern char* expString[5];

//Reference parser error function
void yyerror(const char* s);

/*
* Allocate new Statement node
*
* StmtKind - IfK, RepeatK, ReturnK, BreakK, CompoundK
*/
TreeNode* newStmtNode(StmtKind kind) {

	//Allocate memory for node
	TreeNode *t = (TreeNode*) malloc(sizeof(TreeNode));

	//Check for allocation success
	if(t == NULL)
		yyerror("Failure to allocate STMT node\n");

	//Initialize children to NULL
	for (int i = 0; i<MAXCHILDREN; i++)
		t->child[i] = NULL;

	//Initialize next node to NULL
	t->sibling = NULL;

	//Set node to Statement and kind
	t->nodekind = StmtK;
	t->kind.stmt = kind;

	//Set line number to parser line count
	t->lineno = line_num;

	//Zero out flags
	t->isArray = 0;
	t->isRecord = 0;
	t->isStatic = 0;
	t->isParam = 0;
	t->isFunc = 0;

	//Set return type to Unknown type default
	t->expType = Unknown;

	//Return finished node
	return t;
}

/*
* Allocate new Expression node
*
* ExpKind - OpK, ConstK, IdK
*/
TreeNode* newExpNode(ExpKind kind) {

	//Allocate memory for node
	TreeNode *t = (TreeNode*) malloc(sizeof(TreeNode));

	//Check for allocation success
	if(t == NULL)
		yyerror("Failure to allocate EXP node\n");

	//Initialize children to NULL
	for (int i = 0; i<MAXCHILDREN; i++)
		t->child[i] = NULL;

	//Initialize next node to NULL
	t->sibling = NULL;

	//Set node to Expression and kind
	t->nodekind = ExpK;
	t->kind.exp = kind;

	//Set line number to parser line count
	t->lineno = line_num;

	//Set return type to Unknown type default
	t->expType = Unknown;

	//Zero out flags
	t->isArray = 0;
	t->isRecord = 0;
	t->isStatic = 0;
	t->isParam = 0;
	t->isFunc = 0;

	//Return finished node
	return t;
}

/*
* Allocate new Declaration node
*
* DeclKind - varDec, funDec, recDec
*/
TreeNode* newDeclNode(DeclKind kind) {

	//Allocate memory for node
	TreeNode *t = (TreeNode*) malloc(sizeof(TreeNode));

	//Check for allocation success
	if(t == NULL)
		yyerror("Failure to allocate DECL node\n");

	//Initialize children to NULL
	for (int i = 0; i<MAXCHILDREN; i++)
		t->child[i] = NULL;

	//Initialize next node to NULL
	t->sibling = NULL;

	//Set node to Declaration and kind
	t->nodekind = DeclK;
	t->kind.decl = kind;

	//Set line number to parser line count
	t->lineno = line_num;

	//Zero out flags
	t->isArray = 0;
	t->isRecord = 0;
	t->isStatic = 0;
	t->isParam = 0;
	t->isFunc = 0;

	//Set return type to Unknown type default
	t->expType = Unknown;

	//Return finished node
	return t;
}

/*
 * Add input/output prototypes to AST
 *
 * tree - AST root
 */
TreeNode* addProto(TreeNode* tree) {

	int i;

	/*
	 * Allocate memory for nodes
	 *
	 * Input		- t0 int
	 * S0 Output		- t1 void
	 *    C0 Dummy int	- t7
	 * S1 InputB		- t2 bool
	 * S2 OutputB		- t3 void
	 *    C0 Dummy bool	- t8
	 * S3 InputC		- t4 char
	 * S4 OutputC		- t5 void
	 *    C0 Dummy char	- t9
	 * S5 Outnl		- t6 void
	 */
	TreeNode* t0 = (TreeNode*) malloc(sizeof(TreeNode));
	TreeNode* t1 = (TreeNode*) malloc(sizeof(TreeNode));
	TreeNode* t2 = (TreeNode*) malloc(sizeof(TreeNode));
	TreeNode* t3 = (TreeNode*) malloc(sizeof(TreeNode));
	TreeNode* t4 = (TreeNode*) malloc(sizeof(TreeNode));
	TreeNode* t5 = (TreeNode*) malloc(sizeof(TreeNode));
	TreeNode* t6 = (TreeNode*) malloc(sizeof(TreeNode));
	TreeNode* t7 = (TreeNode*) malloc(sizeof(TreeNode));
	TreeNode* t8 = (TreeNode*) malloc(sizeof(TreeNode));
	TreeNode* t9 = (TreeNode*) malloc(sizeof(TreeNode));

	//Check for allocation success
	if((t0 == NULL) || (t1 == NULL) || (t2 == NULL) || (t3 == NULL) || (t4 == NULL) || (t5 == NULL) || (t6 == NULL) || (t7 == NULL) || (t8 == NULL) || (t9 == NULL))
		yyerror("Failure to allocate proto node\n");

	//Assign names
	t0->attr.name = strdup("input");
	t1->attr.name = strdup("output");
	t2->attr.name = strdup("inputb");
	t3->attr.name = strdup("outputb");
	t4->attr.name = strdup("inputc");
	t5->attr.name = strdup("outputc");
	t6->attr.name = strdup("outnl");
	t7->attr.name = strdup("*dummy*");
	t8->attr.name = strdup("*dummy*");
	t9->attr.name = strdup("*dummy*");

	//Initialize children to NULL
	for (i = 0; i<MAXCHILDREN; i++)
	{
		t0->child[i] = NULL;
		t1->child[i] = NULL;
		t2->child[i] = NULL;
		t3->child[i] = NULL;
		t4->child[i] = NULL;
		t5->child[i] = NULL;
		t6->child[i] = NULL;
		t7->child[i] = NULL;
		t8->child[i] = NULL;
		t9->child[i] = NULL;
	}

	//Assign children
	t1->child[0] = t7;
	t3->child[0] = t8;
	t5->child[0] = t9;

	//Initialize next node to NULL
	t0->sibling = t1;
	t1->sibling = t2;
	t2->sibling = t3;
	t3->sibling = t4;
	t4->sibling = t5;
	t5->sibling = t6;
	t6->sibling = tree;

	//Set node to Declaration and fundec
	t0->nodekind = DeclK;
	t0->kind.decl = funDec;
	t1->nodekind = DeclK;
	t1->kind.decl = funDec;
	t2->nodekind = DeclK;
	t2->kind.decl = funDec;
	t3->nodekind = DeclK;
	t3->kind.decl = funDec;
	t4->nodekind = DeclK;
	t4->kind.decl = funDec;
	t5->nodekind = DeclK;
	t5->kind.decl = funDec;
	t6->nodekind = DeclK;
	t6->kind.decl = funDec;

	//Set parameters to vardec
	t7->nodekind = DeclK;
	t7->kind.decl = varDec;
	t8->nodekind = DeclK;
	t8->kind.decl = varDec;
	t9->nodekind = DeclK;
	t9->kind.decl = varDec;

	//Set line number to -1
	t0->lineno = -1;
	t1->lineno = -1;
	t2->lineno = -1;
	t3->lineno = -1;
	t4->lineno = -1;
	t5->lineno = -1;
	t6->lineno = -1;
	t7->lineno = -1;
	t8->lineno = -1;
	t9->lineno = -1;

	//Zero out flags
	t0->isArray = t1->isArray = t2->isArray = t3->isArray = t4->isArray = t5->isArray = t6->isArray = t7->isArray = t8->isArray = t9->isArray = 0;
	t0->isRecord = t1->isRecord = t2->isRecord = t3->isRecord = t4->isRecord = t5->isRecord = t6->isRecord = t7->isRecord = t8->isRecord = t9->isRecord = 0;
	t0->isStatic = t1->isStatic = t2->isStatic = t3->isStatic = t4->isStatic = t5->isStatic = t6->isStatic = t7->isStatic = t8->isStatic = t9->isStatic = 0;
	t0->isFunc = t1->isFunc = t2->isFunc = t3->isFunc = t4->isFunc = t5->isFunc = t6->isFunc = 1; t7->isFunc = t8->isFunc = t9->isFunc = 0;
	t0->isParam = t1->isParam = t2->isParam = t3->isParam = t4->isParam = t5->isParam = t6->isParam = 0; t7->isParam = t8->isParam = t9->isParam = 1;

	//Set return types
	t0->expType = Integer;
	t1->expType = Void;
	t2->expType = Boolean;
	t3->expType = Void;
	t4->expType = Char;
	t5->expType = Void;
	t6->expType = Void;
	t7->expType = Integer;
	t8->expType = Boolean;
	t9->expType = Char;

	//Return new root
	return t0;
}

/*
* Print indent level in AST
*
* out - File pointer to print to
*/
void printSpaces(FILE* out, int z) {

	//Print indent chars repeatedly
	for (int i = 0; i < z; i++)
		fprintf(out, "!   ");
}

/*
* Indents are printed preemptively before the code
* can indicate an unindent. This function removes
* an extra indent that was already printed by
* moving the cursor back and reprinting the 
* correct number of indents. This results in 
* correct appearance both in STDOUT and file
*/
void removeSpace(FILE* out, long placeholder) {

	/*
	* Print 4 backspaces per indent. This allows
	* stdout to be happy and display properly
	* that the current indent level will be cleared
	*/
	for (int i = 0; i<identNum; i++)
		fprintf(out,"\b\b\b\b");

	/*
	* However we still need to overwrite the prior
	* indents with the correct amount. Move the cursor
	* to the old position before the incorrect
	* indents were printed
	*/
	fseek(out,placeholder,SEEK_SET);
}

/*
* Print warning and error count
*
* wno - Number of warnings
* eno - Number of errors
*/

/*
* Print the AST
*
* tree - Root node to start printing at
* tFlag - Flag to print types
*/
void printTree(TreeNode* tree, int tFlag) {

	FILE* output = stdout;

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
					yyerror("Unknown Statement");
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
							yyerror("Unknown op type");
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
					yyerror("Unknown Expression");
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
								yyerror("Unknown var return type");
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
							yyerror("Unknown function return type");
						break;
					}
*/
				break;

				//Record
				case recDec:
					fprintf(output, "Record %s ", tree->attr.name);
				break;

				default:
					yyerror("Unknown Declaration");
				break;
			}
		}
		else
			yyerror("Unknown node");

		/*
		* Print type if tFlag is set
		*/
		if(tFlag)
		{
			//Print mem info for IDs only
			if( ((tree->nodekind == DeclK) || (tree->kind.exp == IdK)) || (tree->kind.stmt == CompoundK) )
				fprintf(output,"[ref: %s, size: %d, loc: %d]",refString[tree->ref],tree->size,tree->offset);

			if(tree->expType != Unknown)
				fprintf(output," [type %s]", expString[tree->expType]);
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
		printSpaces(output,identNum);

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
				printTree(tree->child[i], tFlag);
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
			printSpaces(output,identNum);
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
//END printTREE
