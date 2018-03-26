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
#include "yyerror.h"
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
#define YYERROR_VERBOSE
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
    error {$$=NULL;}
    | varDeclaration {$$ = $1; }
    | funDeclaration {$$ = $1; }
    | recDeclaration {$$ = $1; }
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
            yyerrok;
        }
    //TODO| error varDeclList SEMICOLON { $$ = NULL; yyerrok;}
	| typeSpecifier error SEMICOLON { $$ = NULL; yyerrok; }
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
            yyerrok;
        }
    | error varDeclList SEMICOLON { $$ = $2; yyerrok; }
	| scopedTypeSpecifier error SEMICOLON { $$ = NULL; yyerrok; }
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
            yyerrok;
        }
    | varDeclInitialize 
        {
            $$ = $1;
        }
    | varDeclList COMMA error { $$ = $1; }
	//TODO| error { $$ = NULL; }
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
    | error COLON simpleExpression { $$ = NULL; yyerrok; }
	| varDeclId COLON error { $$ = NULL; }
    
    ;

varDeclId:
    IDVAL LBOX NUM RBOX 
        {
            TreeNode *t = newDeclNode(VAR);
            t->attr.value = $1.val;
            t->isArray = 1;
            t->lineno = $1.line;
            t->attr.name = strdup($1.str);
            t->attr.value = $3.val;
            $$ = t;
        }
    | IDVAL 
        {
            TreeNode *t = newDeclNode(VAR);
            t->attr.name = strdup($1.str);
            t->lineno = $1.line;
            $$ = t;
        }
    | IDVAL LBOX error { $$ = NULL; }
	| error RBOX { $$ = NULL; yyerrok; }
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
    | typeSpecifier error { $$ = NULL; }
	| typeSpecifier IDVAL LPAREN error { $$ = NULL; }
	| typeSpecifier IDVAL LPAREN params RPAREN error { $$ = NULL; }
	| IDVAL LPAREN error { $$ = NULL; }
	| IDVAL LPAREN params RPAREN error { $$ = NULL; }
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
            yyerrok;
        }
    | paramTypeList 
        {
            $$=$1;
        }
    | paramList SEMICOLON error { $$ = $1; }
	| error { $$ = NULL; }
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
    | typeSpecifier error { $$ = NULL; }
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
            yyerrok;
        }
    | paramId 
        {
            $$=$1;
        }
    | paramIdList COMMA error { $$ = NULL; }
	//TODO| error { $$ = NULL; }
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
    | error RBOX { $$ = NULL; yyerrok; }

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
    | IFCND LPAREN error { $$ = NULL; }
	| IFCND error RPAREN matched ELSECND matched { $$ = NULL; yyerrok; }
	//TODO| error { $$ = NULL; }
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
    | IFCND error { $$ = NULL; }
	| IFCND error RPAREN matched { $$ = NULL; yyerrok; }
	| IFCND error RPAREN unmatched { $$ = NULL; yyerrok; }
	| IFCND error RPAREN matched ELSECND unmatched { $$ = NULL; yyerrok; }
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
    | WHILECND error { $$ = NULL; }
	| WHILECND error RPAREN { $$ = NULL; yyerrok; }
	| WHILECND LPAREN error RPAREN { $$ = NULL; yyerrok; }
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
            yyerrok;
        }
    //TODO one of these causes a shift reduce error
    | LBRACK localDeclarations error RBRACK
	{
		TreeNode* t = newStmtNode(COMP);
		t->lineno = $1.line;
		t->child[0] = $2;
		t->child[1] = NULL;
		$$ = t;

		yyerrok;	
	}
    | LBRACK error statementList RBRACK
	{
		TreeNode* t = newStmtNode(COMP);
		t->lineno = $1.line;
		t->child[0] = NULL;
		t->child[1] = $3;
		$$ = t;

		yyerrok;	
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
    expression SEMICOLON { $$=$1; yyerrok;}
    | SEMICOLON{$$=NULL; yyerrok;}
    ;


returnStmt:
    RETURNCND SEMICOLON 
        {
            TreeNode *t = newStmtNode(RETURN);
            t->attr.name = $1.str;
            t->lineno = $1.line;
            $$ = t;
            yyerrok;
        }
    | RETURNCND expression SEMICOLON
        {
            TreeNode *t = newStmtNode(RETURN);
            t->attr.name = $1.str;
            t->lineno = $1.line;

            insertChild(t, $2);
            $$ = t;
            yyerrok;
        }
    ;

breakStmt:
    BREAKCND SEMICOLON
        {
            TreeNode *t = newStmtNode(BREAK);
            t->attr.name = $1.str;
            t->lineno = $1.line;

            $$ = t;
            yyerrok;
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
    //TODO causes shift/reduce errors
    | error PLPL { $$ = NULL; yyerrok; }
	| error MIMI { $$ = NULL; yyerrok; }
	| error PLEQ error { $$ = NULL; yyerrok; }
	| error MIEQ error { $$ = NULL; yyerrok; }
	| error MUEQ error { $$ = NULL; yyerrok; }
	| error DIEQ error { $$ = NULL; yyerrok; }
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
    | simpleExpression ORCND error { $$ = NULL; }
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
    | andExpression ANDCND error { $$ = NULL; }
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
    | NOTCND error {$$ = NULL;}
    
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
    | sumExpression relop error { $$ = NULL; }
	| error relop sumExpression { $$ = NULL;  yyerrok; }
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
    | sumExpression sumop error { $$ = NULL; yyerrok; }
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
    | term mulop error {$$ = NULL;}
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
    | unaryop error {$$= NULL;}
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
            yyerrok;
        }
    | call {
            $$=$1; }
    | constant{
            $$=$1; }
    //TODO
    //| LPAREN error {$$ = NULL;}
    //| error RPAREN {$$ = NULL; yyerrok;}
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
    //TODO
    | error LPAREN { $$ = NULL; yyerrok; }
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
            yyerrok;
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
            t->attr.value = $1.ltr;
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
            t->attr.name = strdup("true");
            $$ = t;
        } 
    | BOOLF        
        {
            TreeNode* t = newExpNode(CONST);
            t->attr.value = $1.val;
            t->lineno = $1.line;
            t->expType = TF;
            t->attr.name = strdup("false");
            $$ = t;
        }
    ;

%%

/* NOTE - use only one command line argument at a time, otherwise it may erase file data */
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

    /* adding IO routines after printing */
    //output
    /*TreeNode *tmp1 = newDeclNode(FUNC);
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
    */
    //printf("\n\n\n\n");
    //printTree(stdout, syntaxTree);
    fprintf(stdout, "Number of warnings: %d\n",numWarnings);
    fprintf(stdout, "Number of errors: %d\n",numErrors);
  
}


