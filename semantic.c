/**
 *
 * @date Spring 2018
 * @author Taken from Omar Soliman
 *
 **/

//System libraries
#include<stdio.h>
#include<string.h>
#include<stdlib.h>
#include<ctype.h>

//Type check library
#include "semantic.h"

//Track warnings and errors
#define WARN numWarnings++
#define ERROR numErrors++
extern int numWarnings;
extern int numErrors;

//Global symbol table
static SymbolTable* stable;

/*
 * Compound statement counter
 * Used to name scopes
 */
static int compcnt = 0;

/*
 * Flag indicating first compound of function
 * Global so the child can recognize itself
 */
static int firstCmp = 0;

//Flag counter indicating typing inside a loop
static int insideLoop = 0;

//Global symbol pointer
Symbol* gsym = NULL;

//Variable init flag
int varInitCheck = 0;

//Variable init temp symbol pointer
Symbol* varInitSym = NULL;

//Variable return type holder
int retType = -1;

//Flag to check for function return
int funcRetType = -1;

//Variable to hold last FUNC
TreeNode* lastFUNC = NULL;

//Flag for parameter checking
int paramCheck = 0;

//Reference parser error function
void yyerror(const char* s);

/*
 * Operation string array
 *
 * plus -     +  |0
 * pplus -   ++  |1
 * dash -     -  |2
 * ddash -   --  |3
 * assign -   =  |4
 * passign - +=  |5
 * sassign - -=  |6
 * massign - *=  |7
 * dassign - /=  |8
 * asterisk - *  |9
 * fslash -   /  |10
 * bNOT -   NOT  |11
 * bAND -   AND  |12
 * bOR -     OR  |13
 * eqeq -    ==  |14
 * neq -     !=  |15
 * lteq -    <=  |16
 * lthan -    <  |17
 * gteq -    >=  |18
 * gthan -    >  |19
 * qmark -    ?  |20
 * mod -      %  |21
 * lsb -      [  |22
 * period -   .  |23
 * colon -    :  |24
 */
char* opString[25] = {
"+", "++", "-", "--", "=",
"+=", "-=", "*=", "/=", "*", "/",
"not", "and", "or", "==", "!=",
"<=", "<", ">=", ">", "?", "%",
"[", ".", ":"};

/*
 * Expression string array
 *
 * Void    |0
 * NUMB |1
 * TF |2
 * Char    |3
 * Unknown |4
 */
char* expString[5] = {
"void", "int", "bool",
"char", "unknown"};

/*
 * Convert type char to type string index
 *
 * c - type char
 */
int typeCharToInt(char c) {

	int i = 4;

	switch(c)
	{
		case 'i':
		case 'I':
			i = 1;
		break;

		case 'v':
		case 'V':
			i = 0;
		break;

		case 'b':
		case 'B':
			i = 2;
		break;

		case 'c':
		case 'C':
			i = 3;
		break;

		case 'u':
		case 'U':
			i = 4;
		break;

		default:
			yyerror("Bad attempt at typechar to int");
		break;
	}

	return(i);
}

/*
 * Initializes an empty global symbol table
 */
SymbolTable* initST(void) {

	//Allocate symbol table
	SymbolTable* st = malloc(sizeof(SymbolTable));
	if(st == NULL)
		yyerror("Failed to allocate symbol table.");

	//Set symbol table depth to nothing
	st->depth = 0;

	//Allocate global scope
	Scope* gscope = malloc(sizeof(Scope));
	if(gscope == NULL)
		yyerror("Failed to allocate global scope.");

	//Put gscope in the symbol table
	st->current = gscope;
	st->head = gscope;
	st->tail = gscope;

	//Name the scope
	gscope->name = strdup("0_global");

	//Set the scope symbol list end pointers
	gscope->firstSym = NULL;
	gscope->lastSym = NULL;

	//Set next scope
	gscope->next = NULL;

	//Set parent scope
	gscope->parent = NULL;

	return(st);
}

/*
* Create a new scope
*
* string - Scope name
* l - Line number of scope creation
*/
Scope* newScope(char* string, int l) {

	//Allocate scope memory
	Scope* scope = malloc(sizeof(Scope));
	if(scope == NULL)
		yyerror("Failed to allocate scope.");

	//Name the scope
	scope->name = strdup(string);

	//Set the scope symbol list end pointers
	scope->firstSym = NULL;
	scope->lastSym = NULL;

	//Set parent scope to the current scope
	scope->parent = stable->current;
	stable->current = scope;

	//Increase stack counter
	stable->depth++;

	//Link the scope to the main list
	stable->tail->next = scope;
	stable->tail = scope;

	//Add scope label to parent scope symbols
	Symbol* temp = newSymbol(string, string, l);
	if(temp == NULL)
		yyerror("Failed to allocate scope label symbol.");
	insertSymbol(scope->parent,temp);

	return(scope);
}

/*
* Create a new symbol
*
* n - Symbol name
* d - Symbol data
* l - Symbol line number
*/
Symbol* newSymbol(char* n, char* d, int l) {

	//Allocate symbol
	Symbol* symbol = malloc(sizeof(Symbol));
	if(symbol == NULL)
		yyerror("Failed to allocate symbol.");

	//Name the symbol
	symbol->name = strdup(n);

	//Store symbol data
	symbol->data = strdup(d);

	//Set symbol sibling
	symbol->nextSym = NULL;

	//Set symbol line number
	symbol->line = l;

	//Init type string
	symbol->paramType[0] = '\0';

	return(symbol);
}

/*
* Search for a symbol in a scope
*
* s - Scope to search in
* string - Symbol name to look for
*/
Symbol* findSymbol(Scope* s, char* string) {

	//Point to first symbol in the scope
	Symbol* x = s->firstSym;

	//Iterate through all scope symbols
	while(x != NULL)
	{
		//Check if symbol names match
		if(strcmp(x->name,string) == 0)
			return(x);
		else
			x = x->nextSym;
	}

	//No matching symbol was found
	return(NULL);
}

/*
 * Search current stack of scopes for symbol
 *
 * string - Symbol name to search for
 */
Symbol* stackSearch(char* string) {

	//Temp symbol
	Symbol* sym = NULL;

	//Starting in the current scope
	Scope* sc = stable->current;

	//Check up the scope stack until global
	while(sc != NULL)
	{
		//Search for matching symbol being returned
		sym = findSymbol(sc, string);

		if(sym == NULL)
			sc = sc->parent;
		else
			break;
	}

	return(sym); 
}

/*
 * Checks a node for ID type
 *
 * t - Node to check
 * string - String to compare symbol type to
 * match - Check for string or lack of string
 */
int idCheck(TreeNode* t, char* string, int match) {

	/*
	 * Return value
	 *
	 * -1 - Not an ID
	 * -2 - ID not found
	 * 0 - Condition was matched
	 * 1 - Condition was not matched
	 * 2 - ID is a function
	 */
	int value;

	if(t == NULL)
	{
		yyerror("BAD IDCHECK CALL WITH NULL NODE");
		value = -2;
	}
	//Node is an ID
	else if((t->nodekind == EXP) && (t->kind.exp == ID))
	{
		//Try to find returning symbol
		gsym = stackSearch(t->attr.name);

		//Symbol was found
		if(gsym != NULL)
		{
			//Symbol is a function
			if(gsym->data[0] == 'F')
				value = 2;
			else if(match)
			{
				//Check symbol data for string
				if(strstr(gsym->data,string) != NULL)
				{
					value = 0;
				}
				else
					value = 1;
			}
			else
			{
				//Check symbol data for lack of string
				if(strstr(gsym->data,string) == NULL)
				{
					value = 0;
				}
				else
					value = 1;
			}
		}
		else
			value = -2;
	}
	//Node is not an ID
	else
		value = -1;

	return(value);
}

/*
* Insert symbol into scope
*
* sco - Scope to add to
* sym - Symbol to add
*/
void insertSymbol(Scope* sco, Symbol* sym) {

	//If this is the only symbol, point first here
	if(sco->firstSym == NULL)
		sco->firstSym = sym;

	//If this is the only symbol, point first here
	if(sco->lastSym == NULL)
	{
		sco->lastSym = sym;
	}
	else
	{
		//Add sym as last symbol sibling
		sco->lastSym->nextSym = sym;
		//Point scope end to sym
		sco->lastSym = sym;
	}

	return;
}

/*
* Print a symbol
*
* o - File to print to
* sym - Symbol to print
*/
void printSymbol(FILE* o, Symbol* sym) {

	/*
	 * Check if symbol is actually scope label
	 * Since IDs cannot start with a digit,
	 * scope names always start with a digit
	 */
	if(isdigit((int) sym->name[0]))
		fprintf(o,"__Symbol %s is a scope label from line [%d].\n",sym->name,sym->line);
	else
		fprintf(o,"__Symbol %s is of type %s from line [%d].\n",sym->name,sym->data,sym->line);

	return;
}

/*
* Print a scope
*
* o - File to print to
* sco - Scope to print
*/
void printScope(FILE* o, Scope* sco) {

	//Check for lack of parent, which indicates global scope
	if(sco->parent != NULL)
		fprintf(o,"%%Scope %s is a child scope of %s.\n",sco->name,sco->parent->name);
	else
		fprintf(o,"%%Scope %s is the global scope.\n",sco->name);

	fprintf(o,"SYMBOLS:\n");

	//Iterate over scope symbols
	Symbol* x = sco->firstSym;

	//Loop through all the scoped symbols
	while(x != NULL)
	{
		printSymbol(o,x);
		x = x->nextSym;
	}

	return;
}

/*
* Print a symbol table
*
* o - File to print to
*/
void printSymbolTable(FILE* o) {

	fprintf(o,"\nSymbol Table is at depth %d and currently in scope %s.\n",stable->depth,stable->current->name);

	fprintf(o,"\nSymbol Table contents:\n");

	//Iterate over scope symbols
	Scope* x = stable->head;

	do
	{
		printScope(o,x);
		x = x->next;
	}while(x != NULL);

	return;
}

/*
 * Prints a typecheck warning
 *
 * warnum - Error code index
 * line - Line number
 * s1 - First string
 * s2 - Second string
 * s3 - Third string
 * i1 - First NUMB
 */
