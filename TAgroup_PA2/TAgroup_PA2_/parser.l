%{

/**
 *
 * @date Spring 2018
 * @author Omar Soliman
 * @title SCANNER LEXING FILE
 *    _____
 *   /\   /\
 *  /  \ /  \
 * |    xmst |
 *  \  / \  /
 *   \/___\/
 *
 **/

//System libraries
#include<stdio.h>
#include<string.h>

//Token definitions
#include "scanType.h"

//Bison generated file - MUST BE LAST INCLUSION
#include "parser.tab.h"

//Count the line number
int line_num = 1;

//Hold custom RECTYPEs
static RType* rType;

//Reference parser error function
void yyerror(const char* s);

%}

%x recname

%%

\/\/.*			;
[ \t]			;
\'\\n\'			{
				yylval.token = *newCHARtoken(line_num, '\n', "'\\n'");
				return CHARCONST;
			}
\n			{
				++line_num;
			}
\'\\0\'			{
				yylval.token = *newCHARtoken(line_num, '\0', "'\\0'");
				return CHARCONST;
			}
\'[^\\\n]{1,1}\'	{
				yylval.token = *newCHARtoken(line_num, yytext[1], yytext);
				return CHARCONST;
			}
\'[\\](.){1,1}\'	{
				yylval.token = *newCHARtoken(line_num, yytext[2], yytext);
				return CHARCONST;
			}
">="			{
				yylval.token = *newKEYtoken(line_num, yytext);
				return GRTEQ;
			}
"<="			{
				yylval.token = *newKEYtoken(line_num, yytext);
				return LESSEQ;
			}
"/="			{
				yylval.token = *newKEYtoken(line_num, yytext);
				return DIVASS;
			}
"-="			{
				yylval.token = *newKEYtoken(line_num, yytext);
				return SUBASS;
			}
"--"			{
				yylval.token = *newKEYtoken(line_num, yytext);
				return DEC;
			}
"+="			{
				yylval.token = *newKEYtoken(line_num, yytext);
				return ADDASS;
			}
"++"			{
				yylval.token = *newKEYtoken(line_num, yytext);
				return INC;
			}
"*="			{
				yylval.token = *newKEYtoken(line_num, yytext);
				return MULASS;
			}
"!="			{
				yylval.token = *newKEYtoken(line_num, yytext);
				return NOTEQ;
			}
"=="			{
				yylval.token = *newKEYtoken(line_num, yytext);
				return EQ;
			}
"*"			{
				yylval.token = *newKEYtoken(line_num, yytext);
				return ASTERISK;
			}
"?"			{
				yylval.token = *newKEYtoken(line_num, yytext);
				return RANDOM;
			}
"-"			{
				yylval.token = *newKEYtoken(line_num, yytext);
				return DASH;
			}
"/"			{
				yylval.token = *newKEYtoken(line_num, yytext);
				return FSLASH;
			}
"("			{
				yylval.token = *newKEYtoken(line_num, yytext);
				return LPAREN;
			}
")"			{
				yylval.token = *newKEYtoken(line_num, yytext);
				return RPAREN;
			}
"["			{
				yylval.token = *newKEYtoken(line_num, yytext);
				return LSQB;
			}
"]"			{
				yylval.token = *newKEYtoken(line_num, yytext);
				return RSQB;
			}
"{"			{
				yylval.token = *newKEYtoken(line_num, yytext);
				return LCB;
			}
"}"			{
				yylval.token = *newKEYtoken(line_num, yytext);
				return RCB;
			}
"+"			{
				yylval.token = *newKEYtoken(line_num, yytext);
				return PLUS;
			}
","			{
				yylval.token = *newKEYtoken(line_num, yytext);
				return COMMA;
			}
":"			{
				yylval.token = *newKEYtoken(line_num, yytext);
				return COLON;
			}
