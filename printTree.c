
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
	    	t->expType = NUMB;
	        break;
        case CONST:
            t->expType = NUMB;
            break;
        case ID:
            t->expType = VOID; // we need to think about this
	};

	//Return finished node
	return t;
}

/*
* Insert the new child node into the given node
*/
void insertChild(TreeNode *tree, TreeNode *n){
	int c;
	if(tree != NULL){
	    while(c < MAXCHILDREN){
	        if(tree->child[c] == NULL){
	            tree->child[c] = n;
	            return;
	        }
	        c++;
	    }
	    yyerror("InsertChild: Out of space! Max number of children allocated!");
	}else{
	    yyerror("InsertChild: attempted to insert child to NULL parent!");
	}
}
/*
* Insert the new sibling node into the given node
*/
void insertSibling(TreeNode *tree, TreeNode *n){
    TreeNode *t = tree;
	if(t != NULL)
	{
	    while(t->sibling != NULL)
		    t = t->sibling;

	    t->sibling = n;
	}
	else
		yyerror("InsertSibling: NULL param tree!");
}

TreeNode* hardCode(){

  TreeNode* tree = newDeclNode(0);
  tree->attr.name = "gromit";
  tree->expType = 1;
  tree->isArray = 0;
  tree->lineno = 6;

  TreeNode* n = newDeclNode(0);
  n->attr.name = "shaun";
  n->expType = 1;
  n->isArray = 1;
  n->lineno = 6;
  insertSibling(tree, n);

  n = newDeclNode(1);
  n->attr.name="wallace";
  n->expType = 0;
  n->isArray = 0;
  n->lineno = 8;
  insertSibling(tree,n);

  n = newDeclNode(0);
  n->attr.name="wrong";
  n->expType=1;
  n->isArray=0;
  n->lineno=8;
  n->isParam=1;


  TreeNode* n1 = newDeclNode(0);
  n1->attr.name="trousers";
  n1->expType=1;
  n1->isArray=0;
  n1->lineno=8;
  n1->isParam=1;
  insertSibling(n, n1);

  n1 = newDeclNode(0);
  n1->attr.name="sheep";
  n1->expType=1;
  n1->isArray=0;
  n1->lineno=8;
  n1->isParam=1;
  insertSibling(n, n1);

  insertChild(tree->sibling->sibling,n);

  n = newStmtNode(4);
  n->attr.name="{";
  n->expType=0;
  n->isArray=0;
  n->lineno=9;
  n->isParam=0;

  insertChild(tree->sibling->sibling,n);

  TreeNode* p = tree->sibling->sibling->child[1];

  n = newDeclNode(0);
  n->attr.name="close";
  n->expType=2;
  n->isArray=0;
  n->lineno=10;
  n->isParam=0;

  insertChild(p,n);

  n = newExpNode(1);
  n->attr.name="true";
  //n->expType=2;
  //n->isArray=0;
  n->lineno=10;
  //n->isParam=0;
  insertChild(p->child[0],n);

  n = newDeclNode(0);
  n->attr.name="shave";
  n->expType=2;
  n->isArray=0;
  n->lineno=10;
  n->isParam=0;

  insertSibling(p->child[0],n);

  n = newExpNode(1);
  n->attr.name="false";
  //n->expType=2;
  //n->isArray=0;
  n->lineno=10;
  //n->isParam=0;
  insertChild(p->child[0]->sibling,n);

  n = newExpNode(1);
  n->attr.name="1729";
  //n->expType=2;
  //n->isArray=0;
  n->lineno=12;
  //n->isParam=0;
  insertChild(p,n);

  n = newExpNode(2);
  n->attr.name="close";
  //n->expType=2;
  //n->isArray=0;
  n->lineno=13;
  //n->isParam=0;
  insertSibling(p->child[1],n);

  n = newExpNode(0);
  n->attr.op=plus;
  //n->expType=2;
  //n->isArray=0;
  n->lineno=14;
  //n->isParam=0;
  insertSibling(p->child[1],n);



  return tree;
}