void printWarning(int warnum, int line, char* s1, char* s2, char* s3, int i1) {

	//Print error header
	printf("WARNING(%d): ",line);

	//Display the correct error message
	switch(warnum)
	{
		case 1:
			printf("Expecting to return type %s but function '%s' has no return statement.\n",s1,s2);
		break;

		default:

		break;
	}

	//Increase warning count
	WARN;

	return;
}


/*
 * Prints a typecheck error
 *
 * errnum - Error code index
 * line - Line number
 * s1 - First string
 * s2 - Second string
 * s3 - Third string
 * i1 - First NUMB
 * i2 - Second NUMB
 */
void printError(int errnum, int line, char* s1, char* s2, char* s3, int i1, int i2) {

	//0 error for missing main
	if(!errnum)
	{
		printf("ERROR(LINKER): Procedure main is not defined.\n");
		ERROR;
		return;
	}

	//Print error header
	printf("ERROR(%d): ",line);

	//Display the correct error message
	switch(errnum)
	{
		case 1:
			printf("'%s' is a simple variable and cannot be called.\n",s1);
		break;

		case 2:
			printf("'%s' requires operands of type %s but lhs is of type %s.\n",s1,s2,s3);
		break;

		case 3:
			printf("'%s' requires operands of type %s but rhs is of type %s.\n",s1,s2,s3);
		break;

		case 4:
			printf("'%s' requires operands of the same type but lhs is type %s and rhs is type %s.\n",s1,s2,s3);
		break;

		case 5:
			printf("Array '%s' should be indexed by type int but got type %s.\n",s1,s2);
		break;

		case 6:
			printf("Array index is the unindexed array '%s'.\n",s1);
		break;

		case 7:
			printf("Cannot index nonarray '%s'.\n",s1);
		break;

		case 8:
			printf("Cannot index nonarray.\n");
		break;

		case 9:
			printf("Cannot return an array.\n");
		break;

		case 10:
			printf("Cannot use function '%s' as a variable.\n",s1);
		break;

		case 11:
			printf("Symbol '%s' is already defined at line %d.\n",s1,i1);
		break;

		case 12:
			printf("Symbol '%s' is not defined.\n",s1);
		break;

		case 13:
			printf("The operation '%s' does not work with arrays.\n",s1);
		break;

		case 14:
			printf("The operation '%s' only works with arrays.\n",s1);
		break;

		case 15:
			printf("Unary '%s' requires an operand of type %s but was given type %s.\n",s1,s2,s3);
		break;

		case 16:
			printf("Expecting Boolean test condition in %s statement but got type %s.\n",s1,s2);
		break;

		case 17:
			printf("Cannot use array as test condition in %s statement.\n",s1);
		break;

		case 18:
			printf("Cannot have a break statement outside of loop.\n");
		break;

		case 19:
			printf("'%s' requires that either both or neither operands be arrays.\n",s1);
		break;

		case 20:
			printf("Initializer for variable '%s' is not a constant expression.\n",s1);
		break;

		case 21:
			printf("Variable '%s' is of type %s but is being initialized with an expression of type %s.\n",s1,s2,s3);
		break;

		case 22:
			printf("Function '%s' is not defined.\n",s1);
		break;

		case 23:
			printf("Function '%s' at line %d is expecting no return value, but return has return value.\n",s1,i1);
		break;

		case 24:
			printf("Function '%s' at line %d is expecting to return type %s but instead returns type %s.\n",s1,i1,s2,s3);
		break;

		case 25:
			printf("Function '%s' at line %d is expecting to return type %s but return has no return value.\n",s1,i1,s2);
		break;

		case 26:
			printf("Too few parameters passed for function '%s' defined on line %d.\n",s1,i1);
		break;

		case 27:
			printf("Too many parameters passed for function '%s' defined on line %d.\n",s1,i1);
		break;

		case 28:
			printf("Expecting type %s in parameter %d of call to '%s' defined on line %d but got type %s.\n",s1,i1,s2,i2,s3);
		break;

		case 29:
			printf("Expecting array in parameter %d of call to '%s' defined on line %d.\n",i1,s1,i2);
		break;

		case 30:
			printf("Not expecting array in parameter %d of call to '%s' defined on line %d.\n",i1,s1,i2);
		break;

		case 31:
			printf("Array index is an unindexed array.\n");
		break;

		//Bad error code
		default:
			yyerror("Bad error function call");
		break;
	}

	//Increase error count
	ERROR;

	return;
}

/*
 * Perform type-checking on operators
 *
 * tree - Node containing the operation
 */
