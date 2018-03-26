/**
 *
 * @date Spring 2018
 * @author Omar Soliman
 * @title YYerror Functions
 *    _____
 *   /\   /\
 *  /  \ /  \
 * |    xmst |
 *  \  / \  /
 *   \/___\/
 *
 **/

#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include <search.h>
#include "yyerror.h"

/**
 * Error message printing
 *
 * breakchar - seperator between error message substrings
 * strs - Array of pointers to substrings
 * s - Error message string
 */
int split(char* s, char* strs[], char breakchar)
{
	int num;
	char* p;

	//Save entire error message in first element
	strs[0] = s;
	//Indicate at least 1 string exists
	num = 1;

	//For all characters in the given error message
	for(p = s; *p; p++)
	{
		//If the current character is a seperator
		if(*p==breakchar)
		{
			//Save the position of the next character as start of next substring
			strs[num++] = p+1;
			//Replace seperator with null char
			*p = '\0';
		}
	}

	//Terminate string array with NULL marker
	strs[num] = NULL;

	//Return number of actual strings found
	return(num);
}

/**
 * Remove last char in a string
 *
 * s - Message string
 */
void trim(char *s)
{
	s[strlen(s)-1] = '\0';
	return;
}

/**
 * Initialize mapping
 */
void initErrorProcessing()
{
	niceTokenNameMap[0].key = strdup("AND");
	niceTokenNameMap[0].value = strdup("and");
	niceTokenNameMap[1].key = strdup("OR");
	niceTokenNameMap[1].value = strdup("or");
	niceTokenNameMap[2].key = strdup("NOT");
	niceTokenNameMap[2].value = strdup("not");
	niceTokenNameMap[3].key = strdup("NOTEQ");
	niceTokenNameMap[3].value = strdup("'!='");
	niceTokenNameMap[4].key = strdup("MULASS");
	niceTokenNameMap[4].value = strdup("'*='");
	niceTokenNameMap[5].key = strdup("INC");
	niceTokenNameMap[5].value = strdup("'++'");
	niceTokenNameMap[6].key = strdup("ADDASS");
	niceTokenNameMap[6].value = strdup("'+='");
	niceTokenNameMap[7].key = strdup("DEC");
	niceTokenNameMap[7].value = strdup("'--'");
	niceTokenNameMap[8].key = strdup("SUBASS");
	niceTokenNameMap[8].value = strdup("'-='");
	niceTokenNameMap[9].key = strdup("DIVASS");
	niceTokenNameMap[9].value = strdup("'/='");
	niceTokenNameMap[10].key = strdup("LESSEQ");
	niceTokenNameMap[10].value = strdup("'<='");
	niceTokenNameMap[11].key = strdup("EQ");
	niceTokenNameMap[11].value = strdup("'=='");
	niceTokenNameMap[12].key = strdup("GRTEQ");
	niceTokenNameMap[12].value = strdup("'>='");
	niceTokenNameMap[13].key = strdup("BOOL");
	niceTokenNameMap[13].value = strdup("bool");
	niceTokenNameMap[14].key = strdup("BREAK");
	niceTokenNameMap[14].value = strdup("break");
	niceTokenNameMap[15].key = strdup("CHAR");
	niceTokenNameMap[15].value = strdup("char");
	niceTokenNameMap[16].key = strdup("ELSE");
	niceTokenNameMap[16].value = strdup("else");
	niceTokenNameMap[17].key = strdup("RECORD");
	niceTokenNameMap[17].value = strdup("record");
	niceTokenNameMap[18].key = strdup("IF");
	niceTokenNameMap[18].value = strdup("if");
	niceTokenNameMap[19].key = strdup("ASTERISK");
	niceTokenNameMap[19].value = strdup("'*'");
	niceTokenNameMap[20].key = strdup("INT");
	niceTokenNameMap[20].value = strdup("int");
	niceTokenNameMap[21].key = strdup("RECTYPE");
	niceTokenNameMap[21].value = strdup("rectype");
	niceTokenNameMap[22].key = strdup("RETURN");
	niceTokenNameMap[22].value = strdup("return");
	niceTokenNameMap[23].key = strdup("STATIC");
	niceTokenNameMap[23].value = strdup("static");
	niceTokenNameMap[24].key = strdup("WHILE");
	niceTokenNameMap[24].value = strdup("while");
	niceTokenNameMap[25].key = strdup("BOOLCONST");
	niceTokenNameMap[25].value = strdup("Boolean constant");
	niceTokenNameMap[26].key = strdup("NUMCONST");
	niceTokenNameMap[26].value = strdup("numeric constant");
	niceTokenNameMap[27].key = strdup("ID");
	niceTokenNameMap[27].value = strdup("identifier");
	niceTokenNameMap[28].key = strdup("CHARCONST");
	niceTokenNameMap[28].value = strdup("character constant");
	niceTokenNameMap[29].key = strdup("RANDOM");
	niceTokenNameMap[29].value = strdup("'?'");
	niceTokenNameMap[30].key = strdup("$end");
	niceTokenNameMap[30].value = strdup("end of input");
	niceTokenNameMap[31].key = strdup("DASH");
	niceTokenNameMap[31].value = strdup("'-'");
	niceTokenNameMap[32].key = strdup("FSLASH");
	niceTokenNameMap[32].value = strdup("'/'");
	niceTokenNameMap[33].key = strdup("LPAREN");
	niceTokenNameMap[33].value = strdup("'('");
	niceTokenNameMap[34].key = strdup("RPAREN");
	niceTokenNameMap[34].value = strdup("')'");
	niceTokenNameMap[35].key = strdup("LSQB");
	niceTokenNameMap[35].value = strdup("'['");
	niceTokenNameMap[36].key = strdup("RSQB");
	niceTokenNameMap[36].value = strdup("']'");
	niceTokenNameMap[37].key = strdup("LTHAN");
	niceTokenNameMap[37].value = strdup("'<'");
	niceTokenNameMap[38].key = strdup("GTHAN");
	niceTokenNameMap[38].value = strdup("'>'");
	niceTokenNameMap[39].key = strdup("LCB");
	niceTokenNameMap[39].value = strdup("'{'");
	niceTokenNameMap[40].key = strdup("RCB");
	niceTokenNameMap[40].value = strdup("'}'");
	niceTokenNameMap[41].key = strdup("COLON");
	niceTokenNameMap[41].value = strdup("':'");
	niceTokenNameMap[42].key = strdup("SCOLON");
	niceTokenNameMap[42].value = strdup("';'");
	niceTokenNameMap[43].key = strdup("MOD");
	niceTokenNameMap[43].value = strdup("'%'");
	niceTokenNameMap[44].key = strdup("PERIOD");
	niceTokenNameMap[44].value = strdup("'.'");
	niceTokenNameMap[45].key = strdup("PLUS");
	niceTokenNameMap[45].value = strdup("'+'");
	niceTokenNameMap[46].key = strdup("COMMA");
	niceTokenNameMap[46].value = strdup("','");
	niceTokenNameMap[47].key = strdup("ASSIGN");
	niceTokenNameMap[47].value = strdup("'='");

	return;
}


