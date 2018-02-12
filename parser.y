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
extern OpKind ops;

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
            t->attr.op = LSB;
            t->lineno = $2.line;
            t->attr.name = strdup("LBOX");

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
            t->attr.value = $1.val;
            t->lineno = $1.line;
            t->expType = NUMB;
            t->attr.name = strdup("NUM");
            $$ = t; 
        }
    | CHAR        
        {
            TreeNode* t = newExpNode(CONST);
            t->attr.value = $1.val;
            t->lineno = $1.line;
            t->expType = SINGLE;
            t->attr.name = strdup("CHAR");
            $$ = t;
        }
    | BOOLT        
        {
            TreeNode* t = newExpNode(CONST);
            t->attr.value = $1.val;
            t->lineno = $1.line;
            t->expType = TF;
            t->attr.name = strdup("BOOLT");
            $$ = t;
        } 
    | BOOLF        
        {
            TreeNode* t = newExpNode(CONST);
            t->attr.value = $1.val;
            t->lineno = $1.line;
            t->expType = TF;
            t->attr.name = strdup("BOOLF");
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
    //printTree(outf, syntaxTree);

}