void operatorCheck(TreeNode* tree) {

	switch (tree->attr.op)
	{

		/*
		 * Requires INT_INT, gives INT
		 */
		case DASSIGN:
		case MASSIGN:
		case SASSIGN:
		case PASSIGN:
		case MOD:
		case FSLASH:
		case PLUS:

			//Check LHS ID
			switch(idCheck(tree->child[0], "ARRAY", 1))
			{
				//LHS is array
				case 0:
					//Typecheck array anyways
					if(gsym->data[6] != 'i')
						printError(2,tree->lineno,opString[tree->attr.op],expString[NUMB],gsym->data+6,0,0);

					tree->child[0]->isArray = 1;
				break;

				//LHS is not an array
				case 1:
					//Check if LHS type matches INT
					if(gsym->data[0] != 'i')
						printError(2,tree->lineno,opString[tree->attr.op],expString[NUMB],gsym->data,0,0);
				break;

				//LHS is a function
				case 2:
					if(gsym->data[9] != 'i')
						printError(2,tree->lineno,opString[tree->attr.op],expString[NUMB],gsym->data+9,0,0);
				break;

				//Not an ID
				case -1:
					//Check expType
					if(tree->child[0]->expType != NUMB)
						printError(2,tree->lineno,opString[tree->attr.op],expString[NUMB],expString[tree->child[0]->expType],0,0);
				break;

				//ID not found
				case -2: break;

				//Bad value
				default:
					yyerror("Bad LHS INTOP idcheck value");
				break;
			}

			//Check RHS ID
			switch(idCheck(tree->child[1], "ARRAY", 1))
			{
				//RHS is array
				case 0:
					//Typecheck array anyways
					if(gsym->data[6] != 'i')
						printError(3,tree->lineno,opString[tree->attr.op],expString[NUMB],gsym->data+6,0,0);

					tree->child[1]->isArray = 1;
				break;

				//RHS is not an array
				case 1:
					//Check if RHS type matches INT
					if(gsym->data[0] != 'i')
						printError(3,tree->lineno,opString[tree->attr.op],expString[NUMB],gsym->data,0,0);
				break;

				//RHS is a function
				case 2:
					if(gsym->data[9] != 'i')
						printError(3,tree->lineno,opString[tree->attr.op],expString[NUMB],gsym->data+9,0,0);
				break;

				//Not an ID
				case -1:
					//Check expType
					if(tree->child[1]->expType != NUMB)
						printError(3,tree->lineno,opString[tree->attr.op],expString[NUMB],expString[tree->child[1]->expType],0,0);
				break;

				//ID not found
				case -2: break;

				//Bad value
				default:
					yyerror("Bad RHS INTOP idcheck value");
				break;
			}

			if(tree->child[0]->isArray || tree->child[1]->isArray)
				printError(13,tree->lineno,opString[tree->attr.op],"","",0,0);

			//Set return type
			tree->expType = NUMB;

		break;

		/*
		 * Requires SAME_SAME, gives LHS
		 */
		case ASSIGN:

			//Check LHS ID
			switch(idCheck(tree->child[0], "ARRAY", 1))
			{
				//LHS is array
				case 0:
					//Indicate array status
					tree->isArray = 1;

					if(gsym->data[6] == 'i')
						tree->expType = NUMB;
					else if(gsym->data[6] == 'v')
					{
						//Assign to void error
						tree->expType = VOID;
						printError(2,tree->lineno,opString[tree->attr.op],"NONVOID",expString[VOID],0,0);
					}
					else if(gsym->data[6] == 'b')
						tree->expType = TF;
					else if(gsym->data[6] == 'c')
						tree->expType = SINGLE;
					else if(gsym->data[6] == 'u')
						tree->expType = Unknown;
					else
						yyerror("Bad LHS = type");
				break;

				//LHS is not an array
				case 1:
					//Indicate array status
					tree->isArray = 0;

					//Set node expType to array type
					if(gsym->data[0] == 'i')
						tree->expType = NUMB;
					else if(gsym->data[0] == 'v')
					{
						//Assign to void error
						tree->expType = VOID;
						printError(2,tree->lineno,opString[tree->attr.op],"NONVOID",expString[VOID],0,0);
					}
					else if(gsym->data[0] == 'b')
						tree->expType = TF;
					else if(gsym->data[0] == 'c')
						tree->expType = SINGLE;
					else if(gsym->data[0] == 'u')
						tree->expType = Unknown;
					else
						yyerror("Bad LHS = type");
				break;

				//LHS is a function
				case 2:
					//Indicate array status
					tree->isArray = 0;
				break;

				//Not an ID
				case -1:
					//Indicate array status
					tree->isArray = 0;

					//Set return type to LHS
					tree->expType = tree->child[0]->expType;

					//Assign to void error
					if(tree->expType == VOID)
						printError(2,tree->lineno,opString[tree->attr.op],"NONVOID",expString[VOID],0,0);
				break;

				//ID not found
				case -2: break;

				//Bad value
				default:
					yyerror("Bad LHS ASSIGN idcheck value");
				break;
			}

			//Check RHS ID
			switch(idCheck(tree->child[1], "ARRAY", 1))
			{
				//RHS is array
				case 0:
					if(gsym->data[6] == 'v')
						printError(3,tree->lineno,opString[tree->attr.op],"NONVOID",expString[VOID],0,0);
					else if ( (gsym->data[6] == 'u') || (tree->expType == Unknown) )
						break;
					else if( (gsym->data[6] == 'b') && ( (tree->expType == NUMB) || (tree->expType == SINGLE) ) )
						printError(4,tree->lineno,opString[tree->attr.op],expString[tree->expType],expString[TF],0,0);
					else if( (gsym->data[6] == 'i') && ( (tree->expType == TF) || (tree->expType == SINGLE) ) )
						printError(4,tree->lineno,opString[tree->attr.op],expString[tree->expType],expString[NUMB],0,0);
					else if( (gsym->data[6] == 'c') && ( (tree->expType == NUMB) || (tree->expType == TF) ) )
						printError(4,tree->lineno,opString[tree->attr.op],expString[tree->expType],expString[SINGLE],0,0);

					//Check if LHS was also array
					if(tree->isArray != 1)
						printError(19,tree->lineno,opString[tree->attr.op],"","",0,0);
				break;

				//RHS is not an array
				case 1:
					if(gsym->data[0] == 'v')
						printError(3,tree->lineno,opString[tree->attr.op],"NONVOID",expString[VOID],0,0);
					else if ( (gsym->data[0] == 'u') || (tree->expType == Unknown) )
						break;
					else if( (gsym->data[0] == 'b') && ( (tree->expType == NUMB) || (tree->expType == SINGLE) ) )
						printError(4,tree->lineno,opString[tree->attr.op],expString[tree->expType],expString[TF],0,0);
					else if( (gsym->data[0] == 'i') && ( (tree->expType == TF) || (tree->expType == SINGLE) ) )
						printError(4,tree->lineno,opString[tree->attr.op],expString[tree->expType],expString[NUMB],0,0);
					else if( (gsym->data[0] == 'c') && ( (tree->expType == NUMB) || (tree->expType == TF) ) )
						printError(4,tree->lineno,opString[tree->attr.op],expString[tree->expType],expString[SINGLE],0,0);

					//Check if LHS was also not array
					if(tree->isArray != 0)
						printError(19,tree->lineno,opString[tree->attr.op],"","",0,0);
				break;

				//RHS is function
				case 2:
					if(gsym->data[9] == 'v')
						printError(3,tree->lineno,opString[tree->attr.op],"NONVOID",expString[VOID],0,0);
					else if ( (gsym->data[9] == 'u') || (tree->expType == Unknown) )
						break;
					else if( (gsym->data[9] == 'b') && ((tree->expType == NUMB) || (tree->expType == SINGLE)) && tree->child[1]->isFunc)
						printError(4,tree->lineno,opString[tree->attr.op],expString[tree->expType],expString[TF],0,0);
					else if( (gsym->data[9] == 'i') && ((tree->expType == TF) || (tree->expType == SINGLE)) && tree->child[1]->isFunc)
						printError(4,tree->lineno,opString[tree->attr.op],expString[tree->expType],expString[NUMB],0,0);
					else if( (gsym->data[9] == 'c') && ((tree->expType == NUMB) || (tree->expType == TF)) && tree->child[1]->isFunc)
						printError(4,tree->lineno,opString[tree->attr.op],expString[tree->expType],expString[SINGLE],0,0);

					//Check if LHS was also not array
					if(tree->isArray != 0)
						printError(19,tree->lineno,opString[tree->attr.op],"","",0,0);
				break;

				//Not an ID
				case -1:
					//Check expType
					if(tree->child[1]->expType == VOID)
						printError(3,tree->lineno,opString[tree->attr.op],"NONVOID",expString[VOID],0,0);
					else if ((tree->expType == Unknown) || (tree->child[1]->expType == Unknown) )
						break;
					else if(tree->expType != tree->child[1]->expType)
						printError(4,tree->lineno,opString[tree->attr.op],expString[tree->expType],expString[tree->child[1]->expType],0,0);

					//Check if LHS was also not array
					if(tree->isArray != 0)
						printError(19,tree->lineno,opString[tree->attr.op],"","",0,0);
				break;

				//ID not found
				case -2: break;

				//Bad value
				default:
					yyerror("Bad RHS ASSIGN idcheck value");
				break;
			}
		break;

		/*
		 * Requires RECORD_MEMBER, gives RHS
		 */
		case PERIODK:

			//Check LHS RECORD ID
			switch(idCheck(tree->child[0], "RECORD", 0))
			{
				//LHS is not record
				case 0:
					//Set var type anyways
					if(gsym->data[0] == 'A')
						switch(gsym->data[6])
						{
							case 'i':
								tree->expType = NUMB;
							break;

							case 'c':
								tree->expType = SINGLE;
							break;

							case 'b':
								tree->expType = TF;
							break;

							case 'u':
								tree->expType = Unknown;
							break;

							default:
								yyerror("Bad record array type");
							break;
						}
					else
						switch(gsym->data[0])
						{
							case 'i':
								tree->expType = NUMB;
							break;

							case 'c':
								tree->expType = SINGLE;
							break;

							case 'b':
								tree->expType = TF;
							break;

							case 'u':
								tree->expType = Unknown;
							break;

							default:
								yyerror("Bad record ID type");
							break;
						}
				break;

				//LHS is a RECORD
				case 1:
					//Check sibling membership

					//Set return type to member type
				break;

				//LHS is a function
				case 2:

				break;

				//Not an ID
				case -1:
					//Set type anyways
					tree->expType = tree->child[0]->expType;
				break;

				//ID not found
				case -2: break;

				//Bad value
				default:
					yyerror("Bad PERIOD idcheck value");
				break;
			}
		break;

		/*
		 * Requires ARRAY_INT, gives LHS
		 */
		case LSB:

			//Check LHS array ID
			switch(idCheck(tree->child[0], "ARRAY", 0))
			{
				//LHS is not array
				case 0:
					printError(7,tree->lineno,tree->child[0]->attr.name,"","",0,0);

					//Set node expType to type anyways
					if(gsym->data[0] == 'i')
						tree->expType = NUMB;
					else if(gsym->data[0] == 'v')
						tree->expType = VOID;
					else if(gsym->data[0] == 'b')
						tree->expType = TF;
					else if(gsym->data[0] == 'c')
						tree->expType = SINGLE;
					else
						tree->expType = Unknown;
				break;

				//LHS is an array
				case 1:
					//Set node expType to array type
					if(gsym->data[6] == 'i')
						tree->expType = NUMB;
					else if(gsym->data[6] == 'v')
						tree->expType = VOID;
					else if(gsym->data[6] == 'b')
						tree->expType = TF;
					else if(gsym->data[6] == 'c')
						tree->expType = SINGLE;
					else
						tree->expType = Unknown;
				break;

				//LHS is a function
				case 2:
					//Cannot index function
					printError(7,tree->lineno,tree->child[0]->attr.name,"","",0,0);
				break;

				//Not an ID
				case -1:
					printError(8,tree->lineno,"","","",0,0);

					//Set type anyways
					tree->expType = tree->child[0]->expType;
				break;

				//ID not found
				case -2:
					//Cannot index non-existant symbol
					printError(7,tree->lineno,tree->child[0]->attr.name,"","",0,0);
				break;

				//Bad value
				default:
					yyerror("Bad ARRAY ID idcheck value");
				break;
			}

			//Check RHS ID of array index
			switch(idCheck(tree->child[1], "ARRAY", 1))
			{
				//RHS is an array
				case 0:
					//Typecheck the array anyways
					if(gsym->data[6] != 'i')
						printError(5,tree->lineno,tree->child[0]->attr.name,gsym->data+6,"",0,0);

					//Array error
					printError(6,tree->lineno,tree->child[1]->attr.name,"","",0,0);
				break;

				//RHS is not an array
				case 1:
					//Check if RHS type matches INT
					if(gsym->data[0] != 'i')
						printError(5,tree->lineno,tree->child[0]->attr.name,gsym->data,"",0,0);
				break;

				//RHS is a function
				case 2:
					//Typecheck function anyways only if () are present
					if( (gsym->data[9] != 'i') && (tree->child[1]->isFunc))
						printError(5,tree->lineno,tree->child[0]->attr.name,gsym->data+9,"",0,0);
				break;

				//Not an ID
				case -1:
					//Check expType
					if(tree->child[1]->expType != NUMB)
						printError(5,tree->lineno,tree->child[0]->attr.name,expString[tree->child[1]->expType],"",0,0);

					if(tree->child[1]->isArray)
						printError(31,tree->lineno,"","","",0,0);
				break;

				//ID not found
				case -2: break;

				//Bad value
				default:
					yyerror("Bad ARRAY INDEX idcheck value");
				break;
			}
		break;

		/*
		 * Check if negation or subtraction
		 * Sub - Requires INT_INT, gives INT
		 * Neg - Requires INT, gives INT
		 */
		case DASH:

			//Negate operator
			if(tree->child[1] == NULL)
			{
				//Check operand ID
				switch(idCheck(tree->child[0], "ARRAY", 1))
				{
					//Operand is an array
					case 0:
						//Check if operand type matches INT anyways
						if(gsym->data[6] != 'i')
							printError(15,tree->lineno,opString[tree->attr.op],expString[NUMB],gsym->data+6,0,0);

						printError(13,tree->lineno,opString[tree->attr.op],"","",0,0);
					break;

					//Operand is not an array
					case 1:
						//Check if operand type matches INT
						if(gsym->data[0] != 'i')
							printError(15,tree->lineno,opString[tree->attr.op],expString[NUMB],gsym->data,0,0);
					break;

					//Operand is a function
					case 2:
						if(gsym->data[9] != 'i')
							printError(15,tree->lineno,opString[tree->attr.op],expString[NUMB],gsym->data+9,0,0);
					break;

					//Not an ID
					case -1:
						if(tree->child[0]->expType != NUMB)
							printError(15,tree->lineno,opString[tree->attr.op],expString[NUMB],expString[tree->child[0]->expType],0,0);
					break;

					//ID not found
					case -2: break;

					//Bad value
					default:
						yyerror("Bad DASH idcheck value");
					break;
				}
			}
			//Subtraction
			else
			{
				//Check LHS ID
				switch(idCheck(tree->child[0], "ARRAY", 1))
				{
					//LHS is array
					case 0:
						//Check if LHS type matches INT anyways
						if(gsym->data[6] != 'i')
							printError(2,tree->lineno,opString[tree->attr.op],expString[NUMB],gsym->data+6,0,0);

						tree->child[0]->isArray = 1;
					break;

					//LHS is not an array
					case 1:
						//Check if LHS type matches INT
						if(gsym->data[0] != 'i')
							printError(2,tree->lineno,opString[tree->attr.op],expString[NUMB],gsym->data,0,0);
					break;

					//LHS is a function
					case 2:
						if(gsym->data[9] != 'i')
							printError(2,tree->lineno,opString[tree->attr.op],expString[NUMB],gsym->data+9,0,0);
					break;

					//Not an ID
					case -1:
						//Check expType
						if(tree->child[0]->expType != NUMB)
							printError(2,tree->lineno,opString[tree->attr.op],expString[NUMB],expString[tree->child[0]->expType],0,0);
					break;

					//ID not found
					case -2: break;

					//Bad value
					default:
						yyerror("Bad SUBTRACT LHS idcheck value");
					break;
				}

				//Check RHS ID
				switch(idCheck(tree->child[1], "ARRAY", 1))
				{
					//RHS is array
					case 0:
						//Check if LHS type matches INT anyways
						if(gsym->data[6] != 'i')
							printError(3,tree->lineno,opString[tree->attr.op],expString[NUMB],gsym->data+6,0,0);

						tree->child[1]->isArray = 1;
					break;

					//RHS is not an array
					case 1:
						//Check if RHS type matches INT
						if(gsym->data[0] != 'i')
							printError(3,tree->lineno,opString[tree->attr.op],expString[NUMB],gsym->data,0,0);
					break;

					//RHS is a function
					case 2:
						if(gsym->data[9] != 'i')
							printError(3,tree->lineno,opString[tree->attr.op],expString[NUMB],gsym->data+9,0,0);
					break;

					//Not an ID
					case -1:
						//Check expType
						if(tree->child[1]->expType != NUMB)
							printError(3,tree->lineno,opString[tree->attr.op],expString[NUMB],expString[tree->child[1]->expType],0,0);
					break;

					//ID not found
					case -2: break;

					//Bad value
					default:
						yyerror("Bad SUBTRACT RHS idcheck value");
					break;
				}

				if(tree->child[0]->isArray || tree->child[1]->isArray)
					printError(13,tree->lineno,opString[tree->attr.op],"","",0,0);
			}

			//Set return type
			tree->expType = NUMB;
		break;

		/*
		 * Check if sizing or multiplication
		 * Mult - Requires INT_INT, gives INT
		 * Size - Requires ARRAY, gives INT
		 */
		case ASTERISK:

			//Size operator
			if(tree->child[1] == NULL)
			{
				//Check operand ID
				switch(idCheck(tree->child[0], "ARRAY", 0))
				{
					//Operand is not an array
					case 0:
						printError(14,tree->lineno,opString[tree->attr.op],"","",0,0);
					break;

					//Operand is an array
					case 1:
						tree->expType = NUMB;
					break;

					//Operand is a function
					case 2:
						printError(14,tree->lineno,opString[tree->attr.op],"","",0,0);
					break;

					//Not an ID
					case -1:
						printError(14,tree->lineno,opString[tree->attr.op],"","",0,0);
					break;

					//ID not found
					case -2: break;

					//Bad value
					default:
						yyerror("Bad ASTERISK idcheck value");
					break;
				}
			}
			//Multiply
			else
			{
				//Check LHS ID
				switch(idCheck(tree->child[0], "ARRAY", 1))
				{
					//LHS is array
					case 0:
						//Check if LHS type matches INT anyways
						if(gsym->data[6] != 'i')
							printError(2,tree->lineno,opString[tree->attr.op],expString[NUMB],gsym->data+6,0,0);

						tree->child[0]->isArray = 1;
					break;

					//LHS is not an array
					case 1:
						//Check if LHS type matches INT
						if(gsym->data[0] != 'i')
							printError(2,tree->lineno,opString[tree->attr.op],expString[NUMB],gsym->data,0,0);
					break;

					//LHS is a function
					case 2:
						if(gsym->data[9] != 'i')
							printError(2,tree->lineno,opString[tree->attr.op],expString[NUMB],gsym->data+9,0,0);
					break;

					//Not an ID
					case -1:
						//Check expType
						if(tree->child[0]->expType != NUMB)
							printError(2,tree->lineno,opString[tree->attr.op],expString[NUMB],expString[tree->child[0]->expType],0,0);
					break;

					//ID not found
					case -2: break;

					//Bad value
					default:
						yyerror("Bad MULTIP LHS idcheck value");
					break;
				}

				//Check RHS ID
				switch(idCheck(tree->child[1], "ARRAY", 1))
				{
					//RHS is array
					case 0:
						//Check if RHS type matches INT anyways
						if(gsym->data[6] != 'i')
							printError(3,tree->lineno,opString[tree->attr.op],expString[NUMB],gsym->data+6,0,0);

						tree->child[1]->isArray = 1;
					break;

					//RHS is not an array
					case 1:
						//Check if RHS type matches INT
						if(gsym->data[0] != 'i')
							printError(3,tree->lineno,opString[tree->attr.op],expString[NUMB],gsym->data,0,0);
					break;

					//RHS is a function
					case 2:
						if(gsym->data[9] != 'i')
							printError(3,tree->lineno,opString[tree->attr.op],expString[NUMB],gsym->data+9,0,0);
					break;

					//Not an ID
					case -1:
						//Check expType
						if(tree->child[1]->expType != NUMB)
							printError(3,tree->lineno,opString[tree->attr.op],expString[NUMB],expString[tree->child[1]->expType],0,0);
					break;

					//ID not found
					case -2: break;

					//Bad value
					default:
						yyerror("Bad MULTIP RHS idcheck value");
					break;
				}

				if(tree->child[0]->isArray || tree->child[1]->isArray)
					printError(13,tree->lineno,opString[tree->attr.op],"","",0,0);
			}

			//Set return type
			tree->expType = NUMB;
		break;

		/*
		 * Requires INT, gives INT
		 * Or ARRAY, gives ARRAY[?SIZEOF]
		 */
		case QMARK:

			//Check operand ID
			switch(idCheck(tree->child[0], "ARRAY", 1))
			{
				//Operand is array
				case 0:
					//Check if Operand type matches INT
					if(gsym->data[6] != 'i')
						printError(15,tree->lineno,opString[tree->attr.op],expString[NUMB],gsym->data+6,0,0);

					/*Get array size, but for now err*/
					printError(13,tree->lineno,opString[tree->attr.op],"","",0,0);
				break;

				//Operand is not an array
				case 1:
					//Check if Operand type matches INT
					if(gsym->data[0] != 'i')
						printError(15,tree->lineno,opString[tree->attr.op],expString[NUMB],gsym->data,0,0);
				break;

				//Operand is a function
				case 2:
					//Check if type matches INT
					if(gsym->data[9] != 'i')
						printError(15,tree->lineno,opString[tree->attr.op],expString[NUMB],gsym->data+9,0,0);
				break;

				//Not an ID
				case -1:
					//Check expType
					if(tree->child[0]->expType != NUMB)
						printError(15,tree->lineno,opString[tree->attr.op],"int",expString[tree->child[0]->expType],0,0);
				break;

				//ID not found
				case -2: break;

				//Bad value
				default:
					yyerror("Bad QMARK idcheck value");
				break;
			}

			//Set NUMB return type
			tree->expType = NUMB;
		break;

		/*
		 * Requires INT, gives INT
		 */
		case PPLUS:
		case DDASH:
			//Check operand ID
			switch(idCheck(tree->child[0], "ARRAY", 1))
			{
				//Operand is an array
				case 0:
					//Check if operand type matches INT
					if(gsym->data[6] != 'i')
						printError(15,tree->lineno,opString[tree->attr.op],expString[NUMB],gsym->data+6,0,0);

					printError(13,tree->lineno,opString[tree->attr.op],"","",0,0);
				break;

				//Operand is not an array
				case 1:
					//Check if operand type matches INT
					if(gsym->data[0] != 'i')
						printError(15,tree->lineno,opString[tree->attr.op],expString[NUMB],gsym->data,0,0);
				break;

				//Operand is a function
				case 2:
					//Check if type matches INT
					if(gsym->data[9] != 'i')
						printError(15,tree->lineno,opString[tree->attr.op],expString[NUMB],gsym->data+9,0,0);
				break;

				//Not an ID
				case -1:
					if(tree->child[0]->expType != NUMB)
						printError(15,tree->lineno,opString[tree->attr.op],expString[NUMB],expString[tree->child[0]->expType],0,0);
				break;

				//ID not found
				case -2: break;

				//Bad value
				default:
					yyerror("Bad INCDEC idcheck value");
				break;
			}

			//Set NUMB return type
			tree->expType = NUMB;
		break;

		/*
		 * Requires SAME_SAME, gives BOOL
		 */
		case EQCP:
		case NEQ:

			//Check LHS ID
			switch(idCheck(tree->child[0], "ARRAY", 1))
			{
				//LHS is array
				case 0:
					//Indicate array
					tree->isArray = 1;

					if(gsym->data[6] == 'i')
						tree->expType = NUMB;
					else if(gsym->data[6] == 'v')
					{
						printError(2,tree->lineno,opString[tree->attr.op],"NONVOID",expString[VOID],0,0);
						tree->expType = VOID;
					}
					else if(gsym->data[6] == 'b')
						tree->expType = TF;
					else if(gsym->data[6] == 'c')
						tree->expType = SINGLE;
					else
						tree->expType = Unknown;
				break;

				//LHS is not an array
				case 1:
					//Indicate array
					tree->isArray = 0;

					//Set node expType to array type
					if(gsym->data[0] == 'i')
						tree->expType = NUMB;
					else if(gsym->data[0] == 'v')
					{
						printError(2,tree->lineno,opString[tree->attr.op],"NONVOID",expString[VOID],0,0);
						tree->expType = VOID;
					}
					else if(gsym->data[0] == 'b')
						tree->expType = TF;
					else if(gsym->data[0] == 'c')
						tree->expType = SINGLE;
					else
						tree->expType = Unknown;
				break;

				//LHS is a function
				case 2:
					//Indicate array
					tree->isArray = 0;

					//Set node expType to array type
					if(gsym->data[9] == 'i')
						tree->expType = NUMB;
					else if(gsym->data[9] == 'v')
					{
						printError(2,tree->lineno,opString[tree->attr.op],"NONVOID",expString[VOID],0,0);
						tree->expType = VOID;
					}
					else if(gsym->data[9] == 'b')
						tree->expType = TF;
					else if(gsym->data[9] == 'c')
						tree->expType = SINGLE;
					else
						tree->expType = Unknown;
				break;

				//Not an ID
				case -1:
					//Indicate array
					tree->isArray = 0;

					//Set return type to LHS
					tree->expType = tree->child[0]->expType;

					if(tree->expType == VOID)
						printError(2,tree->lineno,opString[tree->attr.op],"NONVOID",expString[VOID],0,0);
				break;

				//ID not found
				case -2: break;

				//Bad value
				default:
					yyerror("Bad lhs eq/neq idcheck value");
				break;
			}

			//Check RHS ID
			switch(idCheck(tree->child[1], "ARRAY", 1))
			{
				//RHS is array
				case 0:
					if(gsym->data[6] == 'v')
						printError(3,tree->lineno,opString[tree->attr.op],"NONVOID",expString[VOID],0,0);
					else if( (gsym->data[6] == 'i') && (tree->expType != NUMB) )
						printError(4,tree->lineno,opString[tree->attr.op],expString[tree->expType],expString[NUMB],0,0);
					else if( (gsym->data[6] == 'b') && (tree->expType != TF) )
						printError(4,tree->lineno,opString[tree->attr.op],expString[tree->expType],expString[TF],0,0);
					else if( (gsym->data[6] == 'c') && (tree->expType != SINGLE) )
						printError(4,tree->lineno,opString[tree->attr.op],expString[tree->expType],expString[SINGLE],0,0);
					else if( (gsym->data[6] == 'u') && (tree->expType != Unknown) )
						printError(4,tree->lineno,opString[tree->attr.op],expString[tree->expType],expString[Unknown],0,0);

					//Check if also array
					if(tree->isArray != 1)
						printError(19,tree->lineno,opString[tree->attr.op],"","",0,0);
				break;

				//RHS is not an array
				case 1:
					if(gsym->data[0] == 'v')
						printError(3,tree->lineno,opString[tree->attr.op],"NONVOID",expString[VOID],0,0);
					else if( (gsym->data[0] == 'i') && (tree->expType != NUMB) )
						printError(4,tree->lineno,opString[tree->attr.op],expString[tree->expType],expString[NUMB],0,0);
					else if( (gsym->data[0] == 'b') && (tree->expType != TF) )
						printError(4,tree->lineno,opString[tree->attr.op],expString[tree->expType],expString[TF],0,0);
					else if( (gsym->data[0] == 'c') && (tree->expType != SINGLE) )
						printError(4,tree->lineno,opString[tree->attr.op],expString[tree->expType],expString[SINGLE],0,0);
					else if( (gsym->data[0] == 'u') && (tree->expType != Unknown) )
						printError(4,tree->lineno,opString[tree->attr.op],expString[tree->expType],expString[Unknown],0,0);

					//Check if also not array
					if(tree->isArray != 0)
						printError(19,tree->lineno,opString[tree->attr.op],"","",0,0);
				break;

				//RHS is a function
				case 2:
					if(gsym->data[9] == 'v')
						printError(3,tree->lineno,opString[tree->attr.op],"NONVOID",expString[VOID],0,0);
					else if( (gsym->data[9] == 'i') && (tree->expType != NUMB) )
						printError(4,tree->lineno,opString[tree->attr.op],expString[tree->expType],expString[NUMB],0,0);
					else if( (gsym->data[9] == 'b') && (tree->expType != TF) )
						printError(4,tree->lineno,opString[tree->attr.op],expString[tree->expType],expString[TF],0,0);
					else if( (gsym->data[9] == 'c') && (tree->expType != SINGLE) )
						printError(4,tree->lineno,opString[tree->attr.op],expString[tree->expType],expString[SINGLE],0,0);
					else if( (gsym->data[9] == 'u') && (tree->expType != Unknown) )
						printError(4,tree->lineno,opString[tree->attr.op],expString[tree->expType],expString[Unknown],0,0);

					//Check if also not array
					if(tree->isArray != 0)
						printError(19,tree->lineno,opString[tree->attr.op],"","",0,0);
				break;

				//Not an ID
				case -1:
					//Check expType
					if(tree->child[1]->expType == VOID)
						printError(3,tree->lineno,opString[tree->attr.op],"NONVOID",expString[VOID],0,0);
					else if(tree->expType != tree->child[1]->expType)
						printError(4,tree->lineno,opString[tree->attr.op],expString[tree->expType],expString[tree->child[1]->expType],0,0);

					//Check if also not array
					if(tree->isArray != 0)
						printError(19,tree->lineno,opString[tree->attr.op],"","",0,0);
				break;

				//ID not found
				case -2: break;

				//Bad value
				default:
					yyerror("Bad rhs eq/neq idcheck value");
				break;
			}

			//Set TF return type
			tree->expType = TF;
			tree->isArray = 0;
		break;

		/*
		 * Requires BOOL, gives BOOL
		 */
		case BNOT:
			//Check operand ID
			switch(idCheck(tree->child[0], "ARRAY", 1))
			{
				//Operand is an array
				case 0:
					//Check if operand type matches INT
					if(gsym->data[6] != 'b')
						printError(15,tree->lineno,opString[tree->attr.op],expString[TF],gsym->data+6,0,0);

					printError(13,tree->lineno,opString[tree->attr.op],"","",0,0);
				break;

				//Operand is not an array
				case 1:
					//Check if operand type matches INT
					if(gsym->data[0] != 'b')
						printError(15,tree->lineno,opString[tree->attr.op],expString[TF],gsym->data,0,0);
				break;

				//Operand is a function
				case 2:
					//Check if operand type matches INT
					if(gsym->data[9] != 'b')
						printError(15,tree->lineno,opString[tree->attr.op],expString[TF],gsym->data+9,0,0);
				break;

				//Not an ID
				case -1:
					if(tree->child[0]->expType != TF)
						printError(15,tree->lineno,opString[tree->attr.op],expString[TF],expString[tree->child[0]->expType],0,0);
				break;

				//ID not found
				case -2: break;

				//Bad value
				default:
					yyerror("Bad bNOT idcheck value");
				break;
			}

			//Set NUMB return type
			tree->expType = TF;
		break;

		/*
		 * Requires BOOL_BOOL, gives BOOL
		 */
		case BAND:
		case BOR:

			//Check LHS ID
			switch(idCheck(tree->child[0], "ARRAY", 1))
			{
				//LHS is array
				case 0:
					//Check if LHS type matches INT anyways
					if(gsym->data[6] != 'b')
						printError(2,tree->lineno,opString[tree->attr.op],expString[TF],gsym->data+6,0,0);

					//Prep error
					tree->child[0]->isArray = 1;
				break;

				//LHS is not an array
				case 1:
					//Check if LHS type matches INT
					if(gsym->data[0] != 'b')
						printError(2,tree->lineno,opString[tree->attr.op],expString[TF],gsym->data,0,0);
				break;

				//LHS is a function
				case 2:
					//Check if operand type matches INT
					if(gsym->data[9] != 'b')
						printError(2,tree->lineno,opString[tree->attr.op],expString[TF],gsym->data+9,0,0);
				break;

				//Not an ID
				case -1:
					//Check expType
					if(tree->child[0]->expType != TF)
						printError(2,tree->lineno,opString[tree->attr.op],expString[TF],expString[tree->child[0]->expType],0,0);
				break;

				//ID not found
				case -2: break;

				//Bad value
				default:
					yyerror("Bad lhs bAND/bOR idcheck value");
				break;
			}

			//Check RHS ID
			switch(idCheck(tree->child[1], "ARRAY", 1))
			{
				//RHS is array
				case 0:
					//Check if RHS type matches INT anyways
					if(gsym->data[6] != 'b')
						printError(3,tree->lineno,opString[tree->attr.op],expString[TF],gsym->data+6,0,0);

					//Prep error
					tree->child[1]->isArray = 1;
				break;

				//RHS is not an array
				case 1:
					//Check if RHS type matches INT
					if(gsym->data[0] != 'b')
						printError(3,tree->lineno,opString[tree->attr.op],expString[TF],gsym->data,0,0);
				break;

				//RHS is a function
				case 2:
					if(gsym->data[9] != 'b')
						printError(3,tree->lineno,opString[tree->attr.op],expString[TF],gsym->data+9,0,0);
				break;

				//Not an ID
				case -1:
					//Check expType
					if(tree->child[1]->expType != TF)
						printError(3,tree->lineno,opString[tree->attr.op],expString[TF],expString[tree->child[1]->expType],0,0);
				break;

				//ID not found
				case -2: break;

				//Bad value
				default:
					yyerror("Bad rhs bAND/bOR idcheck value");
				break;
			}

			if(tree->child[0]->isArray || tree->child[1]->isArray)
				printError(13,tree->lineno,opString[tree->attr.op],"","",0,0);

			//Set return type
			tree->expType = TF;
		break;

		/*
		 * Requires INT_INT, gives BOOL
		 * or CHAR_CHAR, gives BOOL
		 */
		case LTEQ:
		case LTHAN:
		case GTHANEQ:
		case GTHAN:
			
			//Check LHS ID
			switch(idCheck(tree->child[0], "ARRAY", 1))
			{
				//LHS is array
				case 0:
					//Prep error
					tree->child[0]->isArray = 1;

					//Set node expType to LHS
					if(gsym->data[6] == 'i')
						tree->expType = NUMB;
					else if(gsym->data[6] == 'c')
						tree->expType = SINGLE;
					else
						printError(2,tree->lineno,opString[tree->attr.op],"char or type int",gsym->data+6,0,0);
				break;

				//LHS is not an array
				case 1:
					//Set node expType to LHS
					if(gsym->data[0] == 'i')
						tree->expType = NUMB;
					else if(gsym->data[0] == 'c')
						tree->expType = SINGLE;
					else
						printError(2,tree->lineno,opString[tree->attr.op],"char or type int",gsym->data,0,0);
				break;

				//LHS is a function
				case 2:
					//Set node expType to LHS
					if(gsym->data[9] == 'i')
						tree->expType = NUMB;
					else if(gsym->data[9] == 'c')
						tree->expType = SINGLE;
					else
						printError(2,tree->lineno,opString[tree->attr.op],"char or type int",gsym->data+9,0,0);
				break;

				//Not an ID
				case -1:
					//Set return type to LHS
					if( (tree->child[0]->expType == NUMB) || (tree->child[0]->expType == SINGLE) )
						tree->expType = tree->child[0]->expType;
					else
						printError(2,tree->lineno,opString[tree->attr.op],"char or type int",expString[tree->child[0]->expType],0,0);
				break;

				//ID not found
				case -2: break;

				//Bad value
				default:
					yyerror("Bad lhs >< idcheck value");
				break;
			}

			//Check RHS ID
			switch(idCheck(tree->child[1], "ARRAY", 1))
			{
				//RHS is array
				case 0:
					if( (gsym->data[6] != 'i') && (gsym->data[6] != 'c') )
						printError(3,tree->lineno,opString[tree->attr.op],"char or type int",gsym->data+6,0,0);
					else if( (gsym->data[6] == 'i') && (tree->expType == SINGLE) )
						printError(4,tree->lineno,opString[tree->attr.op],expString[tree->expType],expString[NUMB],0,0);
					else if( (gsym->data[6] == 'c') && (tree->expType == NUMB) )
						printError(4,tree->lineno,opString[tree->attr.op],expString[tree->expType],expString[SINGLE],0,0);

					//Prep the error
					tree->child[1]->isArray = 1;
				break;

				//RHS is not an array
				case 1:
					if( (gsym->data[0] != 'i') && (gsym->data[0] != 'c') )
						printError(3,tree->lineno,opString[tree->attr.op],"char or type int",gsym->data,0,0);
					else if( (gsym->data[0] == 'i') && (tree->expType == SINGLE) )
						printError(4,tree->lineno,opString[tree->attr.op],expString[tree->expType],expString[NUMB],0,0);
					else if( (gsym->data[0] == 'c') && (tree->expType == NUMB) )
						printError(4,tree->lineno,opString[tree->attr.op],expString[tree->expType],expString[SINGLE],0,0);
				break;

				//RHS is a function
				case 2:
					if( (gsym->data[9] != 'i') && (gsym->data[9] != 'c') )
						printError(3,tree->lineno,opString[tree->attr.op],"char or type int",gsym->data+9,0,0);
					else if( (gsym->data[9] == 'i') && (tree->expType == SINGLE) )
						printError(4,tree->lineno,opString[tree->attr.op],expString[tree->expType],expString[NUMB],0,0);
					else if( (gsym->data[9] == 'c') && (tree->expType == NUMB) )
						printError(4,tree->lineno,opString[tree->attr.op],expString[tree->expType],expString[SINGLE],0,0);
				break;

				//Not an ID
				case -1:
					//Check RHS type
					if( (tree->child[1]->expType == NUMB) || (tree->child[1]->expType == SINGLE) )
					{
						if( (tree->expType == NUMB) || (tree->expType == SINGLE) )
							if(tree->expType != tree->child[1]->expType)
								printError(4,tree->lineno,opString[tree->attr.op],expString[tree->expType],expString[tree->child[1]->expType],0,0);
					}
					else
						printError(3,tree->lineno,opString[tree->attr.op],"char or type int",expString[tree->child[1]->expType],0,0);
				break;

				//ID not found
				case -2: break;

				//Bad value
				default:
					yyerror("Bad rhs >< idcheck value");
				break;
			}

			if(tree->child[0]->isArray || tree->child[1]->isArray)
				printError(13,tree->lineno,opString[tree->attr.op],"","",0,0);

			//Set return type
			tree->expType = TF;
			tree->isArray = 0;
		break;

		//Bad operator
		default:
			yyerror("Unknown op type");
		break;
	}

} //END OP CHECK

