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
extern int line_num;
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
%token <token> BOOL KEY CHAR IDVAL KEYCHAR NUM BOOLT BOOLF
%token <token> SEMICOLON COLON RECORD LBRACK RBRACK LPAREN RPAREN
%token <token> ANDCND BREAKCND COMMA DIEQ DIV DOT ELSECND EQ EQEQ
%token <token> GT GTEQ IFCND LBOX RBOX LS LSEQ MI MIEQ MIMI MUEQ
%token <token> MUL NOTCND NTEQ ORCND PERC PL PLEQ PLPL QM RETURNCND
%token <token> INTCND CHARCND BOOLCND INCND
%token <token> STATIC WHILECND

//Types for nonterminals

%type <treeNode> program declarationList declaration 
%type <treeNode> recDeclaration
%type <treeNode> varDeclaration scopedVarDeclaration varDeclList varDeclInitialize varDeclID scopedTypeSpecifier typeSpecifier returnTypeSpecifier 
%type <treeNode> funDeclaration params paramList paramTypeList paramIdList paramId 
%type <treeNode> statement matchstmt unmatchstmt compoundStmt localDeclarations statementList expressionStmt otherstatement iterationStmt returnStmt breakStmt 
%type <treeNode> expression simpleExpression andExpression unaryRelExpression relExpression relop sumExpression sumop term mulop unaryExpression unaryop factor mutable immutable call args argList constant


%%


program:
    declarationList {syntaxTree = $1; printf("a1 (%d) \n", line_num); }
    ;

declarationList:
    declarationList declaration { if($1!=NULL){insertSibling($1,$2);$$=$1;}else{$$=$2;} printf("a2 (%d) \n", line_num);  }
    | declaration {$$=$1; printf("b2 (%d) \n", line_num);  }
    | %empty { printf("c2 (%d) \n", line_num);  }
    ;

declaration:
    varDeclaration {$$=$1;printf("a3 (%d) \n", line_num);  }
    | funDeclaration {$$=$1; printf("b3 (%d) \n", line_num);  }
    | recDeclaration {$$=$1; printf("c3 (%d) \n", line_num);  }
    ;


recDeclaration:
    RECORD IDVAL LBRACK localDeclarations RBRACK { printf("a4 (%d) \n", line_num);  }
    ; 

varDeclaration:
    typeSpecifier varDeclList { printf("a5 (%d) \n", line_num);  }
    ;

scopedVarDeclaration:
    scopedTypeSpecifier varDeclList SEMICOLON { printf("a6 (%d) \n", line_num);  }
    ;

varDeclList:
    varDeclList COMMA varDeclInitialize { printf("a7 (%d) \n", line_num);  }
    | varDeclInitialize { printf("b7 (%d) \n", line_num);  }
    ;

varDeclInitialize:
    varDeclID COLON simpleExpression { printf("a8 (%d) \n", line_num);  }
    | varDeclID { printf("b8 (%d) \n", line_num);  }
    ;

varDeclID:
    IDVAL LBOX NUM RBOX { printf("a9 (%d) \n", line_num);  }
    | IDVAL { printf("b9 (%d) \n", line_num);  }
    ;

scopedTypeSpecifier:
    STATIC typeSpecifier { printf("a10 (%d) \n", line_num);  }
    | typeSpecifier { printf("b10 (%d) \n", line_num);  }
    ;

typeSpecifier:
    returnTypeSpecifier { printf("a11 (%d) \n", line_num);  }
    ;

returnTypeSpecifier:
    INTCND { printf("a12 (%d) \n", line_num); }
    | BOOLCND { printf("b12 (%d) \n", line_num);  }
    | CHARCND { printf("c12 (%d) \n", line_num);  }
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
    argList {$$=$1}
    | %empty {}
    ;

argList:
    argList COMMA expression
        {
            if($1!=NULL){
                insertSibling($1, $3);
                $$ = $1;
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