/**
 * Converts token strings to pretty strings
 *
 * tokenName - token string
 */
char* niceTokenStr(char* tokenName)
{
	int i;

	if(tokenName[0] == '\'')
		return(tokenName);

	for(i=0; i<48; i++)
	{
		if( !strcmp(tokenName, niceTokenNameMap[i].key) )
			return(niceTokenNameMap[i].value);
	}

	printf("ERROR(SYSTEM): niceTokenStr failed to find string '%s'\n", tokenName);

	fflush(stdout);
	exit(1);
}

/**
 * Try to see if the current token needs elaboration
 *
 * s - Error message string
 */
int elaborate(char *s)
{
	return(strstr(s, "constant") || strstr(s, "identifier"));
}

/**
 * Tiny sort routine for small numbers of string elements
 *
 * E.g.
 * str, i, 2      - sort even elements
 * str+1, i-1, 2  - sort odd elements
 * str, i, 1      - sort all elements
 *
 * base - string array to sort
 * num - total length of the array
 * step - sorting chunk size
 * up - sorting direction
 */
void tinySort(char* base[], int num, int step, int up)
{
	int i;
	int j;
	char* tmp;

	for(i=step; i<num; i+=step)
	{
		for (j=0; j<i; j+=step)
		{
			if ( up ^ (strcmp(base[i], base[j]) > 0) )
			{
				tmp = base[i];
				base[i] = base[j];
				base[j] = tmp;
			}
		}
	}
}

/**
 * Override Bison yyerror
 *
 * msg - Error message string
 */  
void yyerror(const char *msg)
{
	char* space;
	char* strs[100];
	int numstrs;
	int i;

	//Save a copy of msg string
	space = strdup(msg);

	//Split out components
	numstrs = split(space, strs, ' ');

	if (numstrs > 4)
	{
		trim(strs[3]);
	}

	//Prettify the error token
	for(i=3; i<numstrs; i+=2)
	{
		strs[i] = niceTokenStr(strs[i]);
	}

	//Print components
	printf("ERROR(%d): Syntax error, unexpected %s", line_num, strs[3]);

	//Check if we need to print more info
	if(elaborate(strs[3]))
	{
		if(yytext[0]=='\'' || yytext[0]=='"')
		{
			printf(" %s", yytext); 
		}
		else
			printf(" \'%s\'", yytext);
	}
	if(numstrs>4)
		printf(",");

	//Sort error list
	tinySort(strs+5, numstrs-5, 2, 1);

	//Print errors
	for(i=4; i<numstrs; i++)
	{
		printf(" %s", strs[i]);
	}

	//Clean-up
	printf(".\n");
	fflush(stdout);
	numErrors++;
	free(space);
}
