#ifndef _SEMANTIC_H_
#define _SEMANTIC_H_

/**
 *
 * @date Spring 2018
 * @author Omar Soliman
 * @title Type check definitions
 *    _____
 *   /\   /\
 *  /  \ /  \
 * |    xmst |
 *  \  / \  /
 *   \/___\/
 *
 **/

#include "printtree.h"

/*
* Why? Why not.
*/
#define MAXPARAMS 51

/*
* Symbol data
*/
typedef struct Symbol {

	//Symbol name for searching
	char*;

	//Symbol data for storing type info
	char*;

	//Pointer to next symbol in the scope
	struct Symbol* ;

	//Symbol line number
	int ;

} Symbol;

/*
* Scope data
*/
typedef struct Scope {

	//Scope name
	char*;

	//Scope symbol pointers
	Symbol* ;
	Symbol* ;

	//Pointer to parent scope underneath in stack
	struct Scope* ;

	//Pointer to next scope in list
	struct Scope* ;

} Scope;

/*
* Symbol table data
*/
typedef struct {

	//Scope pointers
	Scope* ;
	Scope* ;
	Scope* ;

	//Stack height
	int ;

} SymbolTable;

/*
 * Convert to type char to type string index
 *
 * c - type char
 */
int typeCharToInt(char c);

/*
* Initializes an empty global symbol table
*/
SymbolTable* initST(void);

/*
* Create a new scope
*
* string - Scope name
* l - Line number of scope creation
*/
Scope* newScope(char* string, int l);

/*
* Create a new symbol
*
* n - Symbol name
* d - Symbol data
* l - Symbol line number
*/
Symbol* newSymbol(char* n, char* d, int l);

/*
* Search for a symbol in a scope
*
* s - Scope to search in
* string - Symbol name to look for
*/
Symbol* findSymbol(Scope* s, char* string);

/*
 * Search current stack of scopes for symbol
 *
 * string - Symbol name to search for
 */
Symbol* stackSearch(char* string);

/*
* Insert symbol into scope
*
* sco - Scope to add to
* sym - Symbol to add
*/
void insertSymbol(Scope* sco, Symbol* sym);

/*
 * Checks a node for ID type
 *
 * t - Node to check
 * string - String to compare symbol type to
 * match - Check for string or lack of string
 */
int idCheck(TreeNode* t, char* string, int match);

/*
* Print a symbol
*
* o - File to print to
* sym - Symbol to print
*/
void printSymbol(FILE* o, Symbol* sym);

/*
* Print a scope
*
* o - File to print to
* sco - Scope to print
*/
void printScope(FILE* o, Scope* sco);

/*
* Print a symbol table
*
* o - File to print to
*/
void printSymbolTable(FILE* o);

/*
 * Prints a typecheck error
 *
 * errnum - Error code index
 * line - Line number
 * s1 - First string
 * s2 - Second string
 * s3 - Third string
 * i1 - First integer
 * i2 - Second integer
 */
void printError(int errnum, int line, char* s1, char* s2, char* s3, int i1, int i2);

/*
 * Prints a typecheck warning
 *
 * warnum - Error code index
 * line - Line number
 * s1 - First string
 * s2 - Second string
 * s3 - Third string
 * i1 - First integer
 */
void printWarning(int warnum, int line, char* s1, char* s2, char* s3, int i1);

/*
 * Perform type-checking on operators
 *
 * tree - Node containing the operation
 */
void operatorCheck(TreeNode* tree);

/*
* Check scopes and types of the AST
*
* tree - Root node to start typechecking at
*/
void scopeAndType(TreeNode* tree);

/*
* Travels tree to populate symbol table
*
* tree - Root node to start at
*/
void treeTraverse(TreeNode* tree);

#endif

