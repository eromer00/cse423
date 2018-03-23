%{

/**
 *
 * @date Spring 2018
 * @author Omar Soliman
 * @title Bison Parser
 *    _____
 *   /\   /\
 *  /  \ /  \
 * |    xmst |
 *  \  / \  /
 *   \/___\/
 *
 **/

#define YYPARSER

//System library import
#include<stdio.h>
GETOPT library
#include<string.h>

//User defined structures
#include "scanType.h"
#include "printTree.h"

//Enable detailed error messages
#define YYERROR_VERBOSE 1

//Inform bison about flex things
extern int yylex();
extern int yyparse();
extern FILE* yyin;
extern int line_num;

//Main AST to parse into
static TreeNode* syntaxTree;

//Reference parser error function
void yyerror(const char* s);

%}

//Use a union to hold possible grammar data types
%union {
	Token token;
	struct TreeNode* treeNode;
}

//Associate token types with union fields
%token <token> ID NUMCONST CHARCONST RECTYPE BOOLCONST RECORD
%token <token> STATIC INT BOOL CHAR IF ELSE WHILE RETURN BREAK OR AND NOT
%token <token> EQ NOTEQ MULASS INC ADDASS DEC SUBASS DIVASS LESSEQ GRTEQ
%token <token> ASTERISK RANDOM DASH FSLASH LPAREN RPAREN PLUS COMMA
%token <token> LSQB RSQB COLON SCOLON LTHAN ASSIGN GTHAN
%token <token> MOD PERIOD LCB RCB

//Types for nonterminals
%type <treeNode> program declarationList ...

//Grammar starting point
%start program

%%

program:
	declarationList { syntaxTree = $1; }
	;

declarationList:
	declarationList declaration
	{

 //Good idea code for left recursion to link together lists
 //No malloc here because the list members should already exist, yeah?
		TreeNode* t = $1;

		if(t != NULL)
		{
			while(t->sibling != NULL)
				t = t->sibling;

			t->sibling = $2;
			$$ = $1;
		}
		else
		{
			$$ = $2;
		}
	}
	| %empty { $$ = NULL; }
	;

declaration:
//Just passing stuff up the stack
	varDeclaration { $$ = $1; }
	| funDeclaration { $$ = $1; }
	| recDeclaration { $$ = $1; }
	;

constant:
	NUMCONST
	{
//This is where/how list members come from/in
		TreeNode* t = newExpNode(ConstK);

		t->attr.value = $1.value;
		t->expType = Integer;

		$$ = t;
	}
	;

%%

/*
* MAIN FUNCTION
*/
main() {

	/* Command line option variables
	 *
	 * c - value of flag
	 * long_options - array of word-sized options
	 * option_index - location in arg list
	 */
	int c;
	struct option long_options[] = {};
	int option_index = 0;

	//Check for command line args
	do {
		/*
		* The string "" arg should contain all acceptable options
		*
		*/
		c = g*********g(, , "", , &);
		switch(c)
		{
			//Long option present
			case 0:
				break;
			//Debug parser
			case  :
				yydebug = ;
				break;
			//No more options
			case -1:
				break;
			//Unknown option
			default:
				return(-1);
				break;
		}
	}while(c != -1);

	//File name has also been provided
	if(optind < argc)
	{

	}
	//No file name given
	else
	{

	}

	//Parse input until EOF
	do
	{

	}
	while(!feof(yyin));

	printTree(stdout, syntaxTree);

	//Close read-in file
	fclose(yyin);

	return(0);
}

/*
* Parser error function
*
* s - String to include in error function
*/
void yyerror(const char* s) {

	fprintf(stdout, "ERROR(%d): %s\n",line_num, s);

	return;
}