/*
 * Check scopes and types of the AST
 *
 * tree - Root node to start typechecking at
 */
void scopeAndType(TreeNode* tree) {

	//Initialize the symbol table
	stable = initST();

	//Type check the tree
	treeTraverse(tree);

	//Check for main in global
	if(findSymbol(stable->head, "main") == NULL)
		printError(0,0,"","","",0,0);

	return;
}

/*
* Travels tree to populate symbol table
*
* tree - Root node to start at
*/
void treeTraverse(TreeNode* tree) {


	//String buffer to combine type strings inside of
	char tempType[25];

	//Temp symbol for searching
	Symbol* search;

	//Temp scope for searching
	Scope* tempScope;

	//Temp tree node for searching
	TreeNode* tempNode = NULL;

	//Flag indicating new compound scope
	int newCompound = 0;

	//Flag indicating operator check required
	int opCheck = 0;

	//Flag indicating TF test check required
	int boolCheck = 0;

	//Flag indicating VAR const init check required
	int VARInitConst = 0;

	//Flag for call checking
	int callCheck = 0;

	//Flag for ret checking
	int retCheck = 0;

	//Flag to indicate repeat FUNC
	int noNewFunc = 0;

	//Check if we exist
	while (tree != NULL)
	{
		//Statement node
		if (tree->nodekind == STMT)
		{
			switch (tree->kind.stmt)
			{
				case IF:
					//Check if TF test provided
					boolCheck = 1;

					//Set all ifs to Void
					tree->expType = VOID;
				break;

				case WHILE:
					//Check if TF test provided
					boolCheck = 2;

					//Indicate entering loop
					insideLoop++;

					//Set all whiles to Void
					tree->expType = VOID;
				break;

				case BREAK:

					if(!insideLoop)
						printError(18,tree->lineno,"","","",0,0);

					//Set all breaks to Void
					tree->expType = VOID;
				break;

				//Return statement
				case RETURN:
					retCheck = 1;
				break;

				//Compound statement
				case COMP:

					//Not the first compound of a function
					if(!firstCmp)
					{
						//Name the new scope
						sprintf(tempType,"%d_COMPOUND",++compcnt);

						//Create the scope
						tempScope = newScope(tempType,tree->lineno);

						//Indicate new scope entry
						newCompound = 1;

						//Clear temp string
						memset(tempType,0,sizeof(tempType));
						tempType[0] = '\0';
					}
					//First compound of a function has no new scope
					else
					{
						firstCmp = 0;
					}

					//Set type to Void
					tree->expType = VOID;
				break;

				//Bad statement
				default:
					yyerror("Unknown Statement");
				break;
			}
		}
		//Expression node
		else if (tree->nodekind == EXP)
		{
			switch (tree->kind.exp)
			{
				//Operational expression
				case OP:

					//Indicate operator presence for later
					opCheck = 1;
				break;

				//Constant expression
				case CONST:

				break;

				/*
				 * ID expression
				 * Either a function/variable/record name
				 */
				case ID:

					//ID followed by ()
					if(tree->isFunc)
					{
						//Check operand ID
						switch(idCheck(tree, "ARRAY", 1))
						{
							//Operand is an array
							case 0:
								//Var as func error
								printError(1,tree->lineno,tree->attr.name,"","",0,0);

								switch(gsym->data[6])
								{
									case 'i':
										tree->expType = NUMB;
									break;

									case 'c':
										tree->expType = SINGLE;
									break;

									case 'b':
										tree->expType = TF;
									break;

									case 'v':
										tree->expType = VOID;
									break;

									case 'u':
										tree->expType = Unknown;
									break;

									default:
										yyerror("Bad call type");
									break;
								}
							break;

							//Operand is not an array
							case 1:
								//Var as func error
								printError(1,tree->lineno,tree->attr.name,"","",0,0);

								switch(gsym->data[0])
								{
									case 'i':
										tree->expType = NUMB;
									break;

									case 'c':
										tree->expType = SINGLE;
									break;

									case 'b':
										tree->expType = TF;
									break;

									case 'v':
										tree->expType = VOID;
									break;

									case 'u':
										tree->expType = Unknown;
									break;

									default:
										yyerror("Bad call type");
									break;
								}
							break;

							//Operand is a function
							case 2:
								switch(gsym->data[9])
								{
									case 'i':
										tree->expType = NUMB;
									break;

									case 'c':
										tree->expType = SINGLE;
									break;

									case 'b':
										tree->expType = TF;
									break;

									case 'v':
										tree->expType = VOID;
									break;

									case 'u':
										tree->expType = Unknown;
									break;

									default:
										yyerror("Bad call type");
									break;
								}

								//Indicate call param check 
								callCheck = 1;
							break;

							//Not an ID
							case -1:
								printError(1,tree->lineno,tree->attr.name,"","",0,0);
							break;

							//ID not found, function not known
							case -2:
								printError(22,tree->lineno,tree->attr.name,"","",0,0);

								tree->expType = Unknown;
							break;

							//Bad value
							default:
								yyerror("Bad function call");
							break;
						}
					}
					//Plain ID
					else
					{
						//Check if symbol exists
						search = stackSearch(tree->attr.name);

						//Symbol was not found
						if(search == NULL)
						{
							printError(12,tree->lineno,tree->attr.name,"","",0,0);
							break;
						}
						else
						{

							//Check found symbol type for function
							if(search->data[0] == 'F')
							{
								printError(10,tree->lineno,tree->attr.name,"","",0,0);

								break;
							}
							else if(search->data[0] == 'A')
								tree->isArray = 1;
						}

						//Currently init for a VAR
						if(varInitCheck)
						{
							//Ensure current init symbol does not match stored parent symbol
							if(strcmp(varInitSym->name,tree->attr.name) == 0)
							{
								printError(12,tree->lineno,tree->attr.name,"","",0,0);

								break;
							}
						}

						//Set var type
						if(search->data[0] == 'A')
							switch(search->data[6])
							{
								case 'i':
									tree->expType = NUMB;
								break;

									case 'c':
									tree->expType = SINGLE;
								break;

								case 'b':
									tree->expType = TF;
								break;

								case 'u':
									tree->expType = Unknown;
								break;

								default:
									yyerror("Bad array type");
								break;
							}
						else if(search->data[0] == 'F')
							switch(search->data[9])
							{
								case 'i':
									tree->expType = NUMB;
								break;

								case 'c':
									tree->expType = SINGLE;
								break;

								case 'b':
									tree->expType = TF;
								break;

								case 'u':
									tree->expType = Unknown;
								break;

								default:
									yyerror("Bad func ID type");
								break;
							}
						else
							switch(search->data[0])
							{
								case 'i':
									tree->expType = NUMB;
								break;

								case 'c':
									tree->expType = SINGLE;
								break;

								case 'b':
									tree->expType = TF;
								break;

								case 'u':
									tree->expType = Unknown;
								break;

								default:
									yyerror("Bad ID type");
								break;
							}
					}
				break;

				//Bad expression
				default:
					yyerror("Unknown Expression");
				break;
			}
		}
		//Declaration node
		else if (tree->nodekind == DECL)
		{
			switch (tree->kind.decl)
			{
				/*
				 * Found a variable declaration
				 * Need to search our current scope to see if it was previously declared
				 * Build our symbol data string using strcpy and strcat
				 */
				case VAR:

					//Init temp string
					strcpy(tempType, "");

					//If an array, store type after
					if(tree->isArray)
						strcat(tempType, "ARRAY ");

					//Check if variable is a custom type
					if(!tree->isRecord)
						switch (tree->expType)
						{
							case VOID:
								strcat(tempType, "void");
							break;

							case NUMB:
								strcat(tempType, "int");
							break;

							case TF:
								strcat(tempType, "bool");
							break;

							case SINGLE:
								strcat(tempType, "char");
							break;

							case Unknown:
								strcat(tempType, "unknown");
							break;

							//Bad expression type
							default:
								yyerror("Unknown var return type");
							break;
						}
					else
					{
						strcat(tempType, "RECORD ");
						strcat(tempType, tree->recType);
					}

					//Check if statically declared
					if(tree->isStatic)
						strcat(tempType, " STATIC");

					//Check if it was previously declared in our scope
					search = findSymbol(stable->current, tree->attr.name);

					//Not found in our scope
					if(search == NULL)
					{
						//Variable declaration does not exist in current scope, need to add it
						Symbol* z = newSymbol(tree->attr.name, tempType, tree->lineno);

						//Insert into current scope
						insertSymbol(stable->current, z);

						//Save name if we are initializing to prevent recursive definition
						if(tree->child[0] != NULL)
						{
							//Indicate need to check child
							varInitCheck = 1;
							//Save reference to parent symbol
							varInitSym = z;

							//Check for constant as well
							VARInitConst = 1;
						}
					}
					//The variable name was previously declared
					else
					{
						printError(11,tree->lineno,tree->attr.name,"","",search->line,0);
					}

					//Build paramter string
					if(paramCheck)
					{
						//Locate function symbol
						search = stackSearch(lastFUNC->attr.name);

						if(search == NULL)
							yyerror("Couldn't find function for paramter typing");

						int end = 0;

						//Find the end of the paramtype string
						while(search->paramType[end] != '\0')
							end++;

						//Catch if too many paramters
						if(end == (MAXPARAMS-1))
							yyerror("Out of param memory!");

						//Move the string null byte
						search->paramType[end+1] = '\0';

						//Store parameter type
						if(!tree->isRecord)
							switch (tree->expType)
							{
								case VOID:
									if(tree->isArray)
										search->paramType[end] = 'V';
									else
										search->paramType[end] = 'v';
								break;

								case NUMB:
									if(tree->isArray)
										search->paramType[end] = 'I';
									else
										search->paramType[end] = 'i';
								break;

								case TF:
									if(tree->isArray)
										search->paramType[end] = 'B';
									else
										search->paramType[end] = 'b';
								break;

								case SINGLE:
									if(tree->isArray)
										search->paramType[end] = 'C';
									else
										search->paramType[end] = 'c';
								break;

								case Unknown:
									if(tree->isArray)
										search->paramType[end] = 'U';
									else
										search->paramType[end] = 'u';
								break;

								//Bad expression type
								default:
									yyerror("Unknown paramter scanned type");
								break;
							}
						else
						{
							//Record param?
							search->paramType[end] = 'R';
						}
					}
				break;

				//Function declaration
				case FUNC:

					//Save this as the last FUNC found
					lastFUNC = tree;

					//Build the function symbol data string
					strcpy(tempType, "FUNCTION ");

					switch (tree->expType)
					{
						case VOID:
							strcat(tempType, "void");

							//Indicate a check for void return
							funcRetType = 0;
						break;

						case NUMB:
							strcat(tempType, "int");

							//Indicate a check for int return
							funcRetType = 1;
						break;

						case TF:
							strcat(tempType, "bool");

							//Indicate a check for bool return
							funcRetType = 2;
						break;

						case SINGLE:
							strcat(tempType, "char");

							//Indicate a check for char return
							funcRetType = 3;
						break;

						//Bad function type
						default:
							yyerror("Unknown function return type");
						break;
					}

					//Set compound type if it exists
					if(tree->child[1] != NULL)
						tree->child[1]->expType = VOID;

					//Check if it was previously declared in global scope
					search = findSymbol(stable->head, tree->attr.name);

					if(search == NULL)
					{
						//Function declaration does not exist in current scope, need to add it
						Symbol* z = newSymbol(tree->attr.name, tempType, tree->lineno);

						//Add to current scope
						insertSymbol(stable->current, z);
					}
					//The variable name was previously declared
					else
					{
						printError(11,tree->lineno,tree->attr.name,"","",search->line,0);

						//Prevent editing the param list
						noNewFunc = 1;
					}

					/*
					 * Create a new scope for the parameters and compound statement
					 */
					//Name the new scope
					sprintf(tempType,"%d_COMPOUND",++compcnt);

					//Create the scope
					tempScope = newScope(tempType,tree->lineno);

					//Indicate new scope entry
					newCompound = 1;

					//Clear temp string
					memset(tempType,0,sizeof(tempType));
					tempType[0] = '\0';

					if(tree->child[1] != NULL)
						//Indicate no scope change for the coming compound statement
						firstCmp = 1;
				break;

				//Record
				case REC:

					//Build the record symbol data string
					strcpy(tempType, "RECORD");

					//Check if it was previously declared in our scope
					search = findSymbol(stable->current, tree->attr.name);

					//Not found in our scope
					if(search == NULL)
					{
						//Variable declaration does not exist in current scope, need to add it
						Symbol* z = newSymbol(tree->attr.name, tempType, tree->lineno);

						//Insert into current scope
						insertSymbol(stable->current,z);
					}
					//The variable name was previously declared
					else
						printError(11,tree->lineno,tree->attr.name,"","",search->line,0);
				break;

				//Bad declaration
				default:
					yyerror("Unknown Declaration");
				break;
			}

			//Clear temp string
			memset(tempType,0,sizeof(tempType));
			tempType[0] = '\0';
		}
		//Bad tree node
		else
			yyerror("Unknown node");

		//If children exist traverse the child trees
		for (int i = 0; i < MAXCHILDREN; i++)
		{
			if(tree->child[i] != NULL)
			{
				//Indicate a parameter check if currently in a function
				if((i == 0) && (tree->nodekind == DECL) && (tree->kind.decl == FUNC) && (!noNewFunc))
					paramCheck = 1;					

				//Check child only if it exists
				treeTraverse(tree->child[i]);

				//Reset flag
				paramCheck = 0;
				noNewFunc = 0;
			}
		}

		/*
		 * Check if FUNC was found and children are done
		 * If so, check for correct return
		 *
		 * void = 0
		 * int = 1
		 * bool = 2
		 * char = 3
		 */
		if( (funcRetType > -1) && (tree->nodekind == DECL) && (tree->kind.decl == FUNC) )
		{
			/*
			 * Check for lack of return statement
			 * Function declares a nonvoid type
			 * No return statement is found
			 */
			if( (funcRetType > 0) && (retType < 0) && (tree->lineno != -1))
				printWarning(1,tree->lineno,expString[funcRetType],tree->attr.name,"",0);

			//Reset flags
			funcRetType = -1;
			retType = -1;
			lastFUNC = NULL;

		}

		/*
		 * Check if VAR init is constant expression
		 * Checking for variable redefinition is already done
		 * At this point the flag has been set and VAR children
		 * have completed, allowing for type-checking for const
		*/
		if(VARInitConst)
		{
			//Check if init is actually an array
			switch(idCheck(tree->child[0], "ARRAY", 1))
			{
				//Init is an array
				case 0:
				
				//Init is not an array
				case 1:

				//Init is a function
				case 2:
					printError(20,tree->lineno,tree->attr.name,"","",0,0);
				break;

				//Init is not an ID
				case -1:
					//Typecheck init
					if( (tree->child[0]->expType != tree->expType) )
						printError(21,tree->lineno,tree->attr.name,expString[tree->expType],expString[tree->child[0]->expType],0,0);

					if((tree->child[0]->attr.op == ASTERISK) && (tree->child[0]->child[1] == NULL) )
						printError(20,tree->lineno,tree->attr.name,"","",0,0);
				break;

				//Init ID not found
				case -2: break;

				//Bad value
				default:
					yyerror("Bad VAR init idcheck value");
				break;
			}

			//Reset flag
			VARInitConst = 0;
		}

		//Reset variable init flag since children are done
		varInitCheck = 0;

		/*
		 * At this point child nodes have been traversed
		 * So their types should be known
		 * We can now perform type checking of children
		 */
		if(opCheck)
		{
			//Reset flag
			opCheck = 0;

			//Typecheck the operator
			operatorCheck(tree);
		}

		//Finished child types, check call parameters
		if(callCheck)
		{
			//Retrieve function symbol
			search = stackSearch(tree->attr.name);

			if(search == NULL)
				yyerror("Couldn't find function for call");

			//Temp string for holding the call params
			char cparams[MAXPARAMS];
			cparams[0] = '\0';

			int end = 0;

			//Parse through children and build string
			if(tree->child[0] != NULL)
			{
				tempNode = tree->child[0];

				do
				{
					//Find the end of the paramtype string
					while(cparams[end] != '\0')
						end++;

					//Catch if too many paramters
					if(end == (MAXPARAMS-1))
						yyerror("Out of call param memory!");

					//Move the string null byte
					cparams[end+1] = '\0';

					//Store param type
					switch(idCheck(tempNode, "ARRAY", 1))
					{
						//Param is an array
						case 0:
							cparams[end] = (char)((int)gsym->data[6] - 32);
						break;

						//Param is not an array
						case 1:
							cparams[end] = gsym->data[0];
						break;

						//Param is a function
						case 2:
							cparams[end] = gsym->data[9];
						break;

						//Not an ID
						case -1:
							if(tempNode->expType == NUMB)
								cparams[end] = 'i';
							else if(tempNode->expType == TF)
								cparams[end] = 'b';
							else if(tempNode->expType == SINGLE)
								cparams[end] = 'c';
							else if(tempNode->expType == Unknown)
								cparams[end] = 'u';
							else if(tempNode->expType == VOID)
								cparams[end] = 'v';
							else
								yyerror("Bad param call type");
						break;

						//ID not found
						case -2:
							if(tempNode->isArray)
								cparams[end] = 'U';
							else
								cparams[end] = 'u';
						break;

						//Bad value
						default:
							yyerror("Bad param type");
						break;
					}

					//Check next param
					tempNode = tempNode->sibling;

				}while(tempNode != NULL);
			}

			//Compare params
			for(int i = 0; (i < (int)strlen(cparams)) && (i < (int)strlen(search->paramType)); i++)
			{
				//Params don't match
				if( (cparams[i] != search->paramType[i]) && (cparams[i] != search->paramType[i]+32) && (cparams[i] != search->paramType[i]-32) && (cparams[i] != 'u') && (cparams[i] != 'U'))
					printError(28,tree->lineno,expString[typeCharToInt(search->paramType[i])],search->name,expString[typeCharToInt(cparams[i])],i+1,search->line);

				//Called with array, array unexpected
				if( (cparams[i] <= (int)'Z') && (search->paramType[i] >= (int)'a') )
					printError(30,tree->lineno,search->name,"","",i+1,search->line);
				//Called with no array, array expected
				else if( (cparams[i] >= (int)'a') && (search->paramType[i] <= (int)'Z') )
					printError(29,tree->lineno,search->name,"","",i+1,search->line);
			}

			//Too few params
			if((int)strlen(search->paramType) > (int)strlen(cparams))
				printError(26,tree->lineno,search->name,"","",search->line,0);
			//Too many params
			else if((int)strlen(search->paramType) < (int)strlen(cparams))
				printError(27,tree->lineno,search->name,"","",search->line,0);

			//Reset flag
			callCheck = 0;
		}

		//Return stmt check after children finish
		if(retCheck)
		{
			//Empty RETURN returning VOID
			if(tree->child[0] == NULL)
			{
				tree->expType = VOID;
				retType = 0;

				//Void ret but function wants to return
				if((funcRetType > 0) && (lastFUNC != NULL))
					printError(25,tree->lineno,lastFUNC->attr.name,expString[lastFUNC->expType],"",lastFUNC->lineno,0);
			}
			else
			{
				//Check return type
				switch(idCheck(tree->child[0], "ARRAY", 1))
				{
					//Array return
					case 0:
						//Set return type
						if(gsym->data[6] == 'i')
						{
							tree->expType = NUMB;
							retType = 1;
						}
						else if(gsym->data[6] == 'v')
						{
							tree->expType = VOID;
							retType = 0;

							//Void ret but function wants to return
							if((funcRetType > 0) && (lastFUNC != NULL))
								printError(25,tree->lineno,lastFUNC->attr.name,expString[lastFUNC->expType],"",lastFUNC->lineno,0);
						}
						else if(gsym->data[6] == 'b')
						{
							tree->expType = TF;
							retType = 2;
						}
						else if(gsym->data[6] == 'c')
						{
							tree->expType = SINGLE;
							retType = 3;
						}
						else
						{
							tree->expType = Unknown;
							retType = 4;
						}

						//Returning, but no return needed
						if((funcRetType < 1) && (lastFUNC != NULL) && (retType != 0))
							printError(23,tree->lineno,lastFUNC->attr.name,"","",lastFUNC->lineno,0);
						//Mismatched return
						else if((funcRetType != retType) && (lastFUNC != NULL) && (retType != 0) && (funcRetType > 0))
							printError(24,tree->lineno,lastFUNC->attr.name,expString[lastFUNC->expType],expString[retType],lastFUNC->lineno,0);

						//Return array error
						printError(9,tree->lineno,"","","",0,0);
					break;

					//Non-array return
					case 1:
						//Set return type
						if(gsym->data[0] == 'i')
						{
							tree->expType = NUMB;
							retType = 1;
						}
						else if(gsym->data[0] == 'v')
						{
							tree->expType = VOID;
							retType = 0;

							//Void ret but function wants to return
							if((funcRetType > 0) && (lastFUNC != NULL))
								printError(25,tree->lineno,lastFUNC->attr.name,expString[lastFUNC->expType],"",lastFUNC->lineno,0);
						}
						else if(gsym->data[0] == 'b')
						{
							tree->expType = TF;
							retType = 2;
						}
						else if(gsym->data[0] == 'c')
						{
							tree->expType = SINGLE;
							retType = 3;
						}
						else
						{
							tree->expType = Unknown;
							retType = 4;
						}

						//Returning, but no return needed
						if((funcRetType < 1) && (lastFUNC != NULL) && (retType != 0))
							printError(23,tree->lineno,lastFUNC->attr.name,"","",lastFUNC->lineno,0);
						//Mismatched return
						else if((funcRetType != retType) && (lastFUNC != NULL) && (retType != 0) && (funcRetType > 0))
							printError(24,tree->lineno,lastFUNC->attr.name,expString[lastFUNC->expType],expString[retType],lastFUNC->lineno,0);
					break;

					//Function return
					case 2:
						//Set return type
						if(gsym->data[9] == 'i')
						{
							tree->expType = NUMB;
							retType = 1;
						}
						else if(gsym->data[9] == 'v')
						{
							tree->expType = VOID;
							retType = 0;

							//Void ret but function wants to return
							if((funcRetType > 0) && (lastFUNC != NULL))
								printError(24,tree->lineno,lastFUNC->attr.name,expString[lastFUNC->expType],expString[retType],lastFUNC->lineno,0);
						}
						else if(gsym->data[9] == 'b')
						{
							tree->expType = TF;
							retType = 2;
						}
						else if(gsym->data[9] == 'c')
						{
							tree->expType = SINGLE;
							retType = 3;
						}
						else
						{
							tree->expType = Unknown;
							retType = 4;
						}

						//Returning, but no return needed
						if((funcRetType < 1) && (lastFUNC != NULL) && (retType != 0))
							printError(23,tree->lineno,lastFUNC->attr.name,"","",lastFUNC->lineno,0);
						//Mismatched return
						else if((funcRetType != retType) && (lastFUNC != NULL) && (retType != 0) && (funcRetType > 0))
							printError(24,tree->lineno,lastFUNC->attr.name,expString[lastFUNC->expType],expString[retType],lastFUNC->lineno,0);
					break;

					//Non-id return
					case -1:
						tree->expType = tree->child[0]->expType;
						retType = tree->child[0]->expType;

						//Void ret but function wants to return
						if((funcRetType > 0) && (lastFUNC != NULL) && (retType == 0))
							printError(25,tree->lineno,lastFUNC->attr.name,expString[lastFUNC->expType],"",lastFUNC->lineno,0);
						//Returning, but no return needed
						else if((funcRetType < 1) && (lastFUNC != NULL) && (retType != 0))
							printError(23,tree->lineno,lastFUNC->attr.name,"","",lastFUNC->lineno,0);
						//Mismatched return
						else if((funcRetType != retType) && (lastFUNC != NULL) && (retType != 0) && (funcRetType > 0))
							printError(24,tree->lineno,lastFUNC->attr.name,expString[lastFUNC->expType],expString[retType],lastFUNC->lineno,0);
					break;

					//ID not found
					case -2:
						tree->expType = Unknown;
						retType = 4;
					break;

					default:
						yyerror("Bad return value");
					break;
				}
			}
			//Reset flag
			retCheck = 0;

			//Set all returns to Void
			tree->expType = VOID;
		}

		/*
		 * Type check TF test for If/While
		 *
		 * 1 -> IF
		 * 2 -> While
		 */
		if(boolCheck)
		{
			//Reset loop flag if end of loop
			if( (tree->nodekind == STMT) && (tree->kind.stmt == WHILE) )
				if(insideLoop > 0)
					insideLoop--;
				else
					yyerror("Lost count of nested loops");

			//Check if bool is actually an array
			switch(idCheck(tree->child[0], "ARRAY", 1))
			{
				//Test is an array
				case 0:
					//Check if type matches BOOL
					if(gsym->data[6] != 'b')
					{
						if(boolCheck == 1)
							printError(16,tree->lineno,"if",gsym->data+6,"",0,0);
						else if(boolCheck == 2)
							printError(16,tree->lineno,"while",gsym->data+6,"",0,0);
					}

					if(boolCheck == 1)
						printError(17,tree->lineno,"if","","",0,0);
					else if(boolCheck == 2)
						printError(17,tree->lineno,"while","","",0,0);
				break;

				//Test is not an array
				case 1:
					//Check if type matches BOOL
					if(gsym->data[0] != 'b')
					{
						if(boolCheck == 1)
							printError(16,tree->lineno,"if",gsym->data,"",0,0);
						else if(boolCheck == 2)
							printError(16,tree->lineno,"while",gsym->data,"",0,0);
					}
				break;

				//Test is a function
				case 2:
					//Check if type matches BOOL
					if(gsym->data[9] != 'b')
					{
						if(boolCheck == 1)
							printError(16,tree->lineno,"if",gsym->data+9,"",0,0);
						else if(boolCheck == 2)
							printError(16,tree->lineno,"while",gsym->data+9,"",0,0);
					}
				break;

				//Test is not an ID
				case -1:
					//Check if TF test type was provided
					if(tree->child[0]->expType != TF)
					{
						if(boolCheck == 1)
							printError(16,tree->lineno,"if",expString[tree->child[0]->expType],"",0,0);
						else if(boolCheck == 2)
							printError(16,tree->lineno,"while",expString[tree->child[0]->expType],"",0,0);
					}
				break;

				//Test ID not found
				case -2: break;

				//Bad value
				default:
					yyerror("Bad bool test idcheck value");
				break;
			}

			//Reset flag
			boolCheck = 0;
		}

		//If in a compound scope, children have finished, so leave
		if(newCompound)
		{
			//Reset flag
			newCompound = 0;

			//Ensure global scope is not exited
			if(stable->current->parent != NULL)
			{
				stable->current = stable->current->parent;
				stable->depth--;
			}
		}

		//Point to the next node in the AST
		tree = tree->sibling;
	}
	//END WHILE

	return;
}
//END treeTraverse
