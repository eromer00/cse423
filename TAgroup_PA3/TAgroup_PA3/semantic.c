/**
 *
 * @date Spring 2018
 * @author Omar Soliman
 * @title Typecheck functions
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
static SymbolTable* ;

/*
 * Compound statement counter
 * Used to name scopes
 */

/*
 * Flag indicating first compound of function
 * Global so the child can recognize itself
 */

//Flag counter indicating typing inside a loop

//Global symbol pointer

//Variable init flag

//Variable init temp symbol pointer

//Variable return type holder

//Flag to check for function return

//Variable to hold last fundec

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
 * Integer |1
 * Boolean |2
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

//////////////////////////////

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
	 * scope names should always start with a digit
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
 * i1 - First integer
 */
void printWarning(int warnum, int line, char* s1, char* s2, char* s3, int i1) {

	//Print error header
	printf("WARNING(%d): ",line);

	//Display the correct error message
	switch(warnum)
	{
		case 1:

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
 * i1 - First integer
 * i2 - Second integer
 */
void printError(int errnum, int line, char* s1, char* s2, char* s3, int i1, int i2) {

//maybe a switch?


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
		case dassign:
		case massign:
		case sassign:
		case passign:
		case mod:
		case fslash:
		case plus:


		break;

		/*
		 * Requires SAME_SAME, gives LHS
		 */
		case assign:

		break;

		/*
		 * Requires RECORD_MEMBER, gives RHS
		 */
		case period:
		break;

		/*
		 * Requires ARRAY_INT, gives LHS
		 */
		case lsb:
		break;

		/*
		 * Check if negation or subtraction
		 * Sub - Requires INT_INT, gives INT
		 * Neg - Requires INT, gives INT
		 */
		case dash:
		break;

		/*
		 * Check if sizing or multiplication
		 * Mult - Requires INT_INT, gives INT
		 * Size - Requires ARRAY, gives INT
		 */
		case asterisk:
		break;

		/*
		 * Requires INT, gives INT
		 * Or ARRAY, gives ARRAY[?SIZEOF]
		 */
		case qmark:
		break;

		/*
		 * Requires INT, gives INT
		 */
		case pplus:
		case ddash:
		break;

		/*
		 * Requires SAME_SAME, gives BOOL
		 */
		case eqeq:
		case neq:
		break;

		/*
		 * Requires BOOL, gives BOOL
		 */
		case bNOT:
		break;

		/*
		 * Requires BOOL_BOOL, gives BOOL
		 */
		case bAND:
		case bOR:
		break;

		/*
		 * Requires INT_INT, gives BOOL
		 * or CHAR_CHAR, gives BOOL
		 */
		case lteq:
		case lthan:
		case gteq:
		case gthan:
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

	//Flag indicating boolean test check required
	int boolCheck = 0;

	//Flag indicating vardec const init check required
	int varDecInitConst = 0;

	//Flag for call checking
	int callCheck = 0;

	//Flag for ret checking
	int retCheck = 0;

	//Flag to indicate repeat fundec
	int noNewFunc = 0;

	//Check if we exist
	while (tree != NULL)
	{
		//Statement node
		if (tree->nodekind == StmtK)
		{
			switch (tree->kind.stmt)
			{
				case IfK:
					//Check if boolean test provided
					boolCheck = 1;

					//Set all ifs to Void
				break;

				case RepeatK:
					//Check if boolean test provided
					boolCheck = 2;

					//Indicate entering loop
					++;

					//Set all whiles to Void
				break;

				case BreakK:

					//Set all breaks to Void
					tree->expType = Void;
				break;

				//Return statement
				case ReturnK:
					retCheck = 1;
				break;

				//Compound statement
				case CompoundK:

					//Not the first compound of a function
					if(!firstCmp)
					{
						//Name the new scope

						//Create the scope

						//Indicate new scope entry
						newCompound = 1;

						//Clear temp string
						
					}
					//First compound of a function has no new scope
					else
					{
						firstCmp = 0;
					}

					//Set type to Void
				break;

				//Bad statement
				default:
					yyerror("Unknown Statement");
				break;
			}
		}
		//Expression node
		else if (tree->nodekind == ExpK)
		{
			switch (tree->kind.exp)
			{
				//Operational expression
				case OpK:

					//Indicate operator presence for later
					opCheck = 1;
				break;

				//Constant expression
				case ConstK:

				break;

				/*
				 * ID expression
				 * Either a function/variable/record name
				 */
				case IdK:

					//ID followed by ()
					if(tree->isFunc)
					{
						//Check operand ID
						
					}
					//Plain ID
					else
					{
						//Check if symbol exists

						//Symbol was not found
						if()
						{}
						else
						{
						}

						//Currently init for a vardec
						if(varInitCheck)
						{
							//Ensure current init symbol does not match stored parent symbol
						}

						//Set var type
					}
				break;

				//Bad expression
				default:
					yyerror("Unknown Expression");
				break;
			}
		}
		//Declaration node
		else if (tree->nodekind == DeclK)
		{
			switch (tree->kind.decl)
			{
				/*
				 * Found a variable declaration
				 * Need to search our current scope to see if it was previously declared
				 * Build our symbol data string using strcpy and strcat
				 */
				case varDec:

					//Check if it was previously declared in our scope

					//Not found in our scope
					if()
					{
						//Variable declaration does not exist in current scope, need to add it

						//Insert into current scope

						//Save name if we are initializing to prevent recursive definition
						if(tree->child[0] != NULL)
						{
							//Indicate need to check child
							varInitCheck = 1;
							//Save reference to parent symbol
							varInitSym = z;
							//Check for constant as well
							varDecInitConst = 1;
						}
					}
					//The variable name was previously declared
					else
					{
					}
				break;

				//Function declaration
				case funDec:

					//Save this as the last fundec found
					lastFunDec = tree;

					//Build the function symbol data string
					
					//Set compound type if it exists
					if(tree->child[1] != NULL)
						tree->child[1]->expType = Void;

					//Check if it was previously declared in global scope

					if()
					{
						//Function declaration does not exist in current scope, need to add it

						//Add to current scope
					}
					//The variable name was previously declared
					else
					{
					}

					/*
					 * Create a new scope for the parameters and compound statement
					 */
					//Name the new scope

					//Create the scope

					//Indicate new scope entry
					newCompound = 1;

					//Clear temp string

					if(tree->child[1] != NULL)
						//Indicate no scope change for the coming compound statement
						firstCmp = 1;
				break;

				//Record
				case recDec:

					//Build the record symbol data string

					//Check if it was previously declared in our scope

					//Not found in our scope
					if()
					{
						//Variable declaration does not exist in current scope, need to add it

						//Insert into current scope
					}
					//The variable name was previously declared
					else

				break;

				//Bad declaration
				default:
					yyerror("Unknown Declaration");
				break;
			}

			//Clear temp string
		}
		//Bad tree node
		else
			yyerror("Unknown node");

		//If children exist traverse the child trees
		for (int i = 0; i < MAXCHILDREN; i++)
		{
			if(tree->child[i] != NULL)
			{
				//Check child only if it exists
				treeTraverse(tree->child[i]);

				//Reset flag
				paramCheck = 0;
				noNewFunc = 0;
			}
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