";"			{
				yylval.token = *newKEYtoken(line_num, yytext);
				return SCOLON;
			}
"<"			{
				yylval.token = *newKEYtoken(line_num, yytext);
				return LTHAN;
			}
"="			{
				yylval.token = *newKEYtoken(line_num, yytext);
				return ASSIGN;
			}
">"			{
				yylval.token = *newKEYtoken(line_num, yytext);
				return GTHAN;
			}
"%"			{
				yylval.token = *newKEYtoken(line_num, yytext);
				return MOD;
			}
"."			{
				yylval.token = *newKEYtoken(line_num, yytext);
				return PERIOD;
			}
static			{
				yylval.token = *newKEYtoken(line_num, yytext);
				return STATIC;
			}
int			{
				yylval.token = *newKEYtoken(line_num, yytext);
				return INT;
			}
bool			{
				yylval.token = *newKEYtoken(line_num, yytext);
				return BOOL;
			}
char			{
				yylval.token = *newKEYtoken(line_num, yytext);
				return CHAR;
			}
if			{
				yylval.token = *newKEYtoken(line_num, yytext);
				return IF;
			}
else			{
				yylval.token = *newKEYtoken(line_num, yytext);
				return ELSE;
			}
while			{
				yylval.token = *newKEYtoken(line_num, yytext);
				return WHILE;
			}
return			{
				yylval.token = *newKEYtoken(line_num, yytext);
				return RETURN;
			}
break			{
				yylval.token = *newKEYtoken(line_num, yytext);
				return BREAK;
			}
or			{
				yylval.token = *newKEYtoken(line_num, yytext);
				return OR;
			}
and			{
				yylval.token = *newKEYtoken(line_num, yytext);
				return AND;
			}
not			{
				yylval.token = *newKEYtoken(line_num, yytext);
				return NOT;
			}
true			{
				yylval.token = *newBOOLtoken(line_num, yytext, 1);
				return BOOLCONST;
			}
false			{
				yylval.token = *newBOOLtoken(line_num, yytext, 0);
				return BOOLCONST;
			}
record			{
				yylval.token = *newKEYtoken(line_num, yytext);
				//Switch to looking for a RECTYPE
				BEGIN(recname);
				return RECORD;
			}


<recname>\/\/.*			;
<recname>[ \t]			;
<recname>\n			{
					++line_num;
				}
<recname>[a-zA-Z][a-zA-Z0-9]*	{
					//RECTYPE was found
					yylval.token = *newRECtoken(line_num, yytext);

					//Start the RECTYPE list if it doesn't exist
					if(!rType)
						rType = newRType();

					//Add the RECTYPE to the RECTYPE list
					addRType(rType, yytext);

					//Switch back to normal lexing
					BEGIN(INITIAL);
					return RECTYPE;
				}
<recname>.			{
					//RECTYPE was not found, switch back to normal lexing
					BEGIN(INITIAL);
					yyerror(yytext);
				}


[0-9]+			{
				yylval.token = *newNUMtoken(line_num, yytext, strtoll(yytext,NULL,10));
				return NUMCONST;
			}
[a-zA-Z][a-zA-Z0-9]*	{
				//Check if there is a RECTYPE list before searching it
				if(rType)
				{
					RType* i = rType;

					//Empty rtype nodes will have a NULL sibling
					while(i->next != NULL)
					{
						//Check if ID is already a RECTYPE in the RECTYPE list
						if(!(strcmp(i->rtype,yytext)))
						{
							//ID was found in the RECTYPE list
							yylval.token = *newRECtoken(line_num, yytext);
							return RECTYPE;
						}
						else
						{
							i = i->next;
						}
					}
				}

				//ID was not a RECTYPE
				yylval.token = *newIDtoken(line_num, yytext);
				return ID;
			}
.			{
				fprintf(stdout,"ERROR(%d): Invalid or misplaced input character: \"%s\"\n",line_num,yytext);
			}

%%

