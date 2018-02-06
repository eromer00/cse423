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


%%


program:
    declarationList { printf("a1 "); }
    ;

declarationList:
    declarationList declaration { printf("a2 "); }
    | declaration { printf("b2 "); }
    | %empty { printf("c2 "); }
    ;

declaration:
    varDeclaration { printf("a3 "); }
    | funDeclaration { printf("b3 "); }
    | recDeclaration { printf("c3 "); }
    ;


recDeclaration:
    RECORD IDVAL LBRACK localDeclarations RBRACK { printf("a4 "); }
    ; 

varDeclaration:
    typeSpecifier varDeclList { printf("a5 "); }
    ;

scopedVarDeclaration:
    scopedTypeSpecifier varDeclList SEMICOLON { printf("a6 "); }
    ;

varDeclList:
    varDeclList COMMA varDeclInitialize { printf("a7 "); }
    | varDeclInitialize { printf("b7 "); }
    ;

varDeclInitialize:
    varDeclID COLON simpleExpression { printf("a8 "); }
    | varDeclID { printf("b8 "); }
    ;

varDeclID:
    IDVAL LBOX NUM RBOX { printf("a9 "); }
    | IDVAL { printf("b9 "); }
    ;

scopedTypeSpecifier:
    STATIC typeSpecifier { printf("a10 "); }
    | typeSpecifier { printf("b10 "); }
    ;

typeSpecifier:
    returnTypeSpecifier { printf("a11 "); }
    ;

returnTypeSpecifier:
    INTCND { printf("a12 "); }
    | BOOLCND { printf("b12 "); }
    | CHARCND { printf("c12 "); }
    ;

funDeclaration:
    typeSpecifier IDVAL LPAREN params RPAREN statement { printf("a13 "); }
    | IDVAL LPAREN params RPAREN statement { printf("b13 "); }
    ;

params:
    paramList
    | %empty {}
    ;

paramList:
    paramList SEMICOLON paramTypeList
    | paramTypeList
    ;

paramTypeList:
    typeSpecifier paramIdList
    ;

paramIdList:
    paramIdList COMMA paramId
    | paramId
    ;

paramId:
    IDVAL LPAREN RPAREN
    | IDVAL
    ;

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

otherstatement:
    expressionStmt
    | compoundStmt
    | iterationStmt
    | returnStmt
    | breakStmt
    ;

compoundStmt:
    LBRACK localDeclarations statementList RBRACK
    ;

localDeclarations:
    localDeclarations scopedVarDeclaration
    | %empty {}
    ;

statementList:
    statementList statement
    | %empty {}
    ;

expressionStmt:
    expression SEMICOLON
    | SEMICOLON
    ;

iterationStmt:
    WHILECND LPAREN simpleExpression RPAREN statement
    ;

returnStmt:
    RETURNCND expression SEMICOLON
    | RETURNCND SEMICOLON
    ;

breakStmt:
    BREAKCND SEMICOLON
    ;

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

simpleExpression:
    simpleExpression ORCND andExpression
    | andExpression
    ;

andExpression:
    andExpression ANDCND unaryRelExpression
    | unaryRelExpression
    ;

unaryRelExpression:
    NOTCND unaryRelExpression
    | relExpression
    ;

relExpression:
    sumExpression relop sumExpression
    | sumExpression
    ;

relop:
    LSEQ
    | LS
    | GT
    | GTEQ
    | EQEQ
    | NTEQ
    ;

sumExpression:
    sumExpression sumop term
    | term
    ;

sumop:
    PL
    | MI
    ;

term:
    term mulop unaryExpression
    | unaryExpression
    ;

mulop:
    MUL
    | DIV
    | PERC
    ;

unaryExpression:
    unaryop unaryExpression
    | factor
    ;

unaryop:
    MI
    | MUL
    | QM
    ;

factor:
    immutable
    | mutable
    ;

mutable:
    IDVAL
    | mutable LBOX expression RBOX
    | mutable DOT IDVAL
    ;

immutable:
    LPAREN expression RPAREN
    | call
    | constant
    ;

call:
    IDVAL LPAREN args RPAREN
    ;

args:
    argList
    | %empty {}
    ;

argList:
    argList COMMA expression
    | expression
    ;

constant:
    NUM
    | CHAR
    | BOOLT
    | BOOLF
    ;

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

