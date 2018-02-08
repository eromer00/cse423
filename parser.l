%{

/*
    Group: Spaghet_Code
    Members: Erik Romero, Carlos Rubio, Franz Chavez
    File: parser.l
    Description: flex program to tokenize the c- language
*/

//Import input/output functions
#include<stdio.h>
//Import standard library functions
#include<stdlib.h>
//Import string functions
#include<string.h>
//Import file functions
#include "scanType.h"

extern int yylex();

extern void yyerror(const char* s);

#include "parser.tab.h"

//Count the lines
int line_num = 1;

//NOTE: Keywords and operators numbered 0-42 in order of apperance

/*
        long m = 1, n;
        n = strtol($1, NULL, 10);
        if(n > 0xffffffff) { n = ~n; n &= 0xffffffff; m = n; m = ~m; }
        else { m = n; }
*/
%}

letter [a-zA-Z]
digit [0-9]
letdig {letter}|{digit}

%%
\/\/.*               ;
[ \t]                ;
[\n]                 { line_num++; } 
[\']\\n[\']          { yylval.token = *newCHARtoken(line_num, '\n', strdup(yytext)); return CHAR; } 
[\']\\0[\']          { yylval.token = *newCHARtoken(line_num, '\0', strdup(yytext)); return CHAR; } 
[\']([^\n\0])[\']    { yylval.token = *newCHARtoken(line_num, strdup(yytext)[1], strdup(yytext)); return CHAR; } 
[\'](\\.)[\']        { yylval.token = *newCHARtoken(line_num, strdup(yytext)[2], strdup(yytext)); return CHAR; } 
true                 { yylval.token = *newBOOLtoken(line_num, strdup(yytext), 1); return BOOLT; }
false                { yylval.token = *newBOOLtoken(line_num, strdup(yytext), 0); return BOOLF; }
and                  { yylval.token = *newKEYtoken(line_num, strdup(yytext), 1); return ANDCND; }
or                   { yylval.token = *newKEYtoken(line_num, strdup(yytext), 2); return ORCND; }
not                  { yylval.token = *newKEYtoken(line_num, strdup(yytext), 3); return NOTCND; }
!=                   { yylval.token = *newKEYtoken(line_num, strdup(yytext), 4); return NTEQ; }
[*][=]               { yylval.token = *newKEYtoken(line_num, strdup(yytext), 5); return MUEQ; }
[+][+]               { yylval.token = *newKEYtoken(line_num, strdup(yytext), 6); return PLPL; }
[+][=]               { yylval.token = *newKEYtoken(line_num, strdup(yytext), 7); return PLEQ; }
[-][-]               { yylval.token = *newKEYtoken(line_num, strdup(yytext), 8); return MIMI; }
[-][=]               { yylval.token = *newKEYtoken(line_num, strdup(yytext), 9); return MIEQ; }
[/][=]               { yylval.token = *newKEYtoken(line_num, strdup(yytext), 10); return DIEQ; }
[<][=]               { yylval.token = *newKEYtoken(line_num, strdup(yytext), 11); return LSEQ; }
[=][=]               { yylval.token = *newKEYtoken(line_num, strdup(yytext), 12); return EQEQ; }
[>][=]               { yylval.token = *newKEYtoken(line_num, strdup(yytext), 13); return GTEQ; }

[(]                  { yylval.token = *newKEYtoken(line_num, strdup(yytext), 0); return LPAREN; }
[)]                  { yylval.token = *newKEYtoken(line_num, strdup(yytext), 0); return RPAREN; }
[*]                  { yylval.token = *newKEYtoken(line_num, strdup(yytext), 0); return MUL; }
(\/)                 { yylval.token = *newKEYtoken(line_num, strdup(yytext), 0); return DIV; }
[+]                  { yylval.token = *newKEYtoken(line_num, strdup(yytext), 0); return PL; }
[-]                  { yylval.token = *newKEYtoken(line_num, strdup(yytext), 0); return MI; }
[=]                  { yylval.token = *newKEYtoken(line_num, strdup(yytext), 0); return EQ; }
[,]                  { yylval.token = *newKEYtoken(line_num, strdup(yytext), 0); return COMMA; }
[:]                  { yylval.token = *newKEYtoken(line_num, strdup(yytext), 0); return COLON; }
[;]                  { yylval.token = *newKEYtoken(line_num, strdup(yytext), 0); return SEMICOLON; }
[<]                  { yylval.token = *newKEYtoken(line_num, strdup(yytext), 0); return LS; }
[>]                  { yylval.token = *newKEYtoken(line_num, strdup(yytext), 0); return GT; }
[?]                  { yylval.token = *newKEYtoken(line_num, strdup(yytext), 0); return QM; }
(\[)                 { yylval.token = *newKEYtoken(line_num, strdup(yytext), 0); return LBOX; }
(\])                 { yylval.token = *newKEYtoken(line_num, strdup(yytext), 0); return RBOX; }
(\%)                 { yylval.token = *newKEYtoken(line_num, strdup(yytext), 0); return PERC; }
[{]                  { yylval.token = *newKEYtoken(line_num, strdup(yytext), 0); return LBRACK; }
[}]                  { yylval.token = *newKEYtoken(line_num, strdup(yytext), 0); return RBRACK; }
(\.)                 { yylval.token = *newKEYtoken(line_num, strdup(yytext), 0); return DOT; }

bool                 { yylval.token = *newKEYtoken(line_num, strdup(yytext), 14); return BOOLCND; }
break                { yylval.token = *newKEYtoken(line_num, strdup(yytext), 15); return BREAKCND; }
char                 { yylval.token = *newKEYtoken(line_num, strdup(yytext), 16); return CHARCND; }
else                 { yylval.token = *newKEYtoken(line_num, strdup(yytext), 17); return ELSECND; }
if                   { yylval.token = *newKEYtoken(line_num, strdup(yytext), 18); return IFCND; }
int                  { yylval.token = *newKEYtoken(line_num, strdup(yytext), 20); return INTCND; }
record               { yylval.token = *newKEYtoken(line_num, strdup(yytext), 21); return RECORD; }
while                { yylval.token = *newKEYtoken(line_num, strdup(yytext), 22); return WHILECND; }
return               { yylval.token = *newKEYtoken(line_num, strdup(yytext), 23); return RETURNCND; }
static               { yylval.token = *newKEYtoken(line_num, strdup(yytext), 24); return STATIC; } 

{letter}{letdig}*    { yylval.token = *newIDtoken(line_num, strdup(yytext)); return IDVAL; }
{digit}+             { yylval.token = *newNUMtoken(line_num, strdup(yytext), strtol(strdup(yytext), NULL, 10)); return NUM; }
(.)                  { yyerror(yytext); }

%%


