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
#include<getopt.h>
#include<string.h>

//User defined structures
#include "scanType.h"
#include "printTree.h"
#include "semantic.h"

//Enable detailed error messages
#define YYERROR_VERBOSE 1

//AST print options
#define NOTYPES 0
#define TYPES 1

//Inform bison about flex things
extern int yylex();
extern int yyparse();
extern FILE* yyin;
extern int line_num;

//Track warnings and errors
#define WARN numWarnings++
#define ERROR numErrors++
int numWarnings = 0;
int numErrors = 0;

//Main AST to parse into
static TreeNode* syntaxTree;

//Reference parser error function
void yyerror(const char* s);

%}


//Use a union to hold possible token data types
%union {
    Token token;
    struct TreeNode* treeNode;
}

//Associate token types with union fields
%token <token> BOOL KEY CHAR IDVAL NUM BOOLT BOOLF
%token <token> SEMICOLON COLON RECORD LBRACK RBRACK LPAREN RPAREN
%token <token> ANDCND BREAKCND COMMA DIEQ DIV DOT ELSECND EQ EQEQ
%token <token> GT GTEQ IFCND LBOX RBOX LS LSEQ MI MIEQ MIMI MUEQ
%token <token> MUL NOTCND NTEQ ORCND PERC PL PLEQ PLPL QM RETURNCND
%token <token> INTCND CHARCND BOOLCND INCND RECTYPE
%token <token> STATIC WHILECND

//Types for nonterminals
%type <treeNode> program declarationList declaration recDeclaration varDeclaration scopedVarDeclaration varDeclList varDeclInitialize varDeclId scopedTypeSpecifier typeSpecifier returnTypeSpecifier funDeclaration params paramList paramTypeList paramIdList paramId statement otherstatement matched unmatched iterationHeader compoundStmt localDeclarations statementList expressionStmt returnStmt breakStmt expression simpleExpression andExpression unaryRelExpression relExpression relop sumExpression sumop term mulop unaryExpression unaryop factor mutable immutable call args argList constant



//Grammar starting point
%start program

%%

program:
	declarationList { syntaxTree = $1; }
	;

