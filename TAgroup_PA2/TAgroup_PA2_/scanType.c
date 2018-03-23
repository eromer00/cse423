/**
 *
 * @date Spring 2018
 * @author Omar Soliman
 * @title Scanner functions
 *    _____
 *   /\   /\
 *  /  \ /  \
 * |    xmst |
 *  \  / \  /
 *   \/___\/
 *
 **/

//System library imports
#include<stdlib.h>
#include<string.h>

//Token definition import
#include "scanType.h"

//Reference parser error function
void yyerror(const char* s);

/*
* Function to allocate character constant token
*
* line - Token line number
* ltr - Character value
* str - User supplied string character was found in
*/
Token* newCHARtoken(int line, char ltr, char* str) {

	//Allocate memory for token
	Token* t = malloc(sizeof(Token));

	//Check for allocation success
	if(t == NULL)
		yyerror("Failure to allocate CHAR token\n");

	//Set line number to code line count
	t->lineNumber = line;

	//Set letter value to encountered char
	t->letter = ltr;

	//Duplicate user-supplied string
	t->string = strdup(str);

	//Set token type to character token
	t->tokenType = charTkn;

	//Return token
	return t;
}

/*
* Function to allocate ID token
*
* line - Token line number
* str - User supplied string ID was found in
*/
Token* newIDtoken(int line, char* str) {

	//Allocate memory for token
	Token* t = malloc(sizeof(Token));

	//Check for allocation success
	if(t == NULL)
		yyerror("Failure to allocate ID token\n");

	//Set line number to code line count
	t->lineNumber = line;

	//Duplicate user-supplied string
	t->string = strdup(str);

	//Set token type to ID token
	t->tokenType = idTkn;

	//Return token
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
	t->lineNumber = line;

	//Duplicate user-supplied string
	t->string = strdup(str);

	//Set token type to record token
	t->tokenType = recTkn;

	//Return token
	return t;
}

/*
* Function to allocate keyword token
*
* line - Token line number
* str - User supplied string keyword was found in
*/
Token* newKEYtoken(int line, char* str) {

	//Allocate memory for token
	Token* t = malloc(sizeof(Token));

	//Check for allocation success
	if(t == NULL)
		yyerror("Failure to allocate KEY token\n");

	//Set line number to code line count
	t->lineNumber = line;

	//Duplicate user-supplied string
	t->string = strdup(str);

	//Set token type to keyword token
	t->tokenType = keyTkn;

	//Return token
	return t;
}

/*
* Function to allocate numerical constant token
*
* line - Token line number
* str - User supplied string number was found in
* val - Numerical value
*/
Token* newNUMtoken(int line, char* str, int val) {

	//Allocate memory for token
	Token* t = malloc(sizeof(Token));

	//Check for allocation success
	if(t == NULL)
		yyerror("Failure to allocate NUM token\n");

	//Set line number to code line count
	t->lineNumber = line;

	//Duplicate user-supplied string
	t->string = strdup(str);

	//Store numerical value represented by string
	t->value = val;

	//Set token type to number token
	t->tokenType = numTkn;

	//Return token
	return t;
}

/*
* Function to allocate boolean constant token
*
* line - Token line number
* str - User supplied string boolean was found in
* val - Numerical value
*/
Token* newBOOLtoken(int line, char* str, int val) {

	//Allocate memory for token
	Token* t = malloc(sizeof(Token));

	//Check for allocation success
	if(t == NULL)
		yyerror("Failure to allocate BOOL token\n");

	//Set line number to code line count
	t->lineNumber = line;

	//Duplicate user-supplied string
	t->string = strdup(str);

	//Store boolean value represented by val
	t->value = (val) ? 1 : 0;

	//Set token type to boolean token
	t->tokenType = boolTkn;

	//Return token
	return t;
}

/*
* Create rectype linked list
*
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

