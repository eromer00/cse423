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
#include "printtree.h"
#include "semantic.h"
#include "codegen.h"
#include "optimizer.h"

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

extern int globalOffset;
char *filename = NULL;

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
%type <treeNode> program declarationList declaration recDeclaration varDeclaration scopedVarDeclaration
%type <treeNode> varDeclList varDeclInitialize varDeclId scopedTypeSpecifier typeSpecifier returnTypeSpecifier
%type <treeNode> funDeclaration params paramList paramTypeList paramIdList paramId statement matched unmatched
%type <treeNode> compoundStmt localDeclarations statementList expressionStmt iterationHeader otherStmt unaryRelExpression
%type <treeNode> returnStmt breakStmt expression simpleExpression andExpression unaryExpression relExpression
%type <treeNode> relop sumExpression sumop term mulop unaryop factor mutable immutable call args argList constant

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
	RECORD RECTYPE LCB localDeclarations RCB
	{
		TreeNode* t = newDeclNode(recDec);
		TreeNode* i = t;

		int c = 0;

		t->isRecord = 1;
		t->attr.name = strdup($2.string);
		t->lineno = $1.lineNumber;

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
	typeSpecifier varDeclList SCOLON
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
	scopedTypeSpecifier varDeclList SCOLON
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
	ID LSQB NUMCONST RSQB
	{
		TreeNode* t = newDeclNode(varDec);

		t->attr.name = strdup($1.string);

		t->isArray = 1;
		t->size = $3.value + 1;

		$$ = t;
	}
	| ID
	{
		TreeNode* t = newDeclNode(varDec);

		t->attr.name = strdup($1.string);

		t->lineno = $1.lineNumber;

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
		t->recType = strdup($1.string);

		$$ = t;
	}
	;

returnTypeSpecifier:
	INT
	{
		TreeNode* t = newDeclNode(varDec);

		t->expType = Integer;

		$$ = t;
	}
	| BOOL
	{

		TreeNode* t = newDeclNode(varDec);

		t->expType = Boolean;

		$$ = t;
	}
	| CHAR
	{

		TreeNode* t = newDeclNode(varDec);

		t->expType = Char;

		$$ = t;
	}
	;

funDeclaration:
	typeSpecifier ID LPAREN params RPAREN statement
	{
		TreeNode* t = newDeclNode(funDec);

		t->child[0] = $4;
		t->child[1] = $6;

		t->lineno = $2.lineNumber;

		t->attr.name = strdup($2.string);

		t->expType = $1->expType;

		free($1);
		$$ = t;
	}
	| ID LPAREN params RPAREN statement
	{

		TreeNode* t = newDeclNode(funDec);

		t->child[0] = $3;
		t->child[1] = $5;

		t->attr.name = strdup($1.string);
		t->lineno = $1.lineNumber;

		t->expType = Void;

		$$ = t;
	}
	;

params:
	paramList { $$ = $1; }
	| %empty { $$ = NULL; }
	;

paramList:
	paramList SCOLON paramTypeList
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
	ID LSQB RSQB
	{
		TreeNode* t = newDeclNode(varDec);

		t->attr.name = strdup($1.string);

		t->size = 1;

		t->lineno = $1.lineNumber;

		t->isArray = 1;
		t->isParam = 1;

		$$ = t;
	}
	| ID
	{
		TreeNode* t = newDeclNode(varDec);

		t->attr.name = strdup($1.string);

		t->size = 1;

		t->lineno = $1.lineNumber;

		t->isParam = 1;

		$$ = t;
	}
	;

statement:
	matched  { $$ = $1; }
	| unmatched  { $$ = $1; }
	;

matched:
	IF LPAREN simpleExpression RPAREN matched ELSE matched
	{
		TreeNode* t = newStmtNode(IfK);

		t->lineno = $1.lineNumber;

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
	| otherStmt { $$ = $1; }
	;

unmatched:
	IF LPAREN simpleExpression RPAREN matched
	{
		TreeNode* t = newStmtNode(IfK);

		t->lineno = $1.lineNumber;

		t->child[0] = $3;
		t->child[1] = $5;

		$$ = t;
	} 
	| IF LPAREN simpleExpression RPAREN unmatched
	{
		TreeNode* t = newStmtNode(IfK);

		t->lineno = $1.lineNumber;

		t->child[0] = $3;
		t->child[1] = $5;

		$$ = t;
	}
	| IF LPAREN simpleExpression RPAREN matched ELSE unmatched
	{
		TreeNode* t = newStmtNode(IfK);

		t->lineno = $1.lineNumber;

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
	WHILE LPAREN simpleExpression RPAREN
	{
		TreeNode* t = newStmtNode(RepeatK);

		t->lineno = $1.lineNumber;

		t->child[0] = $3;

		$$ = t;
	}
	;

otherStmt:
	expressionStmt { $$ = $1; }
	| compoundStmt { $$ = $1; }
	| returnStmt { $$ = $1; }
	| breakStmt { $$ = $1; }
	;

compoundStmt:
	LCB localDeclarations statementList RCB
	{
		TreeNode* t = newStmtNode(CompoundK);

		t->lineno = $1.lineNumber;

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
	expression SCOLON { $$ = $1; }
	| SCOLON { $$ = NULL; }
	;

returnStmt:
	RETURN SCOLON
	{
		TreeNode* t = newStmtNode(ReturnK);

		$$ = t;
	}
	| RETURN expression SCOLON
	{
		TreeNode* t = newStmtNode(ReturnK);

		t->lineno = $1.lineNumber;

		t->child[0] = $2;

		$$ = t;
	}
	;

breakStmt:
	BREAK SCOLON
	{
		TreeNode* t = newStmtNode(BreakK);

		$$ = t;
	}
	;

expression:
	mutable ASSIGN expression
	{
		TreeNode* t = newExpNode(OpK);

		t->child[0] = $1;
		t->child[1] = $3;

		t->attr.op = assign;

		t->lineno = $2.lineNumber;

		$$ = t;
	}
	| mutable ADDASS expression
	{
		TreeNode* t = newExpNode(OpK);

		t->child[0] = $1;
		t->child[1] = $3;

		t->attr.op = passign;

		t->lineno = $2.lineNumber;

		$$ = t;
	}
	| mutable SUBASS expression
	{
		TreeNode* t = newExpNode(OpK);

		t->child[0] = $1;
		t->child[1] = $3;

		t->attr.op = sassign;

		t->lineno = $2.lineNumber;

		$$ = t;
	}
	| mutable MULASS expression
	{
		TreeNode* t = newExpNode(OpK);

		t->child[0] = $1;
		t->child[1] = $3;

		t->attr.op = massign;

		t->lineno = $2.lineNumber;

		$$ = t;
	}
	| mutable DIVASS expression
	{
		TreeNode* t = newExpNode(OpK);

		t->child[0] = $1;
		t->child[1] = $3;

		t->attr.op = dassign;

		t->lineno = $2.lineNumber;

		$$ = t;
	}
	| mutable INC
	{
		TreeNode* t = newExpNode(OpK);

		t->child[0] = $1;

		t->attr.op = pplus;

		t->lineno = $2.lineNumber;

		$$ = t;
	}
	| mutable DEC
	{
		TreeNode* t = newExpNode(OpK);

		t->child[0] = $1;

		t->attr.op = ddash;

		t->lineno = $2.lineNumber;

		$$ = t;
	}
	| simpleExpression { $$ = $1; }
	;

simpleExpression:
	simpleExpression OR andExpression
	{
		TreeNode* t = newExpNode(OpK);

		t->child[0] = $1;
		t->child[1] = $3;

		t->attr.op = bOR;

		t->lineno = $2.lineNumber;

		$$ = t;
	}
	| andExpression { $$ = $1; }
	;

andExpression:
	andExpression AND unaryRelExpression
	{
		TreeNode* t = newExpNode(OpK);

		t->child[0] = $1;
		t->child[1] = $3;

		t->attr.op = bAND;

		t->lineno = $2.lineNumber;

		$$ = t;
	}
	| unaryRelExpression { $$ = $1; }
	;

unaryRelExpression:
	NOT unaryRelExpression
	{
		TreeNode* t = newExpNode(OpK);

		t->child[0] = $2;

		t->attr.op = bNOT;

		t->lineno = $1.lineNumber;

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
	LESSEQ
	{
		TreeNode* t = newExpNode(OpK);

		t->attr.op = lteq;

		$$ = t;
	}
	| LTHAN
	{
		TreeNode* t = newExpNode(OpK);

		t->attr.op = lthan;

		$$ = t;
	}
	| GTHAN
	{
		TreeNode* t = newExpNode(OpK);

		t->attr.op = gthan;

		$$ = t;
	}
	| GRTEQ
	{
		TreeNode* t = newExpNode(OpK);

		t->attr.op = gteq;

		$$ = t;
	}
	| EQ
	{
		TreeNode* t = newExpNode(OpK);

		t->attr.op = eqeq;

		$$ = t;
	}
	| NOTEQ
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
	PLUS
	{
		TreeNode* t = newExpNode(OpK);

		t->attr.op = plus;

		$$ = t;
	}
	| DASH
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
	ASTERISK
	{
		TreeNode* t = newExpNode(OpK);

		t->attr.op = asterisk;

		$$ = t;
	}
	| FSLASH
	{
		TreeNode* t = newExpNode(OpK);

		t->attr.op = fslash;

		$$ = t;
	}
	| MOD
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
	DASH
	{
		TreeNode* t = newExpNode(OpK);

		t->attr.op = dash;

		$$ = t;
	}
	| ASTERISK
	{
		TreeNode* t = newExpNode(OpK);

		t->attr.op = asterisk;

		$$ = t;
	}
	| RANDOM
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
	mutable LSQB expression RSQB
	{
		TreeNode* t = newExpNode(OpK);

		t->child[0] = $1;
		t->child[1] = $3;

		t->attr.op = lsb;

		t->lineno = $2.lineNumber;

		$$ = t;
	}
	| mutable PERIOD ID
	{
		TreeNode* t = newExpNode(OpK);

		TreeNode* x = newExpNode(IdK);
		x->attr.name = strdup($3.string);

		t->child[0] = $1;
		t->child[1] = x;

		t->attr.op = period;

		t->lineno = $2.lineNumber;

		$$ = t;
	}
	| ID
	{
		TreeNode* t = newExpNode(IdK);

		t->attr.name = strdup($1.string);

		t->lineno = $1.lineNumber;

		$$ = t;
	}
	;

immutable:
	LPAREN expression RPAREN { $$ = $2; }
	| call { $$ = $1; }
	| constant { $$ = $1; }
	;

call:
	ID LPAREN args RPAREN
	{
		TreeNode* t = newExpNode(ExpK);

		t->attr.name = strdup($1.string);

		t->lineno = $1.lineNumber;

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
	NUMCONST
	{
		TreeNode* t = newExpNode(ConstK);

		t->attr.value = $1.value;
		t->expType = Integer;

		$$ = t;
	}
	| CHARCONST
	{
		TreeNode* t = newExpNode(ConstK);

		t->attr.cvalue = $1.letter;
		t->expType = Char;

		$$ = t;
	}
	| BOOLCONST
	{
		TreeNode* t = newExpNode(ConstK);

		t->attr.value = $1.value;
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
	* c - value of flag
	* long_options - array of word-sized options
	* option_index - location in arg list
	*/
	int c;
	struct option long_options[] = {};
	int option_index = 0;
	int redundant = 0, deadCode = 0, strengthReduction = 0;

	//Check for command line args
	do {
		/*
		* The string "" arg should contain all acceptable options
		*
		* d - debug on
		* p - print AST
		* P - print annotated AST
		*/
		c = getopt_long(argc, argv, "dpPrcsAh", long_options, &option_index);
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
		    //redundant expression Optimization
		    case 'r':
		        redundant = 1;
		        break;
	        //dead code optimization
	        case 'c':
	            deadCode = 1;
	            break;
            case 's':
                strengthReduction = 1;
                break;
            //do all optimizations
            case 'A':
                redundant = 1;
                deadCode = 1;
                strengthReduction = 1;
                break;
		    
			//No more options
			case -1:
				break;
			//Unknown option
			
			case 'h':
			default:
		        printf(""
		            "******************\n"
		            "Usage: ./c- -[dpPrcsAh] filepath\n"
		            "d: debug printing in parser\n"
		            "p: print AST\n"
		            "P: print Full AST\n"
		            "r: enable redundant expression optimization\n"
		            "c: enable dead code optimization\n"
		            "s: enable strength reduction optimization\n"
		            "A: enable all optimizations\n"
		        );
				return(-1);
				break;
		}
	}while(c != -1);

	//File name has also been provided
	if(optind < argc)
	{
		//Open file handle to read input
		FILE* myfile = fopen(argv[optind],"r");
		filename = argv[optind];

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

			fprintf(stdout, "Offset for end of global space: %d\n",globalOffset);

			//Print problem count
			printProbs(numWarnings, numErrors);
		}

		//Generate assembly language
		if(numErrors == 0){
		    if(redundant)
		        redundantCodeCheck(syntaxTree);
		
			codeGen(syntaxTree);
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
