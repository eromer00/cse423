
/*
    Group: Spaghet_Code
    Members: Erik Romero, Carlos Rubio, Franz Chavez
    File: printTree.c
    Description: program to print the tree gathered by the parser c- language
*/

//System library imports
#include<stdio.h>
#include<stdlib.h>

//AST definition import
#include "printTree.h"
#include <string.h>

//Reference line number from parser
extern int line_num;

//declare treeHead
TreeNode *treeHead = NULL;

/*
* Track indentation level for AST printing?
*/
int indent_level = 0;

//Reference parser error function
void yyerror(const char* s);

/*
* Allocate new Statement node
*/
TreeNode* newStmtNode(StmtKind kind) {

	//Allocate memory for node
	TreeNode *t = (TreeNode*) malloc(sizeof(TreeNode));

	//Check for allocation success
	if(t == NULL)
		yyerror("Failure to allocate STMT node\n");

	//Initialize children to NULL
	for (int i = 0; i < MAXCHILDREN; i++)
		t->child[i] = NULL;

	//Initialize next node to NULL
	t->sibling = NULL;

	//Set node to Statement and kind
	t->nodekind = STMT;
	t->kind.stmt = kind;

	//Set line number to parser line count
	t->lineno = line_num;

	//Zero out flags
	t->isArray = 0;
	t->isRecord = 0;
	t->isStatic = 0;
	t->isParam = 0;
	t->isFunc = 0;

	/*t->size = 0;
	t->offset = 0;
	t->ref = 0;
	*/
	//Set return type to default
	t->expType = VOID;

	//Return finished node
	return t;
}

/*
* Allocate new Decl node
*/
TreeNode* newDeclNode(DeclKind kind) {

	//Allocate memory for node
	TreeNode *t = (TreeNode*) malloc(sizeof(TreeNode));

	//Check for allocation success
	if(t == NULL)
		yyerror("Failure to allocate STMT node\n");

	//Initialize children to NULL
	for (int i = 0; i < MAXCHILDREN; i++)
		t->child[i] = NULL;

	//Initialize next node to NULL
	t->sibling = NULL;

	//Set node to Statement and kind
	t->nodekind = DECL;
	t->kind.decl = kind;

	//Set line number to parser line count
	t->lineno = line_num;

	//Zero out flags
	t->isArray = 0;
	t->isRecord = 0;
	t->isStatic = 0;
	t->isParam = 0;
	t->isFunc = 0;

	/*t->size = 0;
	t->offset = 0;
	t->ref = 0;
	*/
	//Set return type to default
	t->expType = VOID;

	//Return finished node
	return t;
}

/*
* Allocate new Expression node
*/
TreeNode* newExpNode(ExpKind kind) {

	//Allocate memory for node
	TreeNode *t = (TreeNode*) malloc(sizeof(TreeNode));

	//Check for allocation success
	if(t == NULL)
		yyerror("Failure to allocate STMT node\n");

	//Initialize children to NULL
	for (int i = 0; i < MAXCHILDREN; i++)
		t->child[i] = NULL;

	//Initialize next node to NULL
	t->sibling = NULL;

	//Set node to Statement and kind
	t->nodekind = EXP;
	t->kind.exp = kind;

	//Set line number to parser line count
	t->lineno = line_num;

	//Zero out flags
	t->isArray = 0;
	t->isRecord = 0;
	t->isStatic = 0;
	t->isParam = 0;
	t->isFunc = 0;

	/*t->size = 0;
	t->offset = 0;
	t->ref = 0;
	*/
	//Set return type to default
	switch(kind){
	    case OP:
	    	t->expType = NUM;
	        break;
        case CONST:
            t->expType = NUM;
            break;
        case ID:
            t->expType = VOID; // we need to think about this
	};

	//Return finished node
	return t;
}

/*
* Print the AST
*/
void printTree(FILE* output, TreeNode* tree) {

	//Check if we exist before printing
	while (tree != NULL)
	{
		
		//Statement node printing
		if (tree->nodekind == STMT)
		{
			switch (tree->kind.stmt)
			{

			}
		}
		//Expression node printing
		else if (tree->nodekind == EXP)
			printf("EXP\n");

		//Declaration node printing
		else if (tree->nodekind == DECL)
			printf("DECL\n");
		else
			yyerror("Unknown node");

//Print kids after we finish
		for (int i = 0; i < MAXCHILDREN; i++)
		{
			if(tree->child[i] != NULL)
			{
				printTree(output, tree->child[i]);
			}

			//...waht if child0 doesnt exist, but other children do tho?
		}

		//Point to the next node in the AST
		tree = tree->sibling;

	}
	//END WHILE

	return;
}
//END printTREE
