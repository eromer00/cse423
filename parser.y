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
#include "scanType.h"
#include "printTree.h"

//Inform bison about flex things
extern int yylex();
extern int yyparse();
extern FILE* yyin;
static TreeNode* syntaxTree;
extern int line_num;
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
%type <treeNode> program declarationList declaration recDeclaration varDeclaration scopedVarDeclaration varDeclList varDeclInitialize varDeclId scopedTypeSpecifier typeSpecifier returnTypeSpecifier funDeclaration params paramList paramTypeList paramIdList paramId statement compoundStmt localDeclarations statementList selectionStmt expressionStmt iterationStmt returnStmt breakStmt expression simpleExpression andExpression unaryRelExpression relExpression relop sumExpression sumop term mulop unaryExpression unaryop factor mutable immutable call args argList constant

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
        {
            TreeNode *t = newDeclNode(REC);
            t->attr.name = strdup($2.str);

            insertChild(t,$4);
            free($1.str);
            free($2.str);
            free($3.str);
            free($5.str);
        }
    ;

varDeclaration:
    typeSpecifier varDeclList SEMICOLON
        {
        //TODO finish this typing
            TreeNode* t = $2;
            while(t != NULL){
                //t->recType = $1->attr.name;
                t = t->sibling;
            }
            free($3.str);
            $$=$2;
        }
    ;

scopedVarDeclaration:
    scopedTypeSpecifier varDeclList SEMICOLON
        {
            insertChild($1,$2);
            free($3.str);
            $$=$1;
        }
    ;

varDeclList:
    varDeclList COMMA varDeclInitialize 
        {
            insertChild($1,$3);
            free($2.str);
            $$=$1;
        }
    | varDeclInitialize {$$=$1;}
    ;

varDeclInitialize:
    varDeclId {$$=$1;}
    | varDeclId COLON simpleExpression
        {
            insertChild($1,$3);
            free($2.str);
            $$=$1;
        }
    ;

varDeclId:
    IDVAL 
        {
            TreeNode* t = newExpNode(ID);
            t->attr.name = strdup($1.str);

            free($1.str);
            $$ = t;
        }
    | IDVAL LBOX NUM RBOX
        {
            TreeNode* t = newExpNode(ID);
            t->attr.name = $1.str;
            t->isArray = 1;

            
            TreeNode* t2 = newExpNode(CONST);
            t2->attr.value = $3.val;
            t2->lineno = $3.line;
            
            insertChild(t, t2);
            free($2.str);
            free($4.str);
            $$ = t;
        }
    ;

scopedTypeSpecifier:
    STATIC typeSpecifier {$2->isStatic = 1; $$=$2;}
    | typeSpecifier {$$=$1;}
    ;

typeSpecifier:
    returnTypeSpecifier {$$=$1;}
    | RECTYPE 
        {
            $$ = newDeclNode(REC);
            $$->attr.name = $1.str;
        }
    ;

returnTypeSpecifier:
    INTCND
        {
            TreeNode* t = newDeclNode(VAR);
            t->attr.name = strdup($1.str);

            free($1.str);
        }
    | BOOLCND
        {
            TreeNode* t = newDeclNode(VAR);
            t->attr.name = strdup($1.str);

            free($1.str);
        }
    | CHARCND
        {
            TreeNode* t = newDeclNode(VAR);
            t->attr.name = strdup($1.str);

            free($1.str);
        }
    ;

funDeclaration:
    typeSpecifier IDVAL LPAREN params RPAREN statement
        {
            TreeNode* t = newDeclNode(FUNC);
            t->attr.name = strdup($2.str);
            
            t->returnType = strdup($1->attr.name);
            t->isFunc = 1;
            //some things are missing
            insertChild(t, $4);
            insertChild(t, $6);
            
            free($2.str);
            free($3.str);
            free($5.str);
            $$=t;
        }
    | IDVAL LPAREN params RPAREN statement
        {
            TreeNode* t = newDeclNode(FUNC);
            t->attr.name = strdup($1.str);

            t->returnType = strdup("void");
            t->isFunc = 1;
            //some things are missing
            insertChild(t, $3);
            insertChild(t, $5);
           
            free($1.str);
            free($2.str);
            free($4.str);
            $$=t;
        }
    ;

