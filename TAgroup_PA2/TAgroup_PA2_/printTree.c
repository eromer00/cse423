
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
#include "printTree.h"
#include <string.h>

//Reference line number from parser
extern int line_num;

/*
* Track indentation level for AST printing?
*/


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

	t->size = 0;
	t->offset = 0;
	t->ref = 0;

	//Set return type to default
	t->expType = Void;

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
		if (tree->nodekind == StmtK)
		{
			switch (tree->kind.stmt)
			{

			}
		}
		//Expression node printing
		else if 

		//Declaration node printing
		else if (tree->nodekind == DeclK)
		
		else
			yyerror("Unknown node");

//Print kids after we finish
		for (int i = 0; i < MAXCHILDREN; i++)
		{
			if(tree->child[i] != NULL)
			{
				printTree(tree->child[i]);
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
