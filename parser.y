%{

/*
    Group: Spaghet_Code
    Members: Erik Romero, Carlos Rubio, Franz Chavez
    File: parser.y
    Description: bison program to parse the tokenized c- language from flex
*/

//Import input/output functions
#include<stdio.h>
//Import exit functionality
#include<stdlib.h>
#include "scanType.h"

//Inform bison about flex things
extern int yylex();
extern int yyparse();
extern FILE* yyin;

//Error function
void yyerror(const char* s);
%}

//Use a union to hold possible token data types
%union {
    Token token;
}

//Associate token types with union fields
%token <token> BOOL KEY CHAR IDVAL KEYCHAR NUM BOOLT BOOLF
%token <token> SEMICOLON COLON RECORD LBRACK RBRACK LPAREN RPAREN
%token <token> ANDCND BREAKCND COMMA DIEQ DIV DOT ELSECND EQ EQEQ
%token <token> GT GTEQ IFCND LBOX RBOX LS LSEQ MI MIEQ MIMI MUEQ
%token <token> MUL NOTCND NTEQ ORCND PERC PL PLEQ PLPL QM RETURNCND
%token <token> INTCND CHARCND BOOLCND INCND
%token <token> STATIC WHILECND

//Types for nonterminals

%type <token> program declarationList declaration 
%type <token> recDeclaration
%type <token> varDeclaration scopedVarDeclaration varDeclList varDeclInitialize varDeclID scopedTypeSpecifier typeSpecifier returnTypeSpecifier 
%type <token> funDeclaration params paramList paramTypeList paramIdList paramId 
%type <token> statement matchstmt unmatchstmt compoundStmt localDeclarations statementList expressionStmt otherstatement iterationStmt returnStmt breakStmt 
%type <token> expression simpleExpression andExpression unaryRelExpression relExpression relop sumExpression sumop term mulop unaryExpression unaryop factor mutable immutable call args argList constant

//Grammar starting point
%start program

%%

//1
program:
    //words
	declarationList
    ;

//2
declarationList:
    declarationList declaration
    | declaration
    ;

//3
declaration:
    varDeclaration
    | funDeclaration
    | recDeclaration
    ;

/*------------------------------------*/

recDeclaration:
    RECORD IDVAL LBRACK localDeclarations RBRACK// { printf("%s %s %s %s %s\n", ($1).str, ($2).str, ($3).str, $4.str, ($5).str);}
    ; 
	
/*
extDeclaration:
    CHAR { $$ = $1.str; }
    | BOOL { $$ = $1.str; }
    | KEY { $$ = $1.str; }
    | RECORD { $$ = $1.str; }
    | SEMICOLON { $$ = $1.str; }
    | COLON { $$ = $1.str; }
    | LBRACK { $$ = $1.str; }
    | RBRACK { $$ = $1.str; }
    | IDVAL { $$ = $1.str; }
    | NUM { $$ = $1.str; }
    ;  
*/
/*------------------------------------*/

//5
varDeclaration:
    typeSpecifier varDeclList
    ;

//6
scopedVarDeclaration:
    scopedTypeSpecifier varDeclList SEMICOLON
    ;

//7
varDeclList:
    varDeclList COMMA varDeclInitialize
    | varDeclInitialize
    ;

//8
varDeclInitialize:
    varDeclID COLON simpleExpression
    | varDeclID
    ;

//9
varDeclID:
    IDVAL LBOX NUM RBOX
    IDVAL
    ;

//10
scopedTypeSpecifier:
    STATIC typeSpecifier
    | typeSpecifier
    ;

//11
typeSpecifier:
    returnTypeSpecifier
    ;

//12
returnTypeSpecifier:
    INTCND
    | BOOLCND
    | CHARCND
    ;

/*------------------------------------*/

//13
funDeclaration:
    typeSpecifier IDVAL LPAREN params RPAREN statement
    | IDVAL LPAREN params RPAREN statement
    ;

//14
params:
    paramList
    | /* empty */ { int x = 0; }
    ;

//15
paramList:
    paramList SEMICOLON paramTypeList
    | paramTypeList
    ;

//16
paramTypeList:
    typeSpecifier paramIdList
    ;

//17
paramIdList:
    paramIdList COMMA paramId
    | paramId
    ;

//18
paramId:
    IDVAL LPAREN RPAREN
    | IDVAL
    ;

/*------------------------------------*/

/* modified from original */
statement:
    matchstmt
    | unmatchstmt
    ;

matchstmt:
    IFCND LPAREN simpleExpression RPAREN matchstmt ELSECND matchstmt
    | otherstatement
    ;

unmatchstmt:
    IFCND LPAREN simpleExpression RPAREN matchstmt ELSECND unmatchstmt
    | IFCND LPAREN simpleExpression RPAREN matchstmt
    | IFCND LPAREN simpleExpression RPAREN unmatchstmt
    ;

//19
otherstatement:
    expressionStmt
    | compoundStmt
    | iterationStmt
    | returnStmt
    | breakStmt
    ;

//20
compoundStmt:
    LBRACK localDeclarations statementList RBRACK
    ;

