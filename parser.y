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
#include "printTree.h"

//Inform bison about flex things
extern int yylex();
extern int yyparse();
extern FILE* yyin;
static TreeNode* syntaxTree;
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
%type <treeNode> program declarationList declaration recDeclaration varDeclaration ScopedVarDeclaration varDeclList varDeclInitialize varDeclId scopedTypeSpecifier typeSpecifier returnTypeSpecifier funDeclaration params paramList paramTypeList paramIdList paramId statement compoundStmt localDeclarations statementList expressionStmt iterationStmt returnStmt breakStmt expression simpleExpression andExpression unaryRelExpression relExpression relop sumExpression sumop term mulop unaryExpression unaryop factor mutable immutable call args argList constant


%%
program:
    declarationList {syntaxTree = $1;}
    ;

declarationList:
    declarationList declaration {if($1!=NULL){insertSibling($1,$2);$$=$1;}else{$$=$2;} }
    | declaration {$$=$1;}
    ;

declaration:
    varDeclaration {$$=$1;}
    | funDeclaration {$$=$1;}
    | recDeclaration{$$=$1;}
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
        {
            TreeNode* t = newStmtNode(CALL);
            t->attr.name = strdup($1.IDvalue);
            t->lineno = $1.lineNumber;
            insertChild(t, $3);
            $$ = t;
            free($4.IDValue);
            free($2.IDValue);
            free($1.IDValue);
        }
    ;

args:
    argList {$$=$1;}
    | %empty {}
    ;

argList:
    argList COMMA expression         
        {
            if($1!=NULL) {
                insertSibling($1,$3);
                $$=$1;
            }else{
                $$ = $3;
            }
        }
    | expression {$$=$1;}

    ;

constant:
    NUM 
        {
            TreeNode* t = newExpNode(CONST);
            t->attr.value = $1.value;
            t->expType = NUMB;
            $$ = t;
        }
    | CHAR        
        {
            TreeNode* t = newExpNode(CONST);
            t->attr.value = $1.value;
            t->expType = SINGLE;
            $$ = t;
        }
    | BOOLT        
        {
            TreeNode* t = newExpNode(CONST);
            t->attr.value = $1.value;
            t->expType = TF;
            $$ = t;
        } 
    | BOOLF        
        {
            TreeNode* t = newExpNode(CONST);
            t->attr.value = $1.value;
            t->expType = TF;
            $$ = t;
        }
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

