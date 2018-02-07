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
%token <token> BOOL KEY CHAR IDVAL NUM BOOLT BOOLF
%token <token> SEMICOLON COLON RECORD LBRACK RBRACK LPAREN RPAREN
%token <token> ANDCND BREAKCND COMMA DIEQ DIV DOT ELSECND EQ EQEQ
%token <token> GT GTEQ IFCND LBOX RBOX LS LSEQ MI MIEQ MIMI MUEQ
%token <token> MUL NOTCND NTEQ ORCND PERC PL PLEQ PLPL QM RETURNCND
%token <token> INTCND CHARCND BOOLCND INCND RECTYPE
%token <token> STATIC WHILECND

//Types for nonterminals



%%
program:
    declarationList
    ;

declarationList:
    declarationList declaration
    | declaration
    ;

declaration:
    varDeclaration 
    | funDeclaration 
    | recDeclaration
    ;

recDeclaration:
    RECORD IDVAL LBRACK localDeclarations RBRACK
    ;

varDeclaration:
    typeSpecifier varDeclList SEMICOLON
    ;

scopedVarDeclaration:
    scopedTypeSpecifier varDeclList SEMICOLON
    ;

varDeclList:
    varDeclList COMMA varDeclInitialize 
    | varDeclInitialize
    ;

varDeclInitialize:
    varDeclId 
    | varDeclId COLON simpleExpression
    ;

varDeclId:
    IDVAL 
    | IDVAL LBOX NUM RBOX
    ;

scopedTypeSpecifier:
    STATIC typeSpecifier 
    | typeSpecifier
    ;

typeSpecifier:
    returnTypeSpecifier 
    | RECTYPE
    ;

returnTypeSpecifier:
    INTCND 
    | BOOLCND
    | CHARCND
    ;

funDeclaration:
    typeSpecifier IDVAL LPAREN params RPAREN statement 
    | IDVAL LPAREN params RPAREN statement
    ;

params:
    paramList 
    | %empty 
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
    IDVAL 
    | IDVAL LBOX RBOX
    ;

statement:
    expressionStmt 
    | compoundStmt 
    | selectionStmt 
    | iterationStmt 
    | returnStmt
    | breakStmt
    ;

compoundStmt:
    LBRACK localDeclarations statementList RBRACK
    ;

localDeclarations:
    localDeclarations scopedVarDeclaration 
    | %empty
    ;

statementList:
    statementList statement 
    | %empty
    ;

expressionStmt:
    expression SEMICOLON 
    | SEMICOLON
    ;

selectionStmt:
    IFCND LPAREN simpleExpression RPAREN statement 
    | IFCND LPAREN simpleExpression RPAREN statement ELSECND statement
    ;

iterationStmt:
    WHILECND LPAREN simpleExpression RPAREN statement
    ;

returnStmt:
    RETURNCND SEMICOLON 
    | RETURNCND expression SEMICOLON
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
    | %empty
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