params:
    paramList {$$=$1;}
    | %empty {$$=NULL;}
    ;

paramList:
    paramList SEMICOLON paramTypeList
        {
            if($1 != NULL){
                insertSibling($1,$3);
                $$=$1;
            }else{
                $$=$3;
            }
            free($2.str);
        }
    | paramTypeList {$$=$1;}
    ;

paramTypeList:
    typeSpecifier paramIdList
        {
            //TODO Finish this typing
            TreeNode* t = $2;
            while(t != NULL){
                //t->recType = strdup($1->attr.name);
                t = t->sibling;
            }
            $$=$2;
        } 
    ;

paramIdList:
    paramIdList COMMA paramId
        {
            if($1 != NULL){
                insertSibling($1,$3);
                $$=$1;
            }else{
                $$=$3;
            }
            free($2.str);
        } 
    | paramId {$$=$1;}
    ;

paramId:
    IDVAL
        {
            TreeNode* t = newExpNode(ID);
            t->attr.name = strdup($1.str);

            free($1.str);
            $$ = t;
        }
    | IDVAL LBOX RBOX
        {
            TreeNode* t = newExpNode(ID);
            t->attr.name = strdup($1.str);

            t->isArray = 1;
            free($1.str);
            free($2.str);
            free($3.str);
            $$ = t;
        }
    ;

statement:
    expressionStmt {$$=$1;}
    | compoundStmt {$$=$1;}
    | selectionStmt {$$=$1;}
    | iterationStmt {$$=$1;}
    | returnStmt {$$=$1;}
    | breakStmt {$$=$1;}
    ;

compoundStmt:
    LBRACK localDeclarations statementList RBRACK
    {
        TreeNode* t = newStmtNode(COMP);
        t->attr.name = strdup("Compound");
        insertChild(t, $2);
        insertChild(t, $3);
        free($1.str);
        free($4.str);
    }
    ;

localDeclarations:
    localDeclarations scopedVarDeclaration
        {
            if($1 != NULL){
                insertSibling($1,$2);
                $$=$1;
            }else{
                $$=$2;
            }
        } 
    | %empty {$$=NULL;}
    ;

statementList:
    statementList statement
        {
            if($1 != NULL){
                insertSibling($1,$2);
                $$=$1;
            }else{
                $$=$2;
            }
        } 
    | %empty {}
    ;

expressionStmt:
    expression SEMICOLON {$$=$1;}
    | SEMICOLON {$$=NULL;yyerror("semicolon without expression!");}
    ;

selectionStmt:
    IFCND LPAREN simpleExpression RPAREN statement
        {
            TreeNode* t = newStmtNode(IF);
            t->attr.name = $1.str;

            insertChild(t,$3);
            insertChild(t,$5);
            
            free($1.str);
            free($2.str);
            free($4.str);
            $$=t;
        } 
    | IFCND LPAREN simpleExpression RPAREN statement ELSECND statement
        {
            TreeNode* t = newStmtNode(IF);
            t->attr.name = $1.str;

            insertChild(t,$3);
            insertChild(t,$5);
            insertChild(t,$7);
            
            free($1.str);
            free($2.str);
            free($4.str);
            free($6.str);
            $$=t;
        }
    ;

iterationStmt:
    WHILECND LPAREN simpleExpression RPAREN statement
        {
            TreeNode* t = newStmtNode(WHILE);
            t->attr.name = $1.str;

            insertChild(t,$3);
            insertChild(t,$5);
            free($1.str);
            free($2.str);
            free($4.str);
            $$=t;
        } 
    ;

returnStmt:
    RETURNCND SEMICOLON
        {
            TreeNode* t = newStmtNode(RETURN);
            t->attr.name = $1.str;

            free($1.str);
            $$=t;
        } 
    | RETURNCND expression SEMICOLON
        {
            TreeNode* t = newStmtNode(RETURN);
            t->attr.name = $1.str;

            insertChild(t,$2);
            free($1.str);
            $$=t;
        } 
    ;

