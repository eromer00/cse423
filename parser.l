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
true                 { yylval.token = *newBOOLtoken(line_num, strdup(yytext), 1); return BOOL; }
false                { yylval.token = *newBOOLtoken(line_num, strdup(yytext), 0); return BOOL; }
and                  { yylval.token = *newKEYtoken(line_num, strdup(yytext), 1); return KEY; }
or                   { yylval.token = *newKEYtoken(line_num, strdup(yytext), 2); return KEY; }
not                  { yylval.token = *newKEYtoken(line_num, strdup(yytext), 3); return KEY; }
!=                   { yylval.token = *newKEYtoken(line_num, strdup(yytext), 4); return KEY; }
[*][=]               { yylval.token = *newKEYtoken(line_num, strdup(yytext), 5); return KEY; }
[+][+]               { yylval.token = *newKEYtoken(line_num, strdup(yytext), 6); return KEY; }
[+][=]               { yylval.token = *newKEYtoken(line_num, strdup(yytext), 7); return KEY; }
[-][-]               { yylval.token = *newKEYtoken(line_num, strdup(yytext), 8); return KEY; }
[-][=]               { yylval.token = *newKEYtoken(line_num, strdup(yytext), 9); return KEY; }
[/][=]               { yylval.token = *newKEYtoken(line_num, strdup(yytext), 10); return KEY; }
[<][=]               { yylval.token = *newKEYtoken(line_num, strdup(yytext), 11); return KEY; }
[=][=]               { yylval.token = *newKEYtoken(line_num, strdup(yytext), 12); return KEY; }
[>][=]               { yylval.token = *newKEYtoken(line_num, strdup(yytext), 13); return KEY; }

[(]                  { yylval.token = *newKEYtoken(line_num, strdup(yytext), 0); return KEY; }
[)]                  { yylval.token = *newKEYtoken(line_num, strdup(yytext), 0); return KEY; }
[*]                  { yylval.token = *newKEYtoken(line_num, strdup(yytext), 0); return KEY; }
(\/)                 { yylval.token = *newKEYtoken(line_num, strdup(yytext), 0); return KEY; }
[+]                  { yylval.token = *newKEYtoken(line_num, strdup(yytext), 0); return KEY; }
[-]                  { yylval.token = *newKEYtoken(line_num, strdup(yytext), 0); return KEY; }
[=]                  { yylval.token = *newKEYtoken(line_num, strdup(yytext), 0); return KEY; }
[,]                  { yylval.token = *newKEYtoken(line_num, strdup(yytext), 0); return KEY; }
[:]                  { yylval.token = *newKEYtoken(line_num, strdup(yytext), 0); return KEY; }
[;]                  { yylval.token = *newKEYtoken(line_num, strdup(yytext), 0); return KEY; }
[<]                  { yylval.token = *newKEYtoken(line_num, strdup(yytext), 0); return KEY; }
[>]                  { yylval.token = *newKEYtoken(line_num, strdup(yytext), 0); return KEY; }
[?]                  { yylval.token = *newKEYtoken(line_num, strdup(yytext), 0); return KEY; }
(\[)                 { yylval.token = *newKEYtoken(line_num, strdup(yytext), 0); return KEY; }
(\])                 { yylval.token = *newKEYtoken(line_num, strdup(yytext), 0); return KEY; }
(\%)                 { yylval.token = *newKEYtoken(line_num, strdup(yytext), 0); return KEY; }
[{]                  { yylval.token = *newKEYtoken(line_num, strdup(yytext), 0); return KEY; }
[}]                  { yylval.token = *newKEYtoken(line_num, strdup(yytext), 0); return KEY; }
(\.)                 { yylval.token = *newKEYtoken(line_num, strdup(yytext), 0); return KEY; }

bool                 { yylval.token = *newKEYtoken(line_num, strdup(yytext), 14); return KEY; }
break                { yylval.token = *newKEYtoken(line_num, strdup(yytext), 15); return KEY; }
char                 { yylval.token = *newKEYtoken(line_num, strdup(yytext), 16); return KEY; }
else                 { yylval.token = *newKEYtoken(line_num, strdup(yytext), 17); return KEY; }
if                   { yylval.token = *newKEYtoken(line_num, strdup(yytext), 18); return KEY; }
in                   { yylval.token = *newKEYtoken(line_num, strdup(yytext), 19); return KEY; }
int                  { yylval.token = *newKEYtoken(line_num, strdup(yytext), 20); return KEY; }
record               { yylval.token = *newKEYtoken(line_num, strdup(yytext), 21); return KEY; }
while                { yylval.token = *newKEYtoken(line_num, strdup(yytext), 22); return KEY; }
return               { yylval.token = *newKEYtoken(line_num, strdup(yytext), 23); return KEY; }
static               { yylval.token = *newKEYtoken(line_num, strdup(yytext), 24); return KEY; } 

{letter}{letdig}*    { yylval.token = *newIDtoken(line_num, strdup(yytext)); return IDVAL; }
{digit}+             { yylval.token = *newNUMtoken(line_num, strdup(yytext), strtol(strdup(yytext), NULL, 10)); return NUM; }
(.)                  { yyerror(yytext); }

%%


