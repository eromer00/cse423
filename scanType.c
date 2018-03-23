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
    t->str = strdup(str);
    t->ltr = ltr;
    t->val = 0;
    t->tokenType = chartoken;

	//Return token
	return t;
}


Token* newIDtoken(int line, char* str) {
    Token* t = malloc(sizeof(Token));

    if(t == NULL)
        yyerror("Failure to allocate ID token\n");

    t->line = line;
    t->str = strdup(str);
    t->val = 0;
	t->tokenType = idtoken;

    return t;
}


/*
* Function to allocate character constant token
*
* line - Token line number
* str - User supplied string record was found in
*/
Token* newRECtoken(int line, char* str) {

	//Allocate memory for token
	Token* t = malloc(sizeof(Token));

	//Check for allocation success
	if(t == NULL)
		yyerror("Failure to allocate REC token\n");

	//Set line number to code line count
	t->line = line;

	//Duplicate user-supplied string
	t->str = strdup(str);

    t->val = 0;

	//Set token type to record token
	t->tokenType = rectoken;

	//Return token
	return t;
}

Token* newKEYtoken(int line, char* str, int keyvalue) {

    Token* t = malloc(sizeof(Token));

    if(t == NULL)
        yyerror("Failure to allocate keyword token\n");

    t->line = line;
    t->str = strdup(str);
    t->val = 0;

	//Set token type to keyword token
	t->tokenType = keytoken;

	//Return token
	return t;

}


Token* newNUMtoken(int line, char* str, int val) {
    Token* t = malloc(sizeof(Token));

    if(t == NULL)
        yyerror("Failure to allocate NUMCONST token\n");


    t->line = line;
    t->str = strdup(str);
    t->val = val;
    t->tokenType = numtoken;


    return t;
}


Token* newBOOLtoken(int line, char* str, int val) {

	    Token* t = malloc(sizeof(Token));

    if(t == NULL)
        yyerror("Failure to allocate BOOLCONST token\n");


    t->line = line;
    t->str = strdup(str);
    t->val = val;
    t->tokenType = booltoken;
    return t;

}

/*
* Create rectype linked list
* Returns new linked list for rectypes
*/
RType* newRType(void) {

	//Allocate memory for rectype list
	RType* r = malloc(sizeof(RType));

	//Check for allocation success
	if(r == NULL)
		yyerror("Failure to allocate RType list\n");

	//Set next pointer to NULL
	r->next = NULL;

	//Return list
	return r;
}

/*
* Add rectype to list
*
* r - Rectype list
* s - New rectype
*/
void addRType(RType* r, char* s) {

	//Point to list head
	RType* i = r;

	//Look for end of the list
	while(i->next != NULL)
		i = i->next;

	//Set last list member to new rectype
	i->rtype = strdup(s);

	//Add empty member to end of list
	i->next = newRType();
}

void yyerror(const char* s) {

	//An error has occurred
	printf("ERROR(%d): Invalid or misplaced input character: \"%s\"\n", line_num, s);

}

