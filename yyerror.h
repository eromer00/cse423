/**
 *
 * @date Spring 2018
 * @author Omar Soliman
 * @title YYerror Definitions
 *    _____
 *   /\   /\
 *  /  \ /  \
 * |    xmst |
 *  \  / \  /
 *   \/___\/
 *
 **/

#ifndef _YYERROR_H_
#define _YYERROR_H_

extern int line_num;
extern int numErrors;
extern char *yytext;

/**
 * Map structure
 */
typedef struct {
	char* key;
	char* value;
} map;

static map niceTokenNameMap[48];

/**
 * Error message printing
 *
 * breakchar - seperator between error message substrings
 * strs - Array of pointers to substrings
 * s - Error message string
 */
int split(char *s, char *strs[], char breakchar);

/**
 * Initialize mapping
 */
void initErrorProcessing();

/**
 * Override Bison yyerror
 *
 * msg - Error message string
 */  
void yyerror(const char *msg);

#endif