//21
localDeclarations:
    localDeclarations scopedVarDeclaration
    | /* empty */ { int x = 0; }
    ;

//22
statementList:
    statementList statement
    | /* empty */ { int x = 0; }
    ;

//23
expressionStmt:
    expression SEMICOLON
    | SEMICOLON
    ;

//24
/*
selectionStmt:
    IFCND LPAREN simpleExpression RPAREN statement
    | IFCND LPAREN simpleExpression RPAREN statement ELSECND statement
    ;
*/

//25
iterationStmt:
    WHILECND LPAREN simpleExpression RPAREN statement
    ;

//26
returnStmt:
    RETURNCND expression SEMICOLON
    | RETURNCND SEMICOLON
    ;

//27
breakStmt:
    BREAKCND SEMICOLON
    ;

/*------------------------------------*/

//28
expression:
    mutable EQ expression
    | mutable PLEQ expression
    | mutable MIEQ expression
    | mutable MUEQ expression
    | mutable DIEQ expression
    | mutable PLPL
    | mutable MIMI
    | simpleExpression
    ;

//29
simpleExpression:
    simpleExpression ORCND andExpression
    | andExpression
    ;

//30
andExpression:
    andExpression ANDCND unaryRelExpression
    | unaryRelExpression
    ;

//31
unaryRelExpression:
    NOTCND unaryRelExpression
    | relExpression
    ;

//32
relExpression:
    sumExpression relop sumExpression
    | sumExpression
    ;

//33
relop:
    LSEQ
    | LS
    | GT
    | GTEQ
    | EQEQ
    | NTEQ
    ;

//34
sumExpression:
    sumExpression sumop term
    | term
    ;

//35
sumop:
    PL
    | MI
    ;

//36
term:
    term mulop unaryExpression
    | unaryExpression
    ;

//37
mulop:
    MUL
    | DIV
    | PERC
    ;

//38
unaryExpression:
    unaryop unaryExpression
    | factor
    ;

//39
unaryop:
    MI
    | MUL
    | QM
    ;

//40
factor:
    immutable
    | mutable
    ;

//41
mutable:
    IDVAL
    | mutable LBOX expression RBOX
    | mutable DOT IDVAL
    ;

//42
immutable:
    LPAREN expression RPAREN
    | call
    | constant
    ;

//43
call:
    IDVAL LPAREN args RPAREN
    ;

//44
args:
    argList
    | /* empty */ { int x = 0; }
    ;

//45
argList:
    argList COMMA expression
    | expression
    ;

//46
constant:
    NUM
    | CHAR
    | BOOLT
    | BOOLF
    ;


/*
words:
	words word |
    word
	;
*/
/*
word:
	CHAR { printf("%s", $1.str); }
    | BOOL { printf("%s", $1.str); }
    | KEY { printf("%s", $1.str); }
    | IDVAL { printf("%s", $1.str); }
    | NUM { printf("%s", $1.str); }
    | BOOLT  { printf("%s", $1.str); }
    | BOOLF { printf("%s", $1.str); }
    | SEMICOLON  { printf("%s", $1.str); }| COLON { printf("%s", $1.str); } | RECORD { printf("%s", $1.str); } | LBRACK { printf("%s", $1.str); } | RBRACK { printf("%s", $1.str); } | LPAREN { printf("%s", $1.str); } | RPAREN { printf("%s", $1.str); }
    | ANDCND { printf("%s", $1.str); } | BREAKCND { printf("%s", $1.str); } | COMMA { printf("%s", $1.str); } | DIEQ { printf("%s", $1.str); } | DIV { printf("%s", $1.str); } | DOT { printf("%s", $1.str); } | ELSECND { printf("%s", $1.str); } | EQ { printf("%s", $1.str); } | EQEQ {printf("%s", $1.str); }
    | GT { printf("%s", $1.str); } | GTEQ { printf("%s", $1.str); } | IFCND { printf("%s", $1.str); } | LBOX { printf("%s", $1.str); } | RBOX {printf("%s", $1.str); } | LS { printf("%s", $1.str); } | LSEQ { printf("%s", $1.str); } | MI { printf("%s", $1.str); } | MIEQ { printf("%s", $1.str); } | MIMI { printf("%s", $1.str); } | MUEQ { printf("%s", $1.str); }
    | MUL { printf("%s", $1.str); } | NOTCND { printf("%s", $1.str);} | NTEQ { printf("%s", $1.str); } | ORCND { printf("%s", $1.str); } | PERC { printf("%s", $1.str); } | PL { printf("%s", $1.str); } | PLEQ { printf("%s", $1.str); } | PLPL { printf("%s", $1.str); } | QM { printf("%s", $1.str); } | RETURNCND { printf("%s", $1.str); }
    | INTCND { printf("%s", $1.str); } | CHARCND { printf("%s", $1.str); } | BOOLCND { printf("%s", $1.str); } | INCND { printf("%s", $1.str); }
    | STATIC { printf("%s", $1.str); } | WHILECND { printf("%s", $1.str); }
	;
*/
%%

int main(int argc, char** argv) {

    
    FILE *file = fopen(argv[1], "r");
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

}

