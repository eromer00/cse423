#include "scanType.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/**
 *
 * @date Spring 2018
 * @author Erik Romero, Franz Chavez, Carlos Rubio
 * @title Scanner functions
 *
 **/


//Reference parser error function
extern int line_num;
void yyerror(const char* s);


Token* newCHARtoken(int line, char ltr, char* str) {

	//Allocate memory for token
	Token* t = malloc(sizeof(Token));

	//Check for allocation success
	if(t == NULL)
		yyerror("Failure to allocate CHAR token\n");

    t->line = line;
    t->str = str;
    t->ltr = ltr;
    t->val = 0;

	//Return token
	return t;
}


Token* newIDtoken(int line, char* str) {
    Token* t = malloc(sizeof(Token));

    if(t == NULL)
        yyerror("Failure to allocate ID token\n");

    t->line = line;
    t->str = str;
    t->val = 0;

    return t;
}


Token* newKEYtoken(int line, char* str, int keyvalue) {
    Token* t = malloc(sizeof(Token));

    if(t == NULL)
        yyerror("Failure to allocate keyword token\n");

    t->line = line;
    t->str = str;
    t->val = 0;

    if(keyvalue == 0) {
        return t;
    } else {
        /*
        switch(keyvalue) {
            case 1: t->str = "AND"; break;
            case 2: t->str = "OR"; break;
            case 3: t->str = "NOT"; break;
            case 4: t->str = "NOTEQ"; break;
            case 5: t->str = "MULASS"; break;
            case 6: t->str = "INC"; break;
            case 7: t->str = "ADDASS"; break;
            case 8: t->str = "DEC"; break;
            case 9: t->str = "SUBASS"; break;
            case 10: t->str = "DIVASS"; break;
            case 11: t->str = "LESSEQ"; break;
            case 12: t->str = "EQ"; break;
            case 13: t->str = "GRTEQ"; break;
            case 14: t->str = "BOOL"; break;
            case 15: t->str = "BREAK"; break;
            case 16: t->str = "CHAR"; break;
            case 17: t->str = "ELSE"; break;
            case 18: t->str = "IF"; break;
            case 19: t->str = "IN"; break;
            case 20: t->str = "INT"; break;
            case 21: t->str = "RECORD"; break;
            case 22: t->str = "WHILE"; break;
            case 23: t->str = "RETURN"; break;
            case 24: t->str = "STATIC"; break;
            default: break;
            
        } */

        return t;
    }
}


Token* newNUMtoken(int line, char* str, int val) {
    Token* t = malloc(sizeof(Token));

    if(t == NULL)
        yyerror("Failure to allocate NUMCONST token\n");


    t->line = line;
    t->str = str;
    t->val = val;


    return t;
}


Token* newBOOLtoken(int line, char* str, int val) {

	    Token* t = malloc(sizeof(Token));

    if(t == NULL)
        yyerror("Failure to allocate BOOLCONST token\n");


    t->line = line;
    t->str = str;
    t->val = val;

    return t;

}


void yyerror(const char* s) {

	//An error has occurred
	printf("ERROR(%d): Invalid or misplaced input character: \"%s\"\n", line_num, s);

}