declarationList:
	declarationList declaration
	{
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
	varDeclaration { $$ = $1; }
	| funDeclaration { $$ = $1; }
	| recDeclaration { $$ = $1; }
	;

recDeclaration:
	RECORD RECTYPE LBRACK localDeclarations RBRACK
	{
		TreeNode* t = newDeclNode(recDec);
		TreeNode* i = t;

		int c = 0;

		t->isRecord = 1;
		t->attr.name = strdup($2.str);
		t->lineno = $1.line;

		while(1) {

			if(i->child[c] != NULL)
			{
				i = i->child[++c];
			}
			else
			{
				i->child[c] = $4;
				break;
			}
		}

		$$ = t;
	}
	;

varDeclaration:
	typeSpecifier varDeclList SEMICOLON
	{
		TreeNode* t = $2;

		while(1) {

			t->expType = $1->expType;
			t->isRecord = $1->isRecord;

			if(t->isRecord)
				t->recType = $1->recType;

			if(t->sibling != NULL)
				t = t->sibling;
			else
				break;
		}

		free($1);
		$$ = $2;
	}
	;

scopedVarDeclaration:
	scopedTypeSpecifier varDeclList SEMICOLON
	{
		TreeNode* t = $2;

		while(1) {

			t->isStatic = $1->isStatic;
			t->expType = $1->expType;
			t->isRecord = $1->isRecord;

			if(t->isRecord)
				t->recType = $1->recType;


			if(t->sibling != NULL)
				t = t->sibling;
			else
				break;
		}

		free($1);
		$$ = $2;
	}
	;

varDeclList:
	varDeclList COMMA varDeclInitialize
	{
		TreeNode* t = $1;

		if(t != NULL)
		{
			while(t->sibling != NULL)
				t = t->sibling;

			t->sibling = $3;
			$$ = $1;
		}
		else
		{
			$$ = $3;
		}
	}
	| varDeclInitialize { $$ = $1; }
	;

varDeclInitialize:
	varDeclId COLON simpleExpression
	{
		$1->child[0] = $3;
		$$ = $1;
	}
	| varDeclId { $$ = $1; }
	;

varDeclId:
	IDVAL LBOX NUM RBOX
	{
		TreeNode* t = newDeclNode(varDec);

		t->attr.name = strdup($1.str);

		t->isArray = 1;
		t->size = $3.val + 1;

		$$ = t;
	}
	| IDVAL
	{
		TreeNode* t = newDeclNode(varDec);

		t->attr.name = strdup($1.str);

		t->lineno = $1.line;

		t->size = 1;

		$$ = t;
	}
	;

scopedTypeSpecifier:
	STATIC typeSpecifier
	{
		$2->isStatic = 1;
		$$ = $2;
	}
	| typeSpecifier
	{
		$1->isStatic = 0;
		$$ = $1;
	}
	;

typeSpecifier:
	returnTypeSpecifier { $$ = $1; }
	| RECTYPE
	{
		TreeNode* t = newDeclNode(varDec);

		t->isRecord = 1;
		t->recType = strdup($1.str);

		$$ = t;
	}
	;

returnTypeSpecifier:
	INTCND
	{
		TreeNode* t = newDeclNode(varDec);

		t->expType = Integer;

		$$ = t;
	}
	| BOOLCND
	{

		TreeNode* t = newDeclNode(varDec);

		t->expType = Boolean;

		$$ = t;
	}
	| CHARCND
	{

		TreeNode* t = newDeclNode(varDec);

		t->expType = Char;

		$$ = t;
	}
	;

funDeclaration:
	typeSpecifier IDVAL LPAREN params RPAREN statement
	{
		TreeNode* t = newDeclNode(funDec);

		t->child[0] = $4;
		t->child[1] = $6;

		t->lineno = $2.line;

		t->attr.name = strdup($2.str);

		t->expType = $1->expType;

		free($1);
		$$ = t;
	}
	| IDVAL LPAREN params RPAREN statement
	{

		TreeNode* t = newDeclNode(funDec);

		t->child[0] = $3;
		t->child[1] = $5;

		t->attr.name = strdup($1.str);
		t->lineno = $1.line;

		t->expType = Void;

		$$ = t;
	}
	;

params:
	paramList { $$ = $1; }
	| %empty { $$ = NULL; }
	;

paramList:
	paramList SEMICOLON paramTypeList
	{
		TreeNode* t = $1;

		if(t != NULL)
		{
			while(t->sibling != NULL)
				t = t->sibling;

			t->sibling = $3;
			$$ = $1;
		}
		else
		{
			$$ = $3;
		}
	}
	| paramTypeList { $$ = $1; }
	;

paramTypeList:
	typeSpecifier paramIdList
	{
		TreeNode* t = $2;

		while(1) {

			t->expType = $1->expType;
			t->isRecord = $1->isRecord;

			if(t->isRecord)
				t->recType = $1->recType;

			if(t->sibling != NULL)
				t = t->sibling;
			else
				break;
		}

		free($1);
		$$ = $2;
	}
	;

paramIdList:
	paramIdList COMMA paramId
	{
		TreeNode* t = $1;

		if(t != NULL)
		{
			while(t->sibling != NULL)
				t = t->sibling;

			t->sibling = $3;
			$$ = $1;
		}
		else
		{
			$$ = $3;
		}

	}
	| paramId { $$ = $1; }
	;

paramId:
	IDVAL LBOX RBOX
	{
		TreeNode* t = newDeclNode(varDec);

		t->attr.name = strdup($1.str);

		t->size = 1;

		t->lineno = $1.line;

		t->isArray = 1;
		t->isParam = 1;

		$$ = t;
	}
	| IDVAL
	{
		TreeNode* t = newDeclNode(varDec);

		t->attr.name = strdup($1.str);

		t->size = 1;

		t->lineno = $1.line;

		t->isParam = 1;

		$$ = t;
	}
	;

statement:
	matched  { $$ = $1; }
	| unmatched  { $$ = $1; }
	;

matched:
	IFCND LPAREN simpleExpression RPAREN matched ELSECND matched
	{
		TreeNode* t = newStmtNode(IfK);

		t->lineno = $1.line;

		t->child[0] = $3;
		t->child[1] = $5;
		t->child[2] = $7;

		$$ = t;
	}
	| iterationHeader matched
	{
		TreeNode* t = $1;

		t->child[1] = $2;

		$$ = $1;
	}
	| otherstatement { $$ = $1; }
	;

unmatched:
	IFCND LPAREN simpleExpression RPAREN matched
	{
		TreeNode* t = newStmtNode(IfK);

		t->lineno = $1.line;

		t->child[0] = $3;
		t->child[1] = $5;

		$$ = t;
	} 
	| IFCND LPAREN simpleExpression RPAREN unmatched
	{
		TreeNode* t = newStmtNode(IfK);

		t->lineno = $1.line;

		t->child[0] = $3;
		t->child[1] = $5;

		$$ = t;
	}
	| IFCND LPAREN simpleExpression RPAREN matched ELSECND unmatched
	{
		TreeNode* t = newStmtNode(IfK);

		t->lineno = $1.line;

		t->child[0] = $3;
		t->child[1] = $5;
		t->child[2] = $7;

		$$ = t;
	}
	| iterationHeader unmatched
	{
		TreeNode* t = $1;

		t->child[1] = $2;

		$$ = $1;
	}
	;

iterationHeader:
	WHILECND LPAREN simpleExpression RPAREN
	{
		TreeNode* t = newStmtNode(RepeatK);

		t->lineno = $1.line;

		t->child[0] = $3;

		$$ = t;
	}
	;

otherstatement:
	expressionStmt { $$ = $1; }
	| compoundStmt { $$ = $1; }
	| returnStmt { $$ = $1; }
	| breakStmt { $$ = $1; }
	;

compoundStmt:
	LBRACK localDeclarations statementList RBRACK
	{
		TreeNode* t = newStmtNode(CompoundK);

		t->lineno = $1.line;

		t->child[0] = $2;
		t->child[1] = $3;

		$$ = t;
	}
	;

localDeclarations:
	localDeclarations scopedVarDeclaration
	{
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

statementList:
	statementList statement
	{
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

expressionStmt:
	expression SEMICOLON { $$ = $1; }
	| SEMICOLON { $$ = NULL; }
	;

returnStmt:
	RETURNCND SEMICOLON
	{
		TreeNode* t = newStmtNode(ReturnK);

		$$ = t;
	}
	| RETURNCND expression SEMICOLON
	{
		TreeNode* t = newStmtNode(ReturnK);

		t->lineno = $1.line;

		t->child[0] = $2;

		$$ = t;
	}
	;

breakStmt:
	BREAKCND SEMICOLON
	{
		TreeNode* t = newStmtNode(BreakK);

		$$ = t;
	}
	;

expression:
	mutable EQ expression
	{
		TreeNode* t = newExpNode(OpK);

		t->child[0] = $1;
		t->child[1] = $3;

		t->attr.op = assign;

		t->lineno = $2.line;

		$$ = t;
	}
	| mutable PLEQ expression
	{
		TreeNode* t = newExpNode(OpK);

		t->child[0] = $1;
		t->child[1] = $3;

		t->attr.op = passign;

		t->lineno = $2.line;

		$$ = t;
	}
	| mutable MIEQ expression
	{
		TreeNode* t = newExpNode(OpK);

		t->child[0] = $1;
		t->child[1] = $3;

		t->attr.op = sassign;

		t->lineno = $2.line;

		$$ = t;
	}
	| mutable MUEQ expression
	{
		TreeNode* t = newExpNode(OpK);

		t->child[0] = $1;
		t->child[1] = $3;

		t->attr.op = massign;

		t->lineno = $2.line;

		$$ = t;
	}
	| mutable DIEQ expression
	{
		TreeNode* t = newExpNode(OpK);

		t->child[0] = $1;
		t->child[1] = $3;

		t->attr.op = dassign;

		t->lineno = $2.line;

		$$ = t;
	}
	| mutable PLPL
	{
		TreeNode* t = newExpNode(OpK);

		t->child[0] = $1;

		t->attr.op = pplus;

		t->lineno = $2.line;

		$$ = t;
	}
	| mutable MIMI
	{
		TreeNode* t = newExpNode(OpK);

		t->child[0] = $1;

		t->attr.op = ddash;

		t->lineno = $2.line;

		$$ = t;
	}
	| simpleExpression { $$ = $1; }
	;

simpleExpression:
	simpleExpression ORCND andExpression
	{
		TreeNode* t = newExpNode(OpK);

		t->child[0] = $1;
		t->child[1] = $3;

		t->attr.op = bOR;

		t->lineno = $2.line;

		$$ = t;
	}
	| andExpression { $$ = $1; }
	;

andExpression:
	andExpression ANDCND unaryRelExpression
	{
		TreeNode* t = newExpNode(OpK);

		t->child[0] = $1;
		t->child[1] = $3;

		t->attr.op = bAND;

		t->lineno = $2.line;

		$$ = t;
	}
	| unaryRelExpression { $$ = $1; }
	;

unaryRelExpression:
	NOTCND unaryRelExpression
	{
		TreeNode* t = newExpNode(OpK);

		t->child[0] = $2;

		t->attr.op = bNOT;

		t->lineno = $1.line;

		$$ = t;
	}
	| relExpression { $$ = $1; }
	;

relExpression:
	sumExpression relop sumExpression
	{
		TreeNode* t = newExpNode(OpK);

		t->child[0] = $1;
		t->child[1] = $3;

		t->attr.op = $2->attr.op;

		t->lineno = $2->lineno;

		free($2);
		$$ = t;
	}
	| sumExpression { $$ = $1; }
	;

relop:
	LSEQ
	{
		TreeNode* t = newExpNode(OpK);

		t->attr.op = lteq;

		$$ = t;
	}
	| LS
	{
		TreeNode* t = newExpNode(OpK);

		t->attr.op = lthan;

		$$ = t;
	}
	| GT
	{
		TreeNode* t = newExpNode(OpK);

		t->attr.op = gthan;

		$$ = t;
	}
	| GTEQ
	{
		TreeNode* t = newExpNode(OpK);

		t->attr.op = gteq;

		$$ = t;
	}
	| EQEQ
	{
		TreeNode* t = newExpNode(OpK);

		t->attr.op = eqeq;

		$$ = t;
	}
	| NTEQ
	{
		TreeNode* t = newExpNode(OpK);

		t->attr.op = neq;

		$$ = t;
	}
	;

sumExpression:
	sumExpression sumop term
	{
		TreeNode* t = newExpNode(OpK);

		t->child[0] = $1;
		t->child[1] = $3;

		t->attr.op = $2->attr.op;

		t->lineno = $2->lineno;

		free($2);
		$$ = t;
	}
	| term { $$ = $1; }
	;

sumop:
	PL
	{
		TreeNode* t = newExpNode(OpK);

		t->attr.op = plus;

		$$ = t;
	}
	| MI
	{
		TreeNode* t = newExpNode(OpK);

		t->attr.op = dash;

		$$ = t;
	}
	;

term:
	term mulop unaryExpression
	{
		TreeNode* t = newExpNode(OpK);

		t->child[0] = $1;
		t->child[1] = $3;

		t->attr.op = $2->attr.op;

		t->lineno = $2->lineno;

		free($2);
		$$ = t;
	}
	| unaryExpression { $$ = $1; }
	;

mulop:
	MUL
	{
		TreeNode* t = newExpNode(OpK);

		t->attr.op = asterisk;

		$$ = t;
	}
	| DIV
	{
		TreeNode* t = newExpNode(OpK);

		t->attr.op = fslash;

		$$ = t;
	}
	| PERC
	{
		TreeNode* t = newExpNode(OpK);

		t->attr.op = mod;

		$$ = t;
	}
	;

unaryExpression:
	unaryop unaryExpression
	{
		TreeNode* t = newExpNode(OpK);

		t->child[0] = $2;

		t->attr.op = $1->attr.op;

		t->lineno = $1->lineno;

		free($1);
		$$ = t;
	}
	| factor { $$ = $1; }
	;

unaryop:
	MI
	{
		TreeNode* t = newExpNode(OpK);

		t->attr.op = dash;

		$$ = t;
	}
	| MUL
	{
		TreeNode* t = newExpNode(OpK);

		t->attr.op = asterisk;

		$$ = t;
	}
	| QM
	{
		TreeNode* t = newExpNode(OpK);

		t->attr.op = qmark;

		$$ = t;
	}
	;

factor:
	immutable { $$ = $1; }
	| mutable { $$ = $1; }
	;

mutable:
	mutable LBOX expression RBOX
	{
		TreeNode* t = newExpNode(OpK);

		t->child[0] = $1;
		t->child[1] = $3;

		t->attr.op = lsb;

		t->lineno = $2.line;

		$$ = t;
	}
	| mutable DOT IDVAL
	{
		TreeNode* t = newExpNode(OpK);

		TreeNode* x = newExpNode(IdK);
		x->attr.name = strdup($3.str);

		t->child[0] = $1;
		t->child[1] = x;

		t->attr.op = period;

		t->lineno = $2.line;

		$$ = t;
	}
	| IDVAL
	{
		TreeNode* t = newExpNode(IdK);

		t->attr.name = strdup($1.str);

		t->lineno = $1.line;

		$$ = t;
	}
	;

immutable:
	LPAREN expression RPAREN { $$ = $2; }
	| call { $$ = $1; }
	| constant { $$ = $1; }
	;

call:
	IDVAL LPAREN args RPAREN
	{
		TreeNode* t = newExpNode(ExpK);

		t->attr.name = strdup($1.str);

		t->lineno = $1.line;

		t->child[0] = $3;

		t->isFunc = 1;

		$$ = t;
	}
	;

args:
	argList { $$ = $1; }
	| %empty { $$ = NULL; }
	;

argList:
	argList COMMA expression
	{
		TreeNode* t = $1;

		if(t != NULL)
		{
			while(t->sibling != NULL)
				t = t->sibling;

			t->sibling = $3;
			$$ = $1;
		}
		else
		{
			$$ = $3;
		}

	}
	| expression {  $$ = $1; }
	;

constant:
	NUM
	{
		TreeNode* t = newExpNode(ConstK);

		t->attr.val = $1.val;
		t->expType = Integer;

		$$ = t;
	}
	| CHAR
	{
		TreeNode* t = newExpNode(ConstK);

		t->attr.cval = $1.ltr;
		t->expType = Char;

		$$ = t;
	}
	| BOOLT
	{
		TreeNode* t = newExpNode(ConstK);

		t->attr.val = $1.val;
		t->expType = Boolean;

		$$ = t;
	}
	| BOOLF
	{
		TreeNode* t = newExpNode(ConstK);

		t->attr.val = $1.val;
		t->expType = Boolean;

		$$ = t;
	}
	;

%%

/*
* MAIN FUNCTION
*/
int main(int argc, char* argv[]) {

	//AST printing flags
	int printSyntaxTree = 0;
	int printAnnotatedSyntaxTree = 0;

	/*
	* Command line option variables
	*
	* c - val of flag
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
		* d - debug on
		* p - print AST
		* P - print annotated AST
		*/
		c = getopt_long(argc, argv, "dpP", long_options, &option_index);
		switch(c)
		{
			//Long option present
			case 0:
				break;
			//Debug parser
			case 'd':
				yydebug = 1;
				break;
			//Print AST
			case 'p':
				printSyntaxTree = 1;
				break;
			//Print Extra AST
			case 'P':
				printAnnotatedSyntaxTree = 1;
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
		//Open file handle to read input
		FILE* myfile = fopen(argv[optind],"r");

		//Check if input file opened
		if(!myfile) {
			fprintf(stderr,"Couldn't open file %s.\n",argv[optind]);
			return(-1);
		}

		//Tell bison to read from file stream
		yyin = myfile;
	}
	//No file name given
	else
	{
		//Tell bison to read from STDIN
		yyin = stdin;
	}

	//Parse input until EOF
	do
	{
		yyparse();
	}
	while(!feof(yyin));

	//Check for no syntax errors
	if(!numErrors)
	{
		//Print AST if requested
		if(printSyntaxTree)
			printTree(syntaxTree, NOTYPES);

		//Add prototypes to AST
		syntaxTree = addProto(syntaxTree);

		//Check AST scopes and types
		scopeAndType(syntaxTree);

		//Print Extra AST if requested
		if(printAnnotatedSyntaxTree)
		{
			printTree(syntaxTree, TYPES);

//Print problem count
		}
	}

	//Close read-in file
	fclose(yyin);
}

/*
* Parser error function
*
* s - String to include in error function
*/
void yyerror(const char* s) {

	fprintf(stdout, "ERROR(%d): %s\n",line_num, s);

	ERROR;

	return;
}























































/*
%{


//    Group: Spaghet_Code
//    Members: Erik Romero, Carlos Rubio, Franz Chavez
//    File: parser.y
//    Description: bison program to parse the tokenized c- language from flex


//Import input/output functions
#include<stdio.h>
//Import exit functionality
#include<stdlib.h>
#include<string.h>
#include<unistd.h>
#include "scanType.h"
#include "printTree.h"
#include "recordType.h"
#include "semantic.h"

//Inform bison about flex things
extern int yylex();
extern int yyparse();
extern FILE* yyin;
static TreeNode* syntaxTree;
extern OpKind ops;

//Track warnings and errors
#define WARN numWarnings++
#define ERROR numErrors++
int numWarnings = 0;
int numErrors = 0;

//Error function
void yyerror(const char* s);
%}

//Use a union to hold possible token data types
%union {
    Token token;
    struct TreeNode* treeNode;
}

//Associate token types with union fields
%token <token> BOOL KEY CHAR IDVAL NUM BOOLT BOOLF
%token <token> SEMICOLON COLON RECORD LBRACK RBRACK LPAREN RPAREN
%token <token> ANDCND BREAKCND COMMA DIEQ DIV DOT ELSECND EQ EQEQ
%token <token> GT GTEQ IFCND LBOX RBOX LS LSEQ MI MIEQ MIMI MUEQ
%token <token> MUL NOTCND NTEQ ORCND PERC PL PLEQ PLPL QM RETURNCND
%token <token> INTCND CHARCND BOOLCND INCND RECTYPE
%token <token> STATIC WHILECND

//Types for nonterminals
%type <treeNode> program declarationList declaration recDeclaration varDeclaration scopedVarDeclaration varDeclList varDeclInitialize varDeclId scopedTypeSpecifier typeSpecifier returnTypeSpecifier funDeclaration params paramList paramTypeList paramIdList paramId statement otherstatement matched unmatched iterationHeader compoundStmt localDeclarations statementList expressionStmt returnStmt breakStmt expression simpleExpression andExpression unaryRelExpression relExpression relop sumExpression sumop term mulop unaryExpression unaryop factor mutable immutable call args argList constant


%%
program:
    declarationList {syntaxTree = $1;                  
                    }
    ;

//todo
declarationList:
    declarationList declaration 
        {   if($1 != NULL) {
                insertSibling($1,$2);
                $$=$1;
            } else {
                $$=$2;
            }
        }
    | %empty { $$ = NULL; }
    ;

declaration:
    varDeclaration {$$ = $1; }
    | funDeclaration {$$ = $1; }
    | recDeclaration{$$ = $1; }
    ;

recDeclaration:
    RECORD IDVAL LBRACK localDeclarations RBRACK 
        {
            addRecType($2.str);
            TreeNode *t = newDeclNode(REC);
            t->attr.name = strdup($2.str);
            t->recType = t->attr.name;
            t->isRecord = 1;
            insertChild(t, $4);
            t->lineno = $1.line;
            $$ = t;
        }
    ;

varDeclaration:
    typeSpecifier varDeclList SEMICOLON 
        {
            TreeNode * t = $2;
            while(t !=NULL){
                if($1->expType)
                    t->expType = $1->expType;
                else
                    t->recType = $1->recType;
                t = t->sibling;
            }
            $$=$2;
        }
    ;

scopedVarDeclaration:
    scopedTypeSpecifier varDeclList SEMICOLON 
        {
            TreeNode * t = $2;
            while(t !=NULL){
                if($1->expType)
                    t->expType = $1->expType;
                else
                    t->recType = $1->recType;
                t = t->sibling;
            }
            $$=$2;
        }
    ;

varDeclList:
    varDeclList COMMA varDeclInitialize  
        {
            if($1 != NULL) {
                insertSibling($1, $3);
                $$ = $1;
            } else {
                $$ = $3;
            }
        }
    | varDeclInitialize 
        {
            $$ = $1;
        }
    ;

varDeclInitialize:
    varDeclId COLON simpleExpression 
        {
            if($1 != NULL) {
                insertChild($1, $3);
                $$ = $1;
            } else {
                $$ = $3;
            }
        }
    | varDeclId 
        {
            $$ = $1; 
        }
    
    ;

varDeclId:
    IDVAL LBOX NUM RBOX 
        {
            TreeNode *t = newDeclNode(VAR);
            t->attr.val = $1.val;
            t->isArray = 1;
            t->lineno = $1.line;
            t->attr.name = strdup($1.str);
            t->attr.val = $3.val;
            $$ = t;
        }
    | IDVAL 
        {
            TreeNode *t = newDeclNode(VAR);
            t->attr.name = strdup($1.str);
            t->lineno = $1.line;
            $$ = t;
        }
    ;

scopedTypeSpecifier:
    STATIC typeSpecifier 
        {
            $2->isStatic = 1;
            $$ = $2;
        }
    | typeSpecifier 
        {
            $$ = $1;
        }
    ;

typeSpecifier:
    returnTypeSpecifier 
        {
            $$ = $1;
        }
    | RECTYPE 
        {
            TreeNode *t = newDeclNode(REC);
            t->attr.name = $1.str;
            t->recType = strdup($1.str);
            t->isRecord = 1;
            t->lineno = $1.line;
            $$ = t;
        }
    ;

returnTypeSpecifier:
    INTCND 
        {
            TreeNode *t = newDeclNode(VAR);
            t->attr.name = strdup($1.str);
            t->expType = NUMB;
            t->lineno = $1.line;
            $$ = t;
        }
    | BOOLCND 
        {   
            TreeNode *t = newDeclNode(VAR);
            t->attr.name = strdup($1.str);
            t->expType = TF;
            t->lineno = $1.line;
            $$ = t;
        }
    | CHARCND 
        {
            TreeNode *t = newDeclNode(VAR);
            t->attr.name = strdup($1.str);
            t->expType = SINGLE;
            t->lineno = $1.line;
            $$ = t;
        }
    ;

funDeclaration:
    typeSpecifier IDVAL LPAREN params RPAREN statement 
        {
            TreeNode *t = newDeclNode(FUNC);
            t->attr.name = strdup($2.str);
            if($1->expType)
                t->expType = $1->expType;
            else
                t->recType = $1->recType;
            t->isFunc = 1;
            t->lineno = $2.line;
            insertChild(t, $4);
            insertChild(t, $6);
            $$ = t;
        }
    | IDVAL LPAREN params RPAREN statement 
        {
            TreeNode *t = newDeclNode(FUNC);
            t->attr.name = strdup($1.str);
            t->lineno = $1.line;
            t->isFunc = 1;
            insertChild(t, $3);
            insertChild(t, $5);
            $$ = t;
        }
    ;

params:
    paramList 
        {
            $$ = $1;
        }
    | %empty { $$ = NULL; }
    ;

paramList:
    paramList SEMICOLON paramTypeList 
        {
            if($1 != NULL) {
                insertSibling($1, $3);
                $$ = $1;
            } else {
                $$ = $3;            
            }
        }
    | paramTypeList 
        {
            $$=$1;
        }
    ;

paramTypeList:
    typeSpecifier paramIdList 
        {
            TreeNode * t = $2;
            while(t !=NULL){
                if($1->expType)
                    t->expType = $1->expType;
                else
                    t->recType = $1->recType;
                t = t->sibling;
            }
            $$=$2;
        }
    ;

paramIdList:
    paramIdList COMMA paramId 
        {
            if($1 != NULL) {
                insertSibling($1, $3);
                $$ = $1;
            } else {
                $$ = $3;
            }
        }
    | paramId 
        {
            $$=$1;
        }
    ;

paramId:
    IDVAL LBOX RBOX 
        {
            TreeNode *t = newDeclNode(VAR);
            t->attr.name = strdup($1.str);
            t->lineno = $1.line;
            t->isArray = 1;
            t->isParam = 1;

            $$ = t;
        }
    | IDVAL 
        {
            TreeNode *t = newDeclNode(VAR);
            t->attr.name = strdup($1.str);
            t->isParam = 1;
            t->lineno = $1.line;

            $$ = t;
        }

    ;

statement:
    matched { $$=$1;}
    | unmatched {$$=$1; }
    ;

matched:
    IFCND LPAREN simpleExpression RPAREN matched ELSECND matched 
        {
            
            TreeNode *t = newStmtNode(IF);
            t->attr.name = $1.str;
            t->lineno = $1.line;
    
            insertChild(t, $3);
            insertChild(t, $5);
            insertChild(t, $7);
            $$ = t;
        }
    | iterationHeader matched
        {
            insertChild($1, $2);
            $$ = $1;
        }
    | otherstatement {$$=$1; }
    ;

unmatched:
    IFCND LPAREN simpleExpression RPAREN matched 
        {
            TreeNode *t = newStmtNode(IF);
            t->attr.name = $1.str;
            t->lineno = $1.line;
    
            insertChild(t, $3);
            insertChild(t, $5);

            $$ = t;
        }
    | IFCND LPAREN simpleExpression RPAREN unmatched 
        {
            TreeNode *t = newStmtNode(IF);
            t->attr.name = $1.str;
            t->lineno = $1.line;
    
            insertChild(t, $3);
            insertChild(t, $5);

            $$ = t;
        }
    | IFCND LPAREN simpleExpression RPAREN matched ELSECND unmatched 
        {
            TreeNode *t = newStmtNode(IF);
            t->attr.name = $1.str;
            t->lineno = $1.line;
    
            insertChild(t, $3);
            insertChild(t, $5);
            insertChild(t, $7);

            $$ = t;
        }
    | iterationHeader unmatched 
        {
            insertChild($1, $2);

            $$ = $1;
        }
    ;

iterationHeader:
    WHILECND LPAREN simpleExpression RPAREN
        {
            TreeNode *t = newStmtNode(WHILE);
            t->attr.name = $1.str;
            t->lineno = $1.line;

            insertChild(t, $3);
            $$ = t;
        }
    ;

otherstatement:
    expressionStmt  
        {
            $$=$1;
        }
    | compoundStmt 
        {
            $$=$1;
        }
    | returnStmt 
        {
            $$=$1;
        }
    | breakStmt 
        {
            $$=$1; 
        }
    ;


compoundStmt:
    LBRACK localDeclarations statementList RBRACK 
        {
            TreeNode *t = newStmtNode(COMP);
            t->attr.name = strdup("Compound");
            t->lineno = $1.line;
            insertChild(t, $2);
            insertChild(t, $3);
            $$ = t;
        }
    ;

localDeclarations:
    localDeclarations scopedVarDeclaration 
        {
            if($1 != NULL) {
                insertSibling($1, $2);
                $$ = $1;
            } else {
                $$ = $2;            
            }
        }
    | %empty {$$ = NULL;}
    ;


statementList:
    statementList statement 
        {
        if($1 != NULL){
            TreeNode *t = $1;
            TreeNode *t2 = $2;
            insertSibling($1,$2);
            $$ = $1;
            }
        else $$ = $2;
        }
    | %empty {$$ = NULL; }
    ;

expressionStmt:
    expression SEMICOLON { $$=$1; }
    | SEMICOLON{$$=NULL; }
    ;


returnStmt:
    RETURNCND SEMICOLON 
        {
            TreeNode *t = newStmtNode(RETURN);
            t->attr.name = $1.str;
            t->lineno = $1.line;
            $$ = t;
        }
    | RETURNCND expression SEMICOLON
        {
            TreeNode *t = newStmtNode(RETURN);
            t->attr.name = $1.str;
            t->lineno = $1.line;

            insertChild(t, $2);
            $$ = t;
        }
    ;

breakStmt:
    BREAKCND SEMICOLON
        {
            TreeNode *t = newStmtNode(BREAK);
            t->attr.name = $1.str;
            t->lineno = $1.line;

            $$ = t;
        }
    ;

expression:
    mutable EQ expression 
        {
            TreeNode *t = newExpNode(OP);
            t->lineno = $2.line;
            t->attr.op = ASSIGN;
            t->attr.name = strdup("EQ");
            insertChild(t, $1);
            insertChild(t, $3);
            $$ = t;
        }
    | mutable PLEQ expression 
        {
            TreeNode *t = newExpNode(OP);
            t->lineno = $2.line;
            t->attr.op = PASSIGN;
            t->attr.name = strdup("PLEQ");
            insertChild(t, $1);
            insertChild(t, $3);
            $$ = t;
        }
    | mutable MIEQ expression
        {
            TreeNode *t = newExpNode(OP);
            t->lineno = $2.line;
            t->attr.op = SASSIGN;
            t->attr.name = strdup("MIEQ");
            insertChild(t, $1);
            insertChild(t, $3);
            $$ = t;
        }
    | mutable MUEQ expression 
        {
            TreeNode *t = newExpNode(OP);
            t->lineno = $2.line;
            t->attr.op = MASSIGN;
            t->attr.name = strdup("MUEQ");
            insertChild(t, $1);
            insertChild(t, $3);
            $$ = t;
        }
    | mutable DIEQ expression 
        {
            TreeNode *t = newExpNode(OP);
            t->lineno = $2.line;
            t->attr.op = DASSIGN;
            t->attr.name = strdup("DIEQ");
            insertChild(t, $1);
            insertChild(t, $3);
            $$ = t;
        }
    | mutable PLPL 
        {
            TreeNode *t = newExpNode(OP);
            t->lineno = $2.line;
            t->attr.op = PPLUS;
            t->attr.name = strdup("PLPL");
            insertChild(t, $1);
            $$ = t;
        }
    | mutable MIMI
        {
            TreeNode *t = newExpNode(OP);
            t->lineno = $2.line;
            t->attr.op = DDASH;
            t->attr.name = strdup("MIMI");
            insertChild(t, $1);
            $$ = t;
        }
    | simpleExpression
        {
            $$ = $1;
        }
    ;

simpleExpression:
    simpleExpression ORCND andExpression
        {
            TreeNode *t = newExpNode(OP);
            t->lineno = $2.line;
            t->attr.op = BOR;
            t->attr.name = strdup("ORCND");
            insertChild(t, $1);
            insertChild(t, $3);
            $$ = t;
        }
    | andExpression
        {
            $$ = $1;
        }
    ;

andExpression:
    andExpression ANDCND unaryRelExpression
        {
            TreeNode *t = newExpNode(OP);
            t->lineno = $2.line;
            t->attr.op = BAND;
            t->attr.name = strdup("ANDCND");
            insertChild(t, $1);
            insertChild(t, $3);
            $$ = t;
        }
    | unaryRelExpression{
            $$=$1; }
    ;

unaryRelExpression:
    NOTCND unaryRelExpression
        {
            TreeNode *t = newExpNode(OP);
            t->lineno = $1.line;
            t->attr.op = BNOT;
            t->attr.name = strdup("NOTCND");
            insertChild(t, $2);
            $$ = t;
        }
    | relExpression{
            $$=$1; }
    ;

relExpression:
    sumExpression relop sumExpression 
        {
            TreeNode *t = newExpNode(OP);
            t->lineno = $2->lineno;
            t->attr.op = $2->attr.op;
            insertChild(t, $1);
            insertChild(t, $3);
            free($2);
            $$ = t;
        }
    | sumExpression{
            $$=$1; }
    ;

relop:
    LSEQ
        {
            TreeNode *t = newExpNode(OP);
            t->lineno = $1.line;
            t->attr.op = LTEQ;
            t->attr.name = strdup("LSEQ");
            $$ = t;
        }
    | LS
        {
            TreeNode *t = newExpNode(OP);
            t->lineno = $1.line;
            t->attr.op = LTHAN;
            t->attr.name = strdup("LS");
            $$ = t;
        }
    | GT
        {
            TreeNode *t = newExpNode(OP);
            t->lineno = $1.line;
            t->attr.op = GTHAN;
            t->attr.name = strdup("GT");
            $$ = t;
        }
    | GTEQ
        {
            TreeNode *t = newExpNode(OP);
            t->lineno = $1.line;
            t->attr.op = GTHANEQ;
            t->attr.name = strdup("GTEQ");
            $$ = t;
        }
    | EQEQ
        {
            TreeNode *t = newExpNode(OP);
            t->lineno = $1.line;
            t->attr.op = EQCP;
            t->attr.name = strdup("EQEQ");
            $$ = t;
        }
    | NTEQ
        {
            TreeNode *t = newExpNode(OP);
            t->lineno = $1.line;
            t->attr.op = NEQ;
            t->attr.name = strdup("NTEQ");
            $$ = t;
        }
    ;

sumExpression:
    sumExpression sumop term 
        {
            TreeNode *t = newExpNode(OP);
            t->lineno = $2->lineno;
            t->attr.op = $2->attr.op;
            insertChild(t, $1);
            insertChild(t, $3);
            free($2);
            $$ = t;
        }
    | term
        {
            $$=$1;
        }
    ;

sumop:
    PL 
        {
            TreeNode *t = newExpNode(OP);
            t->lineno = $1.line;
            t->attr.op = PLUS;
            t->attr.name = strdup("PL");
            $$ = t;
        }
    | MI
        {
            TreeNode *t = newExpNode(OP);
            t->lineno = $1.line;
            t->attr.op = DASH;
            t->attr.name = strdup("MI");
            $$ = t;
        }
    ;

term:
    term mulop unaryExpression 
        {
            TreeNode *t = newExpNode(OP);
            t->lineno = $2->lineno;
            t->attr.op = $2->attr.op;
            insertChild(t, $1);
            insertChild(t, $3);
            free($2);
            $$ = t;                    
        }
    | unaryExpression{
            $$=$1;}
    ;

mulop:
    MUL
        {
            TreeNode *t = newExpNode(OP);
            t->lineno = $1.line;
            t->attr.op = ASTERISK;
            t->attr.name = strdup("MUL");
            $$ = t;
        }
    | DIV
        {
            TreeNode *t = newExpNode(OP);
            t->lineno = $1.line;
            t->attr.op = FSLASH;
            t->attr.name = strdup("DIV");
            $$ = t;
        }
    | PERC
        {
            TreeNode *t = newExpNode(OP);
            t->lineno = $1.line;
            t->attr.op = MOD;
            t->attr.name = strdup("PERC");
            $$ = t;
        }
    ;

unaryExpression:
    unaryop unaryExpression
        {
            TreeNode *t = newExpNode(OP);
            t->lineno = $1->lineno;
            t->attr.op = $1->attr.op;
            insertChild(t, $2);
            free($1);
            $$ = t;
        }
    | factor{
            $$=$1; }
    ;

unaryop:
    MI
        {
            TreeNode *t = newExpNode(OP);
            t->attr.op = DASH;
            t->lineno = $1.line;
            t->attr.name = strdup("MI");
            $$ = t;
        }
    | MUL
        {
            TreeNode *t = newExpNode(OP);
            t->attr.op = ASTERISK;
            t->lineno = $1.line;
            t->attr.name = strdup("MUL");
            $$ = t;
        }
    | QM
        {
            TreeNode *t = newExpNode(OP);
            t->attr.op = QMARK;
            t->lineno = $1.line;
            t->attr.name = strdup("QM");
            $$ = t;
        }
    ;

factor:
    immutable {
            $$=$1;}
    | mutable{
            $$=$1; }
    ;

mutable:
    mutable LBOX expression RBOX 
        {
            TreeNode *t = newExpNode(OP);
            t->attr.op = LSB;
            t->lineno = $2.line;
            t->attr.name = strdup("LBOX");
            //t->isArray = 1;
            $1->isArray = 1;
            insertChild(t, $1);
            insertChild(t, $3);
            $$ = t;
        }
    | mutable DOT IDVAL
        {
            TreeNode *t = newExpNode(OP);
            t->attr.op = PERIODK;
            t->attr.name = strdup("DOT");
            t->lineno = $3.line;
            TreeNode *t2 = newExpNode(ID);
            t2->attr.name = $3.str;
            t2->lineno = $3.line;
            $1->isArray = 1;
            insertChild(t, $1);
            insertChild(t, t2);

            $$ = t;
        }
    | IDVAL 
        {
            TreeNode *t = newExpNode(ID);
            t->attr.name = strdup($1.str);
            t->lineno = $1.line;
            $$ = t;
        }
    
    ;

immutable:
    LPAREN expression RPAREN 
        {
            $$=$2;
        }
    | call {
            $$=$1; }
    | constant{
            $$=$1; }
    ;

call:
    IDVAL LPAREN args RPAREN
        {
            TreeNode* t = newStmtNode(CALL);
            t->attr.name = strdup($1.str);
            
            t->lineno = $1.line;
            insertChild(t, $3);
            $$ = t;
        }
    ;

args:
    argList {$$=$1;}
    | %empty {$$=NULL;}
    ;

argList:
    argList COMMA expression         
        {
            if($1 != NULL) {
                $3->isParam = 1;
                insertSibling($1, $3);
                $$ = $1;
            } else {
                $$ = $3;
            }
        }
    | expression {$$=$1; }

    ;

constant:
    NUM 
        {
            TreeNode* t = newExpNode(CONST);
            t->attr.val = $1.val;
            t->lineno = $1.line;
            t->expType = NUMB;
            t->attr.name = strdup("NUM");
            $$ = t; 
        }
    | CHAR        
        {
            TreeNode* t = newExpNode(CONST);
            t->attr.val = $1.ltr;
            t->lineno = $1.line;
            t->expType = SINGLE;
            t->attr.name = strdup("CHAR");
            $$ = t;
        }
    | BOOLT        
        {
            TreeNode* t = newExpNode(CONST);
            t->attr.val = $1.val;
            t->lineno = $1.line;
            t->expType = TF;
            t->attr.name = strdup("true");
            $$ = t;
        } 
    | BOOLF        
        {
            TreeNode* t = newExpNode(CONST);
            t->attr.val = $1.val;
            t->lineno = $1.line;
            t->expType = TF;
            t->attr.name = strdup("false");
            $$ = t;
        }
    ;

%%

// NOTE - use only one command line argument at a time, otherwise it may erase file data
int main(int argc, char** argv) {
    int c;
    int p = 0;
    int type = 0;
    while((c = getopt(argc, argv, "dpP:")) != -1) {
        switch(c) {
            case 'd':
                yydebug = 1;
                break;
            case 'P':
                type = 1;
                break;
            case 'p':
                p = 1;
                break;
            default:
                yydebug = 0; p = 0; type = 0;
                break;
        }
    }
    //printf("%d %d %d\n", yydebug, p, type);
    FILE *file;
    FILE *outf;
    if(yydebug == 1 | p == 1 | type == 1) {
        file = fopen(argv[2], "r");
        outf = fopen(argv[3], "w");
    } else {
        file = fopen(argv[1], "r");
        outf = fopen(argv[2], "w");
    }

    if(!file) {
        do{
            yyparse();
        }while(!feof(yyin));
    } else {
        yyin = file;
        do{
		    yyparse();
	    }while(!feof(yyin));
    }

    scopeAndType(syntaxTree);


    if(p == 1) printTree(stdout, syntaxTree);
    if(type == 1) printPTree(stdout, syntaxTree);

    // adding IO routines after printing
    //output
    TreeNode *tmp1 = newDeclNode(FUNC);
        tmp1->expType = 0;
        tmp1->lineno = -1;
        tmp1->isFunc = 1;
        tmp1->attr.name = "output";
    TreeNode *tmp2 = newDeclNode(VAR);
        tmp2->expType = 1;
        tmp2->lineno = -1;
        tmp2->isParam = 1;
        tmp2->attr.name = "*dummy*";
    insertChild(tmp1, tmp2);
    insertSibling(syntaxTree, tmp1);
    //outputb
    tmp1 = newDeclNode(FUNC);
        tmp1->expType = 0;
        tmp1->lineno = -1;
        tmp1->isFunc = 1;
        tmp1->attr.name = "outputb";
    tmp2 = newDeclNode(VAR);
        tmp2->expType = 2;
        tmp2->lineno = -1;
        tmp2->isParam = 1;
        tmp2->attr.name = "*dummy*";
    insertChild(tmp1, tmp2);
    insertSibling(syntaxTree, tmp1);
    //outputc    
    tmp1 = newDeclNode(FUNC);
        tmp1->expType = 0;
        tmp1->lineno = -1;
        tmp1->isFunc = 1;
        tmp1->attr.name = "outputc";
    tmp2 = newDeclNode(VAR);
        tmp2->expType = 3;
        tmp2->lineno = -1;
        tmp2->isParam = 1;
        tmp2->attr.name = "*dummy*";
    insertChild(tmp1, tmp2);
    insertSibling(syntaxTree, tmp1);
    //input    
    tmp1 = newDeclNode(FUNC);
        tmp1->expType = 1;
        tmp1->lineno = -1;
        tmp1->isFunc = 1;
        tmp1->attr.name = "input";
    insertSibling(syntaxTree, tmp1);
    //inputb    
    tmp1 = newDeclNode(FUNC);
        tmp1->expType = 2;
        tmp1->lineno = -1;
        tmp1->isFunc = 1;
        tmp1->attr.name = "inputb";
    insertSibling(syntaxTree, tmp1);
    //inputc    
    tmp1 = newDeclNode(FUNC);
        tmp1->expType = 3;
        tmp1->lineno = -1;
        tmp1->isFunc = 1;
        tmp1->attr.name = "inputc";
    insertSibling(syntaxTree, tmp1);
    //outnl    
    tmp1 = newDeclNode(FUNC);
        tmp1->expType = 0;
        tmp1->lineno = -1;
        tmp1->isFunc = 1;
        tmp1->attr.name = "outnl";
    insertSibling(syntaxTree, tmp1);

    //printf("\n\n\n\n");
    //printTree(stdout, syntaxTree);
    fprintf(stdout, "Number of warnings: %d\n",numWarnings);
    fprintf(stdout, "Number of errors: %d\n",numErrors);
  
}
*/

