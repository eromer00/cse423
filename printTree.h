#ifndef _printtree_H_
#define _printtree_H_


/*
    Group: Spaghet_Code
    Members: Erik Romero, Carlos Rubio, Franz Chavez
    File: printTree.h
    Description: header file for tree printer
*/

//Our grammar only permits up to 10 children per node
#define MAXCHILDREN 10

/*
* Main kind of Tree Node
*
* Declaration node
* Statement node
* Expression node
*/
typedef enum {DECL, STMT, EXP} NodeKind;


/*
* Kinds of declarations
*
* Variable declaration
* Function declaration
* Record declaration
*/
typedef enum {VAR, FUNC, REC} DeclKind;

/*
* Kinds of statements
*
* If statement
* While statement
* Return statement
* Break statement
* Compound statement
*/
typedef enum {IF, WHILE, RETURN, BREAK, COMP} StmtKind;

/*
* Kinds of expressions
*
* Operation expression
* Constant expression
* ID expression
*/
typedef enum {OP, CONST, ID} ExpKind;

/*
* Expression return type
*
* Void - Default
* Number
* True/False
* Single character
*/
typedef enum {VOID, NUMB, TF, SINGLE} ExpType;

/*
* Operation token
*
* plus -     +
* pplus -   ++
* dash -     -
* ddash -   --
* assign -   =
* passign - +=
* sassign - -=
* massign - *=
* dassign - /=
* asterisk - *
* fslash -   /
* bNOT -   NOT
* bAND -   AND
* bOR -     OR
* eqeq -    ==
* neq -     !=
* lteq -    <=
* lthan -    <
* gteq -    >=
* gthan -    >
* qmark -    ?
* mod -      %
* lsb -      [
* period -   .
* colon -    :
*/
typedef enum {
	plus, pplus, dash, ddash, assign, passign, sassign, 
	massign, dassign, asterisk, fslash, bnot, band, bor, eqeq,
	neq, lteq, lthan, gteq, gthan, qmark, mod, lsb, period,
	colon } OpKind;

/*
* Structure to hold AST node properties
* Essentially chained in a large linked list
* Holds essential code elements
*/
typedef struct TreeNode {

	/*
	* Pointer to child AST node array
	*/
	struct TreeNode* child[MAXCHILDREN];

	/*
	* Pointer to next AST node
	*/
	struct TreeNode* sibling;

	/*
	* Line number of AST element
	*/
	int lineno;

	/*
	* Node's main type
	*/
	NodeKind nodekind;

	/*
	* Union to hold node's subtype
	*/
	union
	{
		DeclKind decl;
		StmtKind stmt;
		ExpKind exp;
	} kind;

	/*
	* Node's main payload
	*/
	union
	{
		OpKind op;
		int value;
		unsigned char cvalue;
		char* name;
	} attr;

	/*
	* Return type of expression
	*/
	ExpType expType;

	/*
	* Holds custom type if rectype var
	*/
	char* recType;

	/*
	* Special flags
	*
	* Is an array
	* Is a record
	* Is statically declared
	* Is a function parameter
	* Is a function call
	*/
	int isArray;
	int isRecord;
	int isStatic;
	int isParam;
	int isFunc;

} TreeNode;


/*
* Print the AST
*/
void printTree(FILE* out, TreeNode* tree);

/*
* Allocate new Declaration node
*/
TreeNode* newDeclNode(DeclKind);

/*
* Allocate new Expression node
*/
TreeNode* newExpNode(ExpKind);

/*
* Allocate new Statement node
*/
TreeNode* newStmtNode(StmtKind);

/*
* Insert node into Tree
*/
void insertChild(TreeNode *tree, TreeNode *n);

/*
* Insert sibling node into Tree
*/
void insertSibling(TreeNode *tree, TreeNode *n);

#endif
