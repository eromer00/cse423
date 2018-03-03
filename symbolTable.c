#include "symbolTable.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

SymbolTable *initST() {
    SymbolTable *st = malloc(sizeof(SymbolTable));
    
    st->depth = 0;

    Scope *global = malloc(sizeof(Scope));

    global->name = 0;
    global->firstSym = NULL;
    global->lastSym = NULL;
    global->parent = NULL;
    global->next = NULL;
    
    st->current = global;
    st->head = global;
    st->tail = global;
    
    scopeNum = 1;

    return st;
}

Scope *newScope(int name, int lineno) {
    Scope *sc = malloc(sizeof(Scope));
    sc->name = name;
    sc->firstSym = NULL;
    sc->lastSym = NULL;

    sc->parent = symtable->current;
    symtable->current = sc;

    symtable->depth++;
    symtable->tail->next = sc;
    sc->parent = symtable->tail;
    symtable->tail = sc;

    
    sc->next = NULL;
    scopeNum++;
    return sc;
}

Map *newMap(char *str, void *val, int lineno) {
    Map *m = malloc(sizeof(Map));

    m->str = strdup(str);
    m->val = val;
    m->lineno = lineno;
    m->next = NULL;
    return m;
}


void insertSymbol(Scope *sc, Map *m) {
    if(sc->firstSym == NULL) sc->firstSym = m;
    if(sc->lastSym == NULL) { sc->lastSym = m; }
    else {
        sc->lastSym->next = m;
        sc->lastSym = m;
    }
}

Map *findSymbol(Scope *sc, char *str) {
    Map *x = sc->firstSym;
    while(x != NULL) {
        if(strcmp(x->str, str) == 0) return x;
        else x = x->next;
    }
    return NULL;
}

Map *stackSearch(char *str) {
    Map *m = NULL;
    Scope *sc = symtable->current;

    while(sc != NULL) {
        m = findSymbol(sc, str);
        if(m == NULL) sc = sc->parent;
        else break;
    }
    return m;
}

void printSymbolTable() {
    printf("Symbol Table: Depth = %d, Scope = %d\n\n", symtable->depth, symtable->current->name);

    Scope *x = symtable->head;
    while(x != NULL) {
        printScope(x);
        x = x->next;
    }
}

void printScope(Scope *sc) {
    if(sc->parent != NULL) printf("Scope %d is a child scope of %d\n", sc->name, sc->parent->name);
    else printf("Scope %d is the global scope\n", sc->name);

    Map *x = sc->firstSym;

    while(x != NULL) {
        printSymbol(x);
        x = x->next;
    }
}

void printSymbol(Map *x) {
    printf("\tSymbol %s on line %d\n", x->str, x->lineno);
}

