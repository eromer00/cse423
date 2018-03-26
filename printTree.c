
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
static int num_errors = 0;
static int num_warnings = 0;
int indent_level = 0;

//Reference parser error function
void yyerror(const char* s);


/*
* Allocate new Statement node
*/
TreeNode* newStmtNode(StmtKind kind) {
	int i;
	//Allocate memory for node
	TreeNode *t = (TreeNode*) malloc(sizeof(TreeNode));

	//Check for allocation success
	if(t == NULL)
		yyerror("Failure to allocate STMT node\n");

	//Initialize children to NULL
	for (i = 0; i < MAXCHILDREN; i++)
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
	int i;
	//Allocate memory for node
	TreeNode *t = (TreeNode*) malloc(sizeof(TreeNode));

	//Check for allocation success
	if(t == NULL)
		yyerror("Failure to allocate STMT node\n");

	//Initialize children to NULL
	for (i = 0; i < MAXCHILDREN; i++)
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
	int i;
	//Allocate memory for node
	TreeNode *t = (TreeNode*) malloc(sizeof(TreeNode));

	//Check for allocation success
	if(t == NULL)
		yyerror("Failure to allocate STMT node\n");

	//Initialize children to NULL
	for (i = 0; i < MAXCHILDREN; i++)
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
	int c = 0;
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
  n->attr.op=PLUS;
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
        case IF:
          fprintf(output, "If");
          break;
        case WHILE:
          fprintf(output, "While");
          break;
        case RETURN:
          fprintf(output, "Return");
          break;
        case BREAK:
          fprintf(output, "Break");
          break;
        case COMP:
          fprintf(output, "Compound");
          break;
        case CALL:
          fprintf(output, "Call: %s", tree->attr.name);
          break;
			}
      fprintf(output, " [line: %d]\n", tree->lineno);
		}
		//Expression node printing
		else if (tree->nodekind == EXP){
      switch (tree->kind.exp){
        case OP:
          switch(tree->attr.op){
            case PLUS:
              fprintf(output, "Op: + [line: %d]\n", tree->lineno);
              break;
            case PPLUS:
              fprintf(output, "Assign: ++ [line: %d]\n", tree->lineno);
              break;
            case DASH:
              fprintf(output, "Op: - [line: %d]\n", tree->lineno);
              break;
            case DDASH:
              fprintf(output, "Assign: -- [line: %d]\n", tree->lineno);
              break;
            case ASSIGN:
              fprintf(output, "Assign: = [line: %d]\n", tree->lineno);
              break;
            case PASSIGN:
              fprintf(output, "Assign: += [line: %d]\n", tree->lineno);
              break;
            case SASSIGN:
              fprintf(output, "Assign: -= [line: %d]\n", tree->lineno);
              break;
            case MASSIGN:
              fprintf(output, "Assign: *= [line: %d]\n", tree->lineno);
              break;
            case DASSIGN:
              fprintf(output, "Assign: /= [line: %d]\n", tree->lineno);
              break;
            case ASTERISK:
              fprintf(output, "Op: * [line: %d]\n", tree->lineno);
              break;
            case FSLASH:
              fprintf(output, "Op: / [line: %d]\n", tree->lineno);
              break;
            case BNOT:
              fprintf(output, "Op: not [line: %d]\n", tree->lineno);
              break;
            case BAND:
              fprintf(output, "Op: and [line: %d]\n", tree->lineno);
              break;
            case BOR:
              fprintf(output, "Op: or [line: %d]\n", tree->lineno);
              break;
            case EQCP:
              fprintf(output, "Op: == [line: %d]\n", tree->lineno);
              break;
            case NEQ:
              fprintf(output, "Op: != [line: %d]\n", tree->lineno);
              break;
            case LTEQ:
              fprintf(output, "Op: <= [line: %d]\n", tree->lineno);
              break;
            case LTHAN:
              fprintf(output, "Op: < [line: %d]\n", tree->lineno);
              break;
            case GTHANEQ:
              fprintf(output, "Op: >= [line: %d]\n", tree->lineno);
              break;
            case GTHAN:
              fprintf(output, "Op: > [line: %d]\n", tree->lineno);
              break;
            case QMARK:
              fprintf(output, "Op: ? [line: %d]\n", tree->lineno);
              break;
            case MOD:
              fprintf(output, "Op: %% [line: %d]\n", tree->lineno);
              break;
            case LSB:
              fprintf(output, "Op: [ [line: %d]\n", tree->lineno);
              break;
            case PERIODK:
              fprintf(output, "Op: . [line: %d]\n", tree->lineno);
              break;
            case COLONK:
              fprintf(output, "Op: : [line: %d]\n", tree->lineno);
              break;
          }
          break;
        case CONST:
          if(tree->expType == TF)
            fprintf(output, "Const: %s [line: %d]\n", tree->attr.name, tree->lineno);
          else if (tree->expType == SINGLE)
            fprintf(output, "Const: '%c' [line: %d]\n", tree->attr.value, tree->lineno);
          else
            fprintf(output, "Const: %d [line: %d]\n", tree->attr.value, tree->lineno);
          break;
        case ID:
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
        case VAR:
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
            //case the variable is void, print recType
            case VOID:
              //fprintf(output, "%s [line: %d]", tree->recType, tree->lineno);
              fprintf(output, "record [line: %d]", tree->lineno);
              break;

            //case the variable is integer
            case NUMB:
              fprintf(output, "int [line: %d]", tree->lineno);
              break;

            //case the variable is bool
            case TF:
              fprintf(output, "bool [line: %d]", tree->lineno);
              break;

            //case the variable is a character
            case SINGLE:
              fprintf(output, "char [line: %d]", tree->lineno);
              break;
          }
          break;

        //case the declaration is for a function
        case FUNC:
          fprintf(output, "Func %s returns type ", tree->attr.name);

          //checking what type the function returns`
          switch (tree->expType)
          {
            //case returns void
            case VOID:
              fprintf(output, "void [line: %d]", tree->lineno);
              break;

            //case return integer
            case NUMB:
              fprintf(output, "int [line: %d]", tree->lineno);
              break;

            //case returns bool
            case TF:
              fprintf(output, "bool [line: %d]", tree->lineno);
              break;

            //case returns char
            case SINGLE:
              fprintf(output, "char [line: %d]", tree->lineno);
              break;
          }
          break;

        case REC:
          fprintf(output, "Record %s  [line: %d]", tree->attr.name, tree->lineno);
          break;

			}
      printf("\n");
    }
		else
			yyerror("Unknown node");

