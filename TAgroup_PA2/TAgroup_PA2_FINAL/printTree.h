#ifndef _AST_H_
#define _AST_H_

/**
 *
 * @date Spring 2018
 * @author Omar Soliman
 * @title AST Definitions
 *    _____
 *   /\   /\
 *  /  \ /  \
 * |    xmst |
 *  \  / \  /
 *   \/___\/
 *
 **/

//Our grammar only permits up to 3 children per node
#define MAXCHILDREN 3

/*
* Main kind of Tree Node
*
* DeclK - Declaration node
* StmtK - Statement node
* ExpK - Expression node
*/
typedef enum {DeclK, StmtK, ExpK} NodeKind;


/*
* Kinds of declarations
*
* varDec - Variable declaration
* funDec - Function declaration
* recDec - Record declaration
*/
typedef enum {varDec, funDec, recDec} DeclKind;

/*
* Kinds of statements
*
* IfK - If statement
* Repeatk - While statement
* ReturnK - Return statement
* BreakK - Break statement
* CompoundK - Compound statement
*/
typedef enum {IfK, RepeatK, ReturnK, BreakK, CompoundK} StmtKind;

/*
* Kinds of expressions
*
* OpK - Operation expression
* ConstK - Constant expression
* IdK - ID expression
*/
typedef enum {OpK, ConstK, IdK} ExpKind;

/*
* Expression return type
*
* Void - Default
* Integer - Number
* Boolean - True/False
* Char - Single character
*/
typedef enum {Void, Integer, Boolean, Char, Unknown} ExpType;

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
typedef enum {plus, pplus, dash, ddash, assign, passign, sassign, massign,
dassign, asterisk, fslash, bNOT, bAND, bOR, eqeq, neq, lteq, lthan, gteq, gthan,
qmark, mod, lsb, period, colon} OpKind;

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
	*
	* Dec, Stmt, Exp
	*/
	NodeKind nodekind;

	/*
	* Union to hold node's subtype
	*
	* varDec, funDec, recDec
	* IfK, RepeatK, ReturnK, BreakK, CompoundK
	* OpK, ConstK, IdK
	*/
	union
	{
		DeclKind decl;
		StmtKind stmt;
		ExpKind exp;
	} kind;

	/*
	* Node's main payload
	*
	* op - operation token
	* value - numerical value
	* cvalue - single character
	* name - string value
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
	*
	* Void, Integer, Boolean, Char
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
*
* tree - Root node to start printing at
*/
void printTree(TreeNode* tree);

/*
* Print indent level in AST
*
* out - File pointer to print to
* z - Number of spaces to print
*/
void printSpaces(FILE* out, int z);

/*
* Print warning and error count
*
* wno - Number of warnings
* eno - Number of errors
*/
void printProbs(int wno, int eno);

/*
* Remove extra space from indent level in AST
*
* out - File pointer to print to
* placeholder - Cursor position in file
*/
void removeSpace(FILE* out, long placeholder);

/*
* Allocate new Declaration node
*
* DeclKind - varDec, funDec, recDec
*/
TreeNode* newDeclNode(DeclKind);

/*
* Allocate new Expression node
*
* ExpKind - OpK, ConstK, IdK
*/
TreeNode* newExpNode(ExpKind);

/*
* Allocate new Statement node
*
* StmtKind - IfK, RepeatK, ReturnK, BreakK, CompoundK
*/
TreeNode* newStmtNode(StmtKind);

#endif

