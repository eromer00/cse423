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
%token <token> BOOL KEY CHAR IDVAL KEYCHAR NUM

//Types for nonterminals
%type <sval> program words word

//Grammar starting point
%start program

%%
//VERY SIMPLE GRAMMAR
//Basically, just feed me some tokens

program:
	words
	;

words:
	words word |
    word
	;

word:
	CHAR { printf("Line %d Token: CHARCONST Value: '%c'  Input: %s\n", ($1).line, ($1).ltr, ($1).str); }
    | BOOL { printf("Line %d Token: BOOLCONST Value: %d  Input: %s\n", ($1).line, ($1).val, ($1).str); }
    
    | KEY { printf("Line %d Token: %s\n", ($1).line, ($1).str); }
    | IDVAL { printf("Line %d Token: ID Value: %s\n", ($1).line, ($1).str); }
    | NUM { printf("Line %d Token: NUMCONST Value: %d  Input: %s\n", ($1).line, ($1).val, ($1).str); } 
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

