#ifndef _SCANTYPE_H_
#define _SCANTYPE_H_

/**
 *
 * @date Spring 2018
 * @author Erik Romero, Franz Chavez, Carlos Rubio
 * @title Scanner Definitions
 *
 **/

typedef enum {idtoken, numtoken, chartoken, rectoken, booltoken, keytoken} TokenClass;

/*
* Structure to hold Token data
*/

typedef struct {
    TokenClass tokenType;
    int line;
    char* str;
    char ltr;
    int val;
} Token;

/*
* Linked list of RECTYPEs
* Allows us to maintain list of custom types
*/
typedef struct RType {

	//Record type name
	char* rtype;

	//Pointer to another record type
	struct RType* next;

} RType;

/*
* Function to allocate character constant token
*
* line - Token line number
* ltr - Character value
* str - User supplied string character was found in
*/
Token* newCHARtoken(int line, char ltr, char* str);

/*
* Function to allocate ID token
*
* line - Token line number
* str - User supplied string ID was found in
*/
Token* newIDtoken(int line, char* str);

/*
* Function to allocate keyword token
*
* line - Token line number
* str - User supplied string keyword was found in
* cls - Class of token
*/
Token* newKEYtoken(int line, char* str, int keyvalue);

/*
* Function to allocate numerical constant token
*
* line - Token line number
* str - User supplied string number was found in
* val - Numerical value
*/
Token* newNUMtoken(int line, char* str, int val);

/*
* Function to allocate boolean constant token
*
* line - Token line number
* str - User supplied string boolean was found in
* val - Numerical value
*/
Token* newBOOLtoken(int line, char* str, int val);


/*
* Function to allocate character constant token
*
* line - Token line number
* str - User supplied string record was found in
*/
Token* newRECtoken(int line, char* str);

/*
* Create rectype linked list
*
* Returns new linked list for rectypes
*/
RType *newRType(void);

/*
* Add rectype to list
*
* r - Rectype list
* s - New rectype
*/
void addRType(RType *r, char *s);

/*
 * Error message
 */
void yyerror(const char* s);

#endif