/*
* Print the AST
*/
void printTree(FILE* output, TreeNode* tree) {
  //printf("HERE\n");
  int sib = 0;

  //Check if we exist before printing
	while (tree != NULL)
	{

		//Statement node printing
	  if (tree->nodekind == STMT)
		{
			switch (tree->kind.stmt)
			{
        case 0:
          fprintf(output, "If");
          break;
        case 1:
          fprintf(output, "While");
          break;
        case 2:
          fprintf(output, "Return");
          break;
        case 3:
          fprintf(output, "Break");
          break;
        case 4:
          fprintf(output, "Compound");
          break;
        case 5:
          fprintf(output, "Call");
          break;
			}
      fprintf(output, " [line: %d]\n", tree->lineno);
		}
		//Expression node printing
		else if (tree->nodekind == EXP){
      switch (tree->kind.exp){
        case 0:
          switch(tree->attr.op){
            case 0:
              fprintf(output, "Op: + [line: %d]\n", tree->lineno);
              break;
            case 1:
              fprintf(output, "Assign: ++ [line: %d]\n", tree->lineno);
              break;
            case 2:
              fprintf(output, "Op: - [line: %d]\n", tree->lineno);
              break;
            case 3:
              fprintf(output, "Assign: -- [line: %d]\n", tree->lineno);
              break;
            case 4:
              fprintf(output, "Assign: = [line: %d]\n", tree->lineno);
              break;
            case 5:
              fprintf(output, "Assign: += [line: %d]\n", tree->lineno);
              break;
            case 6:
              fprintf(output, "Assign: -= [line: %d]\n", tree->lineno);
              break;
            case 7:
              fprintf(output, "Assign: /= [line: %d]\n", tree->lineno);
              break;
            case 8:
              fprintf(output, "Op: * [line: %d]\n", tree->lineno);
              break;
            case 9:
              fprintf(output, "Op: / [line: %d]\n", tree->lineno);
              break;
            case 10:
              fprintf(output, "Op: NOT [line: %d]\n", tree->lineno);
              break;
            case 11:
              fprintf(output, "Op: AND [line: %d]\n", tree->lineno);
              break;
            case 12:
              fprintf(output, "Op: OR [line: %d]\n", tree->lineno);
              break;
            case 13:
              fprintf(output, "Op: == [line: %d]\n", tree->lineno);
              break;
            case 14:
              fprintf(output, "Op: != [line: %d]\n", tree->lineno);
              break;
            case 15:
              fprintf(output, "Op: <= [line: %d]\n", tree->lineno);
              break;
            case 16:
              fprintf(output, "Op: < [line: %d]\n", tree->lineno);
              break;
            case 17:
              fprintf(output, "Op: >= [line: %d]\n", tree->lineno);
              break;
            case 18:
              fprintf(output, "Op: > [line: %d]\n", tree->lineno);
              break;
            case 19:
              fprintf(output, "Op: ? [line: %d]\n", tree->lineno);
              break;
            case 20:
              fprintf(output, "Op: %% [line: %d]\n", tree->lineno);
              break;
            case 21:
              fprintf(output, "Op: [ [line: %d]\n", tree->lineno);
              break;
            case 22:
              fprintf(output, "Op: . [line: %d]\n", tree->lineno);
              break;
            case 23:
              fprintf(output, "Op: : [line: %d]\n", tree->lineno);
              break;
          }
          break;
        case 1:
          fprintf(output, "Const: %s [line: %d]\n", tree->attr.name, tree->lineno);
          break;
        case 2:
          fprintf(output, "Id: %s [line: %d]\n", tree->attr.name, tree->lineno);
          break;
      }
    }

		//Declaration node printing
		else if (tree->nodekind == DECL){

      //checking what kind of declaration we are working with
      switch (tree->kind.decl)
			{
        //case it is a variable
        case 0:
          if( tree->isParam ){
            fprintf(output, "Param ");
          }
          else{
            fprintf(output, "Var ");
          }
          if( !tree->isArray )
            fprintf(output, "%s of type ", tree->attr.name);
          else
            fprintf(output, "%s is array of type ", tree->attr.name);
          //checking the type of variable it is
          switch (tree->expType)
          {
            //case the variable is void
            case 0:
              fprintf(output, "void [line: %d]", tree->lineno);
              break;

            //case the variable is integer
            case 1:
              fprintf(output, "int [line: %d]", tree->lineno);
              break;

            //case the variable is bool
            case 2:
              fprintf(output, "bool [line: %d]", tree->lineno);
              break;

            //case the variable is a character
            case 3:
              fprintf(output, "char [line: %d]", tree->lineno);
              break;
          }
          break;

        //case the declaration is for a function
        case 1:
          fprintf(output, "Func %s returns type ", tree->attr.name);

          //checking what type the function returns`
          switch (tree->expType)
          {
            //case returns void
            case 0:
              fprintf(output, "void [line: %d]", tree->lineno);
              break;

            //case return integer
            case 1:
              fprintf(output, "int [line: %d]", tree->lineno);
              break;

            //case returns bool
            case 2:
              fprintf(output, "bool [line: %d]", tree->lineno);
              break;

            //case returns char
            case 3:
              fprintf(output, "char [line: %d]", tree->lineno);
              break;
          }
          break;

        case 2:
          fprintf(output, "Record %s [line: %d]", tree->attr.name, tree->lineno);
          break;

			}
      printf("\n");
    }
		else
			yyerror("Unknown node");

//Print kids after we finish
    int increment = 1;
		for (int i = 0; i < MAXCHILDREN; i++)
		{
			if(tree->child[i] != NULL)
			{
        for( int j = 0; j < indent_level+1; j++){
          fprintf(output, "!    ");
        }
        fprintf(output, "Child: %d  ",i);
        indent_level++;
				printTree(output, tree->child[i] );
        indent_level--;
			}

			//...waht if child0 doesnt exist, but other children do tho?
		}

		//Point to the next node in the AST
    tree = tree->sibling;
    if(tree){
      for( int i = 0; i < indent_level; i++){
        fprintf(output, "!    ");
      }
      fprintf(output, "Sibling: %d  ", sib);
      sib++;
    }
	}
	//END WHILE

	return;
}

/*
void printTree(FILE* output, TreeNode* tree, int indent, int sibl) {
    int i, cld;
    if(tree != NULL) {
        if(indent > 0) printf("!");
        for(i = 0; i < 4 * indent; i++) {
            printf(" ");
        }

        printf("%s\n", tree->attr.name);
        if(tree->sibling != NULL) {
            if(indent > 0) printf("!");
            for(i = 0; i < 4 * indent; i++) {
                printf(" ");
            }
            printf("Sibling%s\n", tree->sibling->attr.name);
            printTree(output, tree->sibling, indent, sibl + 1);
        }
        cld = 0;
        while(cld < MAXCHILDREN) {
            if(tree->child[cld] != NULL) {
                if(indent > 0) printf("!");
                for(i = 0; i < 4 * indent; i++) {
                    printf(" ");
                }
                printf("Child[%d]:%s\n", cld, tree->child[cld]->attr.name);
                printTree(output, tree->child[cld], indent + 1, 0);
            } else {
                break;
            }
        }
    }
} */
//END printTREE