breakStmt:
    BREAKCND SEMICOLON
        {
            TreeNode* t = newStmtNode(BREAK);
            t->attr.name = $1.str;

            free($1.str);
            $$=t;
        }
    ;

expression:
    mutable EQ expression
        {
            TreeNode* t = newExpNode(OP);
            t->attr.op = assign;

            insertChild(t,$1);
            insertChild(t,$3);
            free($2.str);
            $$=t;
        }
    | mutable PLEQ expression 
        {
            TreeNode* t = newExpNode(OP);
            t->attr.op = passign;

            insertChild(t,$1);
            insertChild(t,$3);
            free($2.str);
            $$=t;
        }
    | mutable MIEQ expression
        {
            TreeNode* t = newExpNode(OP);
            t->attr.op = sassign;

            insertChild(t,$1);
            insertChild(t,$3);
            free($2.str);
            $$=t;
        }
    | mutable MUEQ expression
        {
            TreeNode* t = newExpNode(OP);
            t->attr.op = massign;

            insertChild(t,$1);
            insertChild(t,$3);
            free($2.str);
            $$=t;
        }
    | mutable DIEQ expression
        {
            TreeNode* t = newExpNode(OP);
            t->attr.op = dassign;

            insertChild(t,$1);
            insertChild(t,$3);
            free($2.str);
            $$=t;
        }
    | mutable PLPL
        {
            TreeNode* t = newExpNode(OP);
            t->attr.op = pplus;

            insertChild(t,$1);
            free($2.str);
            $$=t;
        }
    | mutable MIMI
        {
            TreeNode* t = newExpNode(OP);
            t->attr.op = ddash;

            insertChild(t,$1);
            free($2.str);
            $$=t;
        }
    | simpleExpression {$$=$1;}
    ;

simpleExpression:
    simpleExpression ORCND andExpression 
        {
            TreeNode* t = newExpNode(OP);
            t->attr.op = bor;

            insertChild(t,$1);
            insertChild(t,$3);
            free($2.str);
            $$=t;
        }
    | andExpression {$$=$1;}
    ;

andExpression:
    andExpression ANDCND unaryRelExpression
        {
            TreeNode* t = newExpNode(OP);
            t->attr.op = band;

            insertChild(t,$1);
            insertChild(t,$3);
            free($2.str);
            $$=t;
        }
    | unaryRelExpression {$$=$1;}
    ;

unaryRelExpression:
    NOTCND unaryRelExpression 
        {
            TreeNode* t = newExpNode(OP);
            t->attr.op = bnot;

            t->expType = $2->expType;
            insertChild(t,$2);
            free($1.str);
            $$=t;
        }
    | relExpression {$$=$1;}
    ;

relExpression:
    sumExpression relop sumExpression 
        {
            insertChild($2, $1);
            insertChild($2, $3);
            $$=$2;
        }
    | sumExpression {$$=$1;}
    ;

relop:
    LSEQ
        {
            TreeNode* t = newExpNode(OP);
            t->attr.op = lteq;

            free($1.str);
            $$=t;
        }
    | LS
        {
            TreeNode* t = newExpNode(OP);
            t->attr.op = lthan;
            free($1.str);
            $$=t;
        }
    | GT
        {
            TreeNode* t = newExpNode(OP);
            t->attr.op = gthan;

            free($1.str);
            $$=t;
        }
    | GTEQ
        {
            TreeNode* t = newExpNode(OP);
            t->attr.op = gteq;

            free($1.str);
            $$=t;
        }
    | EQEQ 
        {
            TreeNode* t = newExpNode(OP);
            t->attr.op = eqeq;

            free($1.str);
            $$=t;
        }
    | NTEQ 
        {
            TreeNode* t = newExpNode(OP);
            t->attr.op = neq;

            free($1.str);
            $$=t;
        }
    ;

