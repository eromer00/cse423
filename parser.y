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
#include<string.h>
#include<unistd.h>
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
%type <treeNode> program declarationList declaration recDeclaration varDeclaration scopedVarDeclaration varDeclList varDeclInitialize varDeclId scopedTypeSpecifier typeSpecifier returnTypeSpecifier funDeclaration params paramList paramTypeList paramIdList paramId statement otherstatement matched unmatched compoundStmt localDeclarations statementList expressionStmt iterationStmt returnStmt breakStmt expression simpleExpression andExpression unaryRelExpression relExpression relop sumExpression sumop term mulop unaryExpression unaryop factor mutable immutable call args argList constant


%%
program:
    declarationList {syntaxTree = $1;                  
                    }
    ;

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
            TreeNode *t = newDeclNode(REC);
            t->attr.name = strdup($2.str);
            insertChild(t, $4);
            t->lineno = $1.line;
            $$ = t;
        }
    ;

varDeclaration:
    typeSpecifier varDeclList SEMICOLON 
        {
            if($1 != NULL) {
                insertChild($1,$2);
                $$=$1;
            } else {
                $$=$2;
            } 
        }
    ;

scopedVarDeclaration:
    scopedTypeSpecifier varDeclList SEMICOLON 
        {
            if($1 != NULL) {
                insertChild($1,$2);
                $$=$1;
            } else {
                $$=$2;
            } 
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
    varDeclId 
        {
            $$ = $1; 
        }
    | varDeclId COLON simpleExpression 
        {
            if($1 != NULL) {
                insertChild($1, $3);
                $$ = $1;
            } else {
                $$ = $3;
            }
        }
    ;

varDeclId:
    IDVAL 
        {
            TreeNode *t = newExpNode(ID);
            t->attr.name = strdup($1.str);
            t->lineno = $1.line;
            $$ = t;
        }
    | IDVAL LBOX NUM RBOX 
        {
            TreeNode *t = newExpNode(ID);
            t->attr.name = strdup($1.str);
            t->attr.value = $1.val;
            t->isArray = 1;
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
            t->expType = VOID;
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
            t->expType = $1->expType;
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
            $2->expType = $1->expType;
            free($1);
            $$ = $2;
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
    IDVAL 
        {
            TreeNode *t = newExpNode(ID);
            t->attr.name = strdup($1.str);
            t->lineno = $1.line;

            $$ = t;
        }
    | IDVAL LBOX RBOX 
        {
            TreeNode *t = newExpNode(ID);
            t->attr.name = strdup($1.str);
            t->lineno = $1.line;
            t->isArray = 1;

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
    | iterationStmt 
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

statement:
    matched {$$=$1;}
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
    | otherstatement {$$=$1; }
    ;

unmatched:
    IFCND LPAREN simpleExpression RPAREN unmatched 
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
    | IFCND LPAREN simpleExpression RPAREN matched 
        {
            TreeNode *t = newStmtNode(IF);
            t->attr.name = $1.str;
            t->lineno = $1.line;
    
            insertChild(t, $3);
            insertChild(t, $5);

            $$ = t;
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
            if($1 != NULL) {
                insertSibling($1,$2);
                $$ = $1;
            } else {
                $$ = $1;
            }
        }
    | %empty {$$ = NULL; }
    ;

expressionStmt:
    expression SEMICOLON {
            $$=$1; }
    | SEMICOLON{
            $$=NULL; }
    ;


iterationStmt:
    WHILECND LPAREN simpleExpression RPAREN statement
        {
            TreeNode *t = newStmtNode(WHILE);
            t->attr.name = $1.str;
            t->lineno = $1.line;

            insertChild(t, $3);
            insertChild(t, $5);
            $$ = t;
        }
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
            t->attr.name = "EQ";
            t->lineno = $2.line;
            t->attr.op = assign;
            insertChild(t, $1);
            insertChild(t, $3);
            $$ = t;
        }
    | mutable PLEQ expression 
        {
            TreeNode *t = newExpNode(OP);
            t->attr.name = "PLEQ";
            t->lineno = $2.line;
            t->attr.op = passign;
            insertChild(t, $1);
            insertChild(t, $3);
            $$ = t;
        }
    | mutable MIEQ expression
        {
            TreeNode *t = newExpNode(OP);
            t->attr.name = "MIEQ";
            t->lineno = $2.line;
            t->attr.op = sassign;
            insertChild(t, $1);
            insertChild(t, $3);
            $$ = t;
        }
    | mutable MUEQ expression 
        {
            TreeNode *t = newExpNode(OP);
            t->attr.name = "MUEQ";
            t->lineno = $2.line;
            t->attr.op = massign;
            insertChild(t, $1);
            insertChild(t, $3);
            $$ = t;
        }
    | mutable DIEQ expression 
        {
            TreeNode *t = newExpNode(OP);
            t->attr.name = "DIEQ";
            t->lineno = $2.line;
            t->attr.op = dassign;
            insertChild(t, $1);
            insertChild(t, $3);
            $$ = t;
        }
    | mutable PLPL 
        {
            TreeNode *t = newExpNode(OP);
            t->attr.name = "PLPL";
            t->lineno = $2.line;
            t->attr.op = pplus;
            insertChild(t, $1);
            $$ = t;
        }
    | mutable MIMI
        {
            TreeNode *t = newExpNode(OP);
            t->attr.name = "MIMI";
            t->lineno = $2.line;
            t->attr.op = ddash;
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
            t->attr.name = "ORCND";
            t->lineno = $2.line;
            t->attr.op = bor;
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
            t->attr.name = "ANDCND";
            t->lineno = $2.line;
            t->attr.op = band;
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
            t->attr.name = "NOTCND";
            t->attr.op = bnot;
            insertChild(t, $2);
            $$ = t;
        }
    | relExpression{
            $$=$1; }
    ;

relExpression:
    sumExpression relop sumExpression 
        {
            insertChild($2, $1);
            insertChild($2, $3);
            $$ = $2;
        }
    | sumExpression{
            $$=$1; }
    ;

relop:
    LSEQ
        {
            TreeNode *t = newExpNode(OP);
            t->lineno = $1.line;
            t->attr.name = "LSEQ";
            t->attr.op = lteq;
            $$ = t;
        }
    | LS
        {
            TreeNode *t = newExpNode(OP);
            t->lineno = $1.line;
            t->attr.name = "LS";
            t->attr.op = lthan;
            $$ = t;
        }
    | GT
        {
            TreeNode *t = newExpNode(OP);
            t->lineno = $1.line;
            t->attr.name = "GT";
            t->attr.op = gthan;
            $$ = t;
        }
    | GTEQ
        {
            TreeNode *t = newExpNode(OP);
            t->lineno = $1.line;
            t->attr.name = "GTEQ";
            t->attr.op = gteq;
            $$ = t;
        }
    | EQEQ
        {
            TreeNode *t = newExpNode(OP);
            t->lineno = $1.line;
            t->attr.name = "EQEQ";
            t->attr.op = eqeq;
            $$ = t;
        }
    | NTEQ
        {
            TreeNode *t = newExpNode(OP);
            t->lineno = $1.line;
            t->attr.name = "NTEQ";
            t->attr.op = neq;
            $$ = t;
        }
    ;

//check if issues arise
sumExpression:
    sumExpression sumop term 
        {
            insertChild($2, $1);
            insertChild($2, $3);
            $$ = $1;
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
            t->attr.name = "PL";
            t->attr.op = plus;
            $$ = t;
        }
    | MI
        {
            TreeNode *t = newExpNode(OP);
            t->lineno = $1.line;
            t->attr.name = "MI";
            t->attr.op = dash;
            $$ = t;
        }
    ;

term:
    term mulop unaryExpression 
        {
            insertChild($2, $1);
            insertChild($2, $3);
            $$ = $2;                       
        }
    | unaryExpression{
            $$=$1;}
    ;

mulop:
    MUL
        {
            TreeNode *t = newExpNode(OP);
            t->lineno = $1.line;

            t->attr.name = "MUL";
            t->attr.op = asterisk;
            $$ = t;
        }
    | DIV
        {
            TreeNode *t = newExpNode(OP);
            t->lineno = $1.line;

            t->attr.name = "DIV";
            t->attr.op = fslash;
            $$ = t;
        }
    | PERC
        {
            TreeNode *t = newExpNode(OP);
            t->lineno = $1.line;

            t->attr.name = "PERC";
            t->attr.op = mod;
            $$ = t;
        }
    ;

unaryExpression:
    unaryop unaryExpression
        {
            insertChild($1, $2);
            $$ = $1;
        }
    | factor{
            $$=$1; }
    ;

unaryop:
    MI
        {
            TreeNode *t = newExpNode(OP);
            t->attr.op = dash;
            t->attr.name = "MI";
            t->lineno = $1.line;
            $$ = t;
        }
    | MUL
        {
            TreeNode *t = newExpNode(OP);
            t->attr.op = asterisk;
            t->attr.name = "MUL";
            t->lineno = $1.line;
            $$ = t;
        }
    | QM
        {
            TreeNode *t = newExpNode(OP);
            t->attr.op = qmark;
            t->attr.name = "QM";
            t->lineno = $1.line;
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
    IDVAL 
        {
            TreeNode *t = newExpNode(ID);
            t->attr.name = strdup($1.str);
            t->lineno = $1.line;
            $$ = t;
        }
    | mutable LBOX expression RBOX 
        {
            TreeNode *t = newExpNode(OP);
            t->attr.op = lsb;
            t->lineno = $2.line;
            t->attr.name = "LBOX";

            insertChild(t, $1);
            insertChild(t, $3);
            $$ = t;
        }
    | mutable DOT IDVAL
        {
            TreeNode *t = newExpNode(OP);
            t->attr.op = period;
            t->attr.name = "DOT";
            t->lineno = $3.line;
            TreeNode *t2 = newExpNode(ID);
            t2->attr.name = $3.str;
            t2->lineno = $3.line;

            insertChild(t, $1);
            insertChild(t, t2);

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
            t->attr.name = "NUM";
            t->attr.value = $1.val;
            t->lineno = $1.line;
            t->expType = NUMB;
            $$ = t; 
        }
    | CHAR        
        {
            TreeNode* t = newExpNode(CONST);
            t->attr.name = "CHAR";
            t->attr.value = $1.val;
            t->lineno = $1.line;
            t->expType = SINGLE;
            $$ = t;
        }
    | BOOLT        
        {
            TreeNode* t = newExpNode(CONST);
            t->attr.name = "BOOLT";
            t->attr.value = $1.val;
            t->lineno = $1.line;
            t->expType = TF;
            $$ = t;
        } 
    | BOOLF        
        {
            TreeNode* t = newExpNode(CONST);
            t->attr.name = "BOOLF";
            t->attr.value = $1.val;
            t->lineno = $1.line;
            t->expType = TF;
            $$ = t;
        }
    ;

%%

int main(int argc, char** argv) {
    int c; 
    while((c = getopt(argc, argv, "d:")) != -1) {
        switch(c) {
            case 'd':
                yydebug = 1;
                break;
            default:
                yydebug = 0;
                break;
        }
    }
    
    FILE *file;
    FILE *outf;
    if(yydebug == 1) {
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

    printTree(stdout, syntaxTree);
    printTree(outf, syntaxTree);

}