//Print kids after we finish
    int increment = 1;
		int i, j;
		for (i = 0; i < MAXCHILDREN; i++)
		{
			if(tree->child[i] != NULL)
			{
                for(j = 0; j < indent_level+1; j++){
                  fprintf(output, "!   ");
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
      for(i = 0; i < indent_level; i++){
        fprintf(output, "!   ");
      }
      fprintf(output, "Sibling: %d  ", sib);
      sib++;
    }
	}
	//END WHILE


	return;
}


/*
* Print the AST with typing
*/
void printPTree(FILE* output, TreeNode* tree) {
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
        case IF:
          fprintf(output, "If %s", typeHelper(0));
          break;
        case WHILE:
          fprintf(output, "While %s", typeHelper(0));
          break;
        case RETURN:
          fprintf(output, "Return %s", typeHelper(0));
          break;
        case BREAK:
          fprintf(output, "Break %s", typeHelper(0));
          break;
        case COMP:
          fprintf(output, "Compound %s", typeHelper(0));
          break;
        case CALL:
          fprintf(output, "Call: %s %s", tree->attr.name, typeHelper(0));
          break;
			}
      fprintf(output, " [line: %d]\n", tree->lineno);
		}
		//Expression node printing
		else if (tree->nodekind == EXP){
      switch (tree->kind.exp){
        case OP:
          switch(tree->attr.op){
            case PLUS:
              fprintf(output, "Op: + %s [line: %d]\n", typeHelper(1), tree->lineno);
              break;
            case PPLUS:
              fprintf(output, "Assign: ++ %s [line: %d]\n", typeHelper(1), tree->lineno);
              break;
            case DASH:
              fprintf(output, "Op: - %s [line: %d]\n", typeHelper(1), tree->lineno);
              break;
            case DDASH:
              fprintf(output, "Assign: -- %s [line: %d]\n", typeHelper(1), tree->lineno);
              break;
            case ASSIGN:
              fprintf(output, "Assign: = %s [line: %d]\n", typeHelper(1), tree->lineno);
              break;
            case PASSIGN:
              fprintf(output, "Assign: += %s [line: %d]\n", typeHelper(1), tree->lineno);
              break;
            case SASSIGN:
              fprintf(output, "Assign: -= %s [line: %d]\n", typeHelper(1), tree->lineno);
              break;
            case MASSIGN:
              fprintf(output, "Assign: *= %s [line: %d]\n", typeHelper(1), tree->lineno);
              break;
            case DASSIGN:
              fprintf(output, "Assign: /= %s [line: %d]\n", typeHelper(1), tree->lineno);
              break;
            case ASTERISK:
              fprintf(output, "Op: * %s [line: %d]\n", typeHelper(1), tree->lineno);
              break;
            case FSLASH:
              fprintf(output, "Op: / %s [line: %d]\n", typeHelper(1), tree->lineno);
              break;
            case BNOT:
              fprintf(output, "Op: not %s [line: %d]\n", typeHelper(2), tree->lineno);
              break;
            case BAND:
              fprintf(output, "Op: and %s [line: %d]\n", typeHelper(2), tree->lineno);
              break;
            case BOR:
              fprintf(output, "Op: or %s [line: %d]\n", typeHelper(2), tree->lineno);
              break;
            case EQCP:
              fprintf(output, "Op: == %s [line: %d]\n", typeHelper(2), tree->lineno);
              break;
            case NEQ:
              fprintf(output, "Op: != %s [line: %d]\n", typeHelper(2), tree->lineno);
              break;
            case LTEQ:
              fprintf(output, "Op: <= %s [line: %d]\n", typeHelper(2), tree->lineno);
              break;
            case LTHAN:
              fprintf(output, "Op: < %s [line: %d]\n", typeHelper(2), tree->lineno);
              break;
            case GTHANEQ:
              fprintf(output, "Op: >= %s [line: %d]\n", typeHelper(2), tree->lineno);
              break;
            case GTHAN:
              fprintf(output, "Op: > %s [line: %d]\n", typeHelper(2), tree->lineno);
              break;
            case QMARK:
              fprintf(output, "Op: ? %s [line: %d]\n", typeHelper(1), tree->lineno);
              break;
            case MOD:
              fprintf(output, "Op: %% %s [line: %d]\n", typeHelper(1), tree->lineno);
              break;
            case LSB:
              fprintf(output, "Op: [ %s [line: %d]\n", typeHelper(1), tree->lineno);
              break;
            case PERIODK:
              fprintf(output, "Op: . %s [line: %d]\n", typeHelper(1), tree->lineno);
              break;
            case COLONK:
              fprintf(output, "Op: : %s [line: %d]\n", typeHelper(1), tree->lineno);
              break;
          }
          break;
        case CONST:
          if(tree->expType == TF)
            fprintf(output, "Const: %s %s [line: %d]\n", tree->attr.name, typeHelper(2), tree->lineno);
          else if (tree->expType == SINGLE)
            fprintf(output, "Const: '%c' %s [line: %d]\n", tree->attr.value, typeHelper(3), tree->lineno);
          else
            fprintf(output, "Const: %d %s [line: %d]\n", tree->attr.value, typeHelper(1), tree->lineno);
          break;
        case ID:
          fprintf(output, "Id: %s %s[line: %d]\n", tree->attr.name, typeHelper(tree->expType), tree->lineno);
          break;
      }
    }

		//Declaration node printing
		else if (tree->nodekind == DECL){

      //checking what kind of declaration we are working with
      switch (tree->kind.decl)
			{
        //case it is a variable
        case VAR:
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
            //case the variable is void, print recType
            case VOID:
              //fprintf(output, "%s [line: %d]", tree->recType, tree->lineno);
              fprintf(output, "record [line: %d]", tree->lineno);
              break;

            //case the variable is integer
            case NUMB:
              fprintf(output, "int %s [line: %d]", typeHelper(1), tree->lineno);
              break;

            //case the variable is bool
            case TF:
              fprintf(output, "bool %s [line: %d]", typeHelper(3), tree->lineno);
              break;

            //case the variable is a character
            case SINGLE:
              fprintf(output, "char %s [line: %d]", typeHelper(3), tree->lineno);
              break;
          }
          break;

        //case the declaration is for a function
        case FUNC:
          fprintf(output, "Func %s returns type ", tree->attr.name);

          //checking what type the function returns`
          switch (tree->expType)
          {
            //case returns void
            case VOID:
              fprintf(output, "void %s [line: %d]", typeHelper(0), tree->lineno);
              break;

            //case return integer
            case NUMB:
              fprintf(output, "int %s [line: %d]", typeHelper(1), tree->lineno);
              break;

            //case returns bool
            case TF:
              fprintf(output, "bool %s [line: %d]", typeHelper(2), tree->lineno);
              break;

            //case returns char
            case SINGLE:
              fprintf(output, "char %s [line: %d]", typeHelper(3), tree->lineno);
              break;
          }
          break;

        case REC:
          fprintf(output, "Record %s  %s [line: %d]", tree->attr.name, typeHelper(tree->expType), tree->lineno);
          break;

			}
      printf("\n");
    }
		else
			yyerror("Unknown node");

//Print kids after we finish
    int increment = 1;
		int i, j;
		for (i = 0; i < MAXCHILDREN; i++)
		{
			if(tree->child[i] != NULL)
			{
                for(j = 0; j < indent_level+1; j++){
                  fprintf(output, "!   ");
                }
                fprintf(output, "Child: %d  ",i);
                indent_level++;
				        printPTree(output, tree->child[i] );
                indent_level--;
			}

			//...waht if child0 doesnt exist, but other children do tho?
		}

		//Point to the next node in the AST
    tree = tree->sibling;
    if(tree){
      for(i = 0; i < indent_level; i++){
        fprintf(output, "!   ");
      }
      fprintf(output, "Sibling: %d  ", sib);
      sib++;
    }
	}
	//END WHILE



	return;
}


void increment_errors() {
    num_errors++;
}


char *typeHelper(int x) {
    char *result;
    switch(x) {
    case 0: result = "[type void]";
        break;
    case 1: result = "[type int]";
        break;
    case 2: result = "[type bool]";
        break;
    case 3: result = "[type char]";
        break;
    default: result = "undefined";
        break;
    }
    return result;
}