sumExpression:
    sumExpression sumop term
        {
            insertChild($2, $1);
            insertChild($2, $3);
            $$=$1;
        }
    | term {$$=$1;}
    ;

sumop:
    PL
        {
            TreeNode* t = newExpNode(OP);
            t->attr.op = plus;

            free($1.str);
            $$=t;
        }
    | MI
        {
            TreeNode* t = newExpNode(OP);
            t->attr.op = dash;

            free($1.str);
            $$=t;
        }
    ;

term:
    term mulop unaryExpression 
        {
            insertChild($2,$1);
            insertChild($2,$3);
            $$=$2;
        }
    | unaryExpression { $$ = $1;}
    ;

mulop:
    MUL
        {
            TreeNode* t = newExpNode(OP);
            t->attr.op = asterisk;

            free($1.str);
            $$=t;
        }
    | DIV 
        {
            TreeNode* t = newExpNode(OP);
            t->attr.op = fslash;

            free($1.str);
            $$=t;
        }
    | PERC
        {
            TreeNode* t = newExpNode(OP);
            t->attr.op = mod;

            free($1.str);
            $$=t;
        }
    ;

unaryExpression:
    unaryop unaryExpression {insertChild($1,$2); $$=$1;}
    | factor {$$=$1;}
    ;

unaryop:
    MI 
        {
            TreeNode* t = newExpNode(OP);
            t->attr.op = dash;

            free($1.str);
            $$=t;
        }
    | MUL 
        {
            TreeNode* t = newExpNode(OP);
            t->attr.op = asterisk;

            free($1.str);
            $$=t;
        }
    | QM
        {
            TreeNode* t = newExpNode(OP);
            t->attr.op = qmark;

            free($1.str);
            $$=t;
        }
    ;

factor:
    immutable {$$=$1;}
    | mutable {$$=$1;}
    ;

mutable:
    IDVAL
        {
            TreeNode* t = newExpNode(ID);
            t->attr.name = strdup($1.str);

            free($1.str);
            $$ = t;
        }
    | mutable LBOX expression RBOX 
        {
            TreeNode* t = newExpNode(OP);
            t->attr.op = lsb;
            
            insertChild(t,$1);
            insertChild(t,$3);
            free($2.str);
            free($4.str);
            $$ = t;
        }
    | mutable DOT IDVAL
        {
            TreeNode* t = newExpNode(OP);
            t->attr.op = period;

            TreeNode* t2 = newExpNode(ID);
            t2->attr.name = $3.str;
            t2->lineno = $3.line;
            insertChild(t, $1);
            insertChild(t, t2);
            
            free($3.str);
            free($2.str);
            
            $$=t;
        }
    ;

immutable:
    LPAREN expression RPAREN 
        {
            free($1.str);
            free($3.str);
            $$=$2;
        }
    | call {$$=$1;}
    | constant{$$=$1;}
    ;

call:
    IDVAL LPAREN args RPAREN
        {
            TreeNode* t = newStmtNode(CALL);
            t->attr.name = strdup($1.str);

            insertChild(t, $3);
            free($4.str);
            free($2.str);
            free($1.str);
            $$ = t;
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
                $3->isParam = 1;
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
            t->attr.value = $1.val;
            t->expType = NUMB;
            $$ = t;
        }
    | CHAR        
        {
            TreeNode* t = newExpNode(CONST);
            t->attr.value = $1.val;
            t->expType = SINGLE;
            $$ = t;
        }
    | BOOLT        
        {
            TreeNode* t = newExpNode(CONST);
            t->attr.value = $1.val;
            t->expType = TF;
            $$ = t;
        } 
    | BOOLF        
        {
            TreeNode* t = newExpNode(CONST);
            t->attr.value = $1.val;
            t->expType = TF;
            $$ = t;
        }
    ;

%%

int main(int argc, char** argv) {

    
    FILE *file = fopen(argv[1], "r");
    if(!file) {
        do{
            printf("line: %d\n",line_num);
            yyparse();
        }while(!feof(yyin));
    } else {
        yyin = file;
        do{
		    yyparse();
	    }while(!feof(yyin));
    }

}

