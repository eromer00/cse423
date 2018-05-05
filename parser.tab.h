/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

#ifndef YY_YY_PARSER_TAB_H_INCLUDED
# define YY_YY_PARSER_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 1
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    ID = 258,
    NUMCONST = 259,
    CHARCONST = 260,
    RECTYPE = 261,
    BOOLCONST = 262,
    RECORD = 263,
    STATIC = 264,
    INT = 265,
    BOOL = 266,
    CHAR = 267,
    IF = 268,
    ELSE = 269,
    WHILE = 270,
    RETURN = 271,
    BREAK = 272,
    OR = 273,
    AND = 274,
    NOT = 275,
    EQ = 276,
    NOTEQ = 277,
    MULASS = 278,
    INC = 279,
    ADDASS = 280,
    DEC = 281,
    SUBASS = 282,
    DIVASS = 283,
    LESSEQ = 284,
    GRTEQ = 285,
    ASTERISK = 286,
    RANDOM = 287,
    DASH = 288,
    FSLASH = 289,
    LPAREN = 290,
    RPAREN = 291,
    PLUS = 292,
    COMMA = 293,
    LSQB = 294,
    RSQB = 295,
    COLON = 296,
    SCOLON = 297,
    LTHAN = 298,
    ASSIGN = 299,
    GTHAN = 300,
    MOD = 301,
    PERIOD = 302,
    LCB = 303,
    RCB = 304
  };
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED

union YYSTYPE
{
#line 62 "parser.y" /* yacc.c:1909  */

	Token token;
	struct TreeNode* treeNode;

#line 109 "parser.tab.h" /* yacc.c:1909  */
};

typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_PARSER_TAB_H_INCLUDED  */