/*
* Travels tree to populate symbol table
*
* tree - Root node to start at
*/
int firstCmp = 0;
void treeTraverse(TreeNode* tree) {

    int asdf = 0;

    int varInitCheck = 0;
    int varInitSym = 0;
    TreeNode *lastFunDec = NULL;
    int paramCheck = 0;
	//String buffer to combine type strings inside of
	char tempType[25];

	//Temp symbol for searching
	Map* search;

	//Temp scope for searching
	Scope* tempScope = symtable->current;

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

    //int firstCmp = 0;

	//Check if we exist
	while (tree != NULL)
	{
		//Statement node
		if (tree->nodekind == STMT)
		{
			switch (tree->kind.stmt)
			{
				case IF:
					//Check if boolean test provided
					boolCheck = 1;

					//Set all ifs to Void
                    tree->expType = VOID;
                    printf("'IF'\n");
				    break;
				case WHILE:
					//Check if boolean test provided
					boolCheck = 2;

					//Indicate entering loop
					//++;

					//Set all whiles to Void
                    tree->expType = VOID;
                    printf("'WHILE'\n");
				    break;
				case BREAK:
					//Set all breaks to Void
					tree->expType = VOID;
                    printf("'BREAK'\n");
				    break;
				//Return statement
				case RETURN:
					retCheck = 1;
                    printf("'RETURN'\n");
				    break;
				//Compound statement
				case COMP:

					//Not the first compound of a function
					if(!firstCmp)
					{
						//Name the new scope
    
						//Create the scope
                        tempScope = newScope(scopeNum, tree->lineno);
						//Indicate new scope entry
						newCompound = 1;

						//Clear temp string
						
					}
					//First compound of a function has no new scope
					else
					{
						firstCmp = 0;
					}
                    printf("'COMPOUND'\n");
					//Set type to Void
                    tree->expType = VOID;
				    break;
				//Bad statement
				default:
					//yyerror("Unknown Statement");
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
                    printf("'Operator'\n");
				    break;
				//Constant expression
				case CONST:
                    printf("'Constant'\n");
				    break;
				/*
				 * ID expression
				 * Either a function/variable/record name
				 */
				case ID:
					//ID followed by ()
					if(tree->isFunc) {
						//Check operand ID
					}
					//Plain ID
					else {
						//Check if symbol exists

						//Symbol was not found
						if(asdf == 0)
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
                    printf("'ID'\n");
				    break;

				//Bad expression
				default:
					//yyerror("Unknown Expression");
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

					//Check if it was previously declared in our scope
                    search = findSymbol(tempScope, tree->attr.name);
                    asdf = (search != NULL) ? 1 : 0;
					//Not found in our scope
					if(asdf == 0)
					{
						//Variable declaration does not exist in current scope, need to add it
                        search = newMap(tree->attr.name, (void *) tree->child[0], tree->lineno);
                        
						//Insert into current scope
                        insertSymbol(tempScope, search);
                        
						//Save name if we are initializing to prevent recursive definition
						if(tree->child[0] != NULL)
						{
							//Indicate need to check child
							varInitCheck = 1;
							//Save reference to parent symbol
							varInitSym = 1;
							//Check for constant as well
							varDecInitConst = 1;
						}
					}
					//The variable name was previously declared
					else
					{
					printf("DECLARED VAR\n");
					}
                    printf("'VAR'\n");
				    break;
				//Function declaration
				case FUNC:

					//Save this as the last fundec found
					lastFunDec = tree;

					//Build the function symbol data string
					//TODO
					//Set compound type if it exists
					if(tree->child[1] != NULL)
						tree->child[1]->expType = VOID;

					//Check if it was previously declared in global scope
                    search = findSymbol(tempScope, tree->attr.name);
                    asdf = (search != NULL) ? 1 : 0;
                    
					if(asdf == 0)
					{
						//Function declaration does not exist in current scope, need to add it
                        search = newMap(tree->attr.name, (void *) tree->child[0], tree->lineno);
                        
						//Insert into current scope
                        insertSymbol(tempScope, search);
					}
					//The variable name was previously declared
					else
					{
					printf("DECLARED FUNCTION\n");
					}

					/*
					 * Create a new scope for the parameters and compound statement
					 */
					//Name the new scope
                    tempScope = newScope(scopeNum, tree->lineno);
					//Create the scope
                    
					//Indicate new scope entry
					newCompound = 1;

					//Clear temp string

					if(tree->child[1] != NULL)
						//Indicate no scope change for the coming compound statement
						firstCmp = 1;
                    printf("'FUNC'\n");
				    break;
				//Record
				case REC:

					//Build the record symbol data string

					//Check if it was previously declared in our scope
                    search = findSymbol(tempScope, tree->attr.name);
                    asdf = (search != NULL) ? 1 : 0;
					//Not found in our scope
					if(asdf == 0)
					{
						//Variable declaration does not exist in current scope, need to add it
                        search = newMap(tree->attr.name, (void *) tree->child[0], tree->lineno);
                        
						//Insert into current scope
                        insertSymbol(tempScope, search);
					}
					//The variable name was previously declared
					else {printf("DECLARED RECORD!\n");}
                    printf("'RECORD'\n");
                    break;

				//Bad declaration
				default:
					//yyerror("Unknown Declaration");
				    break;
			}

			//Clear temp string
		}
		//Bad tree node
		else
			printf("Unknown node\n");

		//If children exist traverse the child trees
		for (int i = 0; i < MAXCHILDREN; i++)
		{
			if(tree->child[i] != NULL)
			{
				//Check child only if it exists
                printf("!!!!");

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
			//operatorCheck(tree);
		}

		//If in a compound scope, children have finished, so leave
		if(newCompound)
		{
			//Reset flag
			newCompound = 0;

			//Ensure global scope is not exited
			if(symtable->current->parent != NULL)
			{
				symtable->current = symtable->current->parent;
				symtable->depth--;
			}
		}

		//Point to the next node in the AST
		tree = tree->sibling;
	}
	return;
}

