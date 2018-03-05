#include "semantics.h"
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
				    break;
				case WHILE:
					//Check if boolean test provided
					boolCheck = 2;
					//Set all whiles to Void
                    tree->expType = VOID;
				    break;
				case BREAK:
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
					if(tree->isFunc) {
						//Check operand ID
                        printErrorMessage(tree->lineno, 0, tree->attr.name, NULL, NULL, 9);
					}
					//Plain ID
					else {
						//Check if symbol exists
                        search = findSymbol(tempScope, tree->attr.name);
                        asdf = (search != NULL) ? 1 : 0;
						//Symbol was not found
						if(asdf == 0)
						{
                            printErrorMessage(tree->lineno, 0, tree->attr.name, NULL, NULL, 11); 
                        }
						else
						{
						}

						//Currently init for a vardec
						if(varInitCheck)
						{
							//Ensure current init symbol does not match stored parent symbol
                            printErrorMessage(tree->lineno, 0, tree->attr.name, NULL, NULL, 0);
						}

						//Set var type
					}
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
                        printErrorMessage(tree->lineno, search->lineno, tree->attr.name, NULL, NULL, 10);
					}
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
					else {
                        printErrorMessage(tree->lineno, search->lineno, tree->attr.name, NULL, NULL, 10);
                    }
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

        //printf("line[%d]: {%s %d %d %d}\n", tree->lineno, tree->attr.name, tree->attr.op, tree->attr.value, tree->isArray);


		//If children exist traverse the child trees
		for (int i = 0; i < MAXCHILDREN; i++)
		{
			if(tree->child[i] != NULL)
			{
                //printf("|___");
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

/*  Prints error messages as tree is traversed, follows pdf for switch order
 *  ex - 0 means simple var, 14 is a poor unary typing
 *  values may be null (aside from lineno and err)
 */
void printErrorMessage(int lineno, int lineno2, char *str1, char *str2, char *str3, int err) {
    switch(err) {
    case 0:
        printf("ERROR(%d): '%s' is a simple variable and cannot be called.\n", lineno, str1);
        break;
    case 1:
        printf("ERROR(%d): '%s' requires operands of %s but lhs is of %s.\n", lineno, str1, str2, str3);
        break;
    case 2:
        printf("ERROR(%d): '%s' requires operands of %s but rhs is of %s.\n", lineno, str1, str2, str3);
        break;
    case 3:
        printf("ERROR(%d): '%s' requires operands of the same type but lhs is %s and rhs is %s.\n", lineno, str1, str2, str3);
        break;
    case 4:
        printf("ERROR(%d): Array '%s' should be indexed by type int but got %s.\n", lineno, str1, str2);
        break;
    case 5:
        printf("ERROR(%d): Array index is the unindexed array '%s'.\n", lineno, str1);
        break;
    case 6:
        printf("ERROR(%d): Cannot index nonarray '%s'.\n", lineno, str1);
        break;
    case 7:
        printf("ERROR(%d): Cannot index nonarray.\n", lineno);
        break;
    case 8:
        printf("ERROR(%d): Cannot return an array.\n", lineno);
        break;
    case 9:
        printf("ERROR(%d): Cannot use function '%s' as a variable.\n", lineno, str1);
        break;
    case 10:
        printf("ERROR(%d): Symbol '%s' is already defined at line %d.\n", lineno, str1, lineno2);
        break;
    case 11:
        printf("ERROR(%d): Symbol '%s' is not defined.\n", lineno, str1);
        break;
    case 12:
        printf("ERROR(%d): The operation '%s' does not work with arrays.\n", lineno, str1);
        break;
    case 13:
        printf("ERROR(%d): The operation '%s' only works with arrays.\n", lineno, str1);
        break;
    case 14:
        printf("ERROR(%d): Unary '%s' requires an operand of type %s but was given %s\n", lineno, str1, str2, str3);
        break;
    default:
        printf("Unknown error message, check definitions\n");
        break;
    }
}

/*
 * Perform type-checking on operators
 *
 * tree - Node containing the operation
 */
void operatorCheck(TreeNode* tree) {
    int i = 0;
    int j = 0;
    TreeNode *tmp = NULL;
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
            //printf("\n\n\n---ass---\n\n\n");
            for (i = 0; i < MAXCHILDREN; i++) {
			    if((tmp = tree->child[i]) != NULL) {
                    if(tmp->kind.exp == CONST || tmp->kind.exp == ID) {
                        if(tree->expType != NUMB) {
                            printErrorMessage(tree->lineno, 0, tree->attr.name, getType(tree), getType(tmp), 1);           
                        } else if(tmp->expType != NUMB) {
                            printErrorMessage(tmp->lineno, 0, tmp->attr.name, getType(tmp), getType(tree), 2);
                        }
                    }
			    }
		    }
		    break;

		/*
		 * Requires SAME_SAME, gives LHS
		 */
		case ASSIGN:
            //printf("\n\n\n---ass2---\n\n\n");
		    for (i = 0; i < MAXCHILDREN; i++) {
			    if((tmp = tree->child[i]) != NULL) {
                    if(tmp->kind.exp == CONST || tmp->kind.exp == ID) {
                        if(tmp->expType != tree->expType) {                            
                            printErrorMessage(tree->lineno, 0, getOp(tree->attr.op), getType(tree), getType(tmp), 3);           
                        }
                    }
			    }
		    }
		    break;

		/*
		 * Requires RECORD_MEMBER, gives RHS
		 */
		case PERIODK:
            //printf("\n\n\n---prd---\n\n\n");
		    for (i = 0; i < MAXCHILDREN; i++) {
			    if((tmp = tree->child[i]) != NULL) {
                    if(tmp->isArray == 1) {
                        j = 1;
                        break;
                    }
			    }
		    }
            if(j == 1) {
                if(tmp->attr.name != NULL) {
                    printErrorMessage(tree->lineno, 0, tmp->attr.name, NULL, NULL, 6);  
                } else {
                    printErrorMessage(tree->lineno, 0, NULL, NULL, NULL, 7); 
                }         
                j = 0;
            }
		    break;

		/*
		 * Requires ARRAY_INT, gives LHS
		 */
		case LSB:
            //printf("\n\n\n---lsb---\n\n\n");
            for (i = 0; i < MAXCHILDREN; i++) {
			    if((tmp = tree->child[i]) != NULL) {
                    if(tmp->isArray == 1) {
                        j = 1;
                        break;
                    }
			    }
		    }
            if(j == 0) {
                 printErrorMessage(tree->lineno, 0, "[", NULL, NULL,13);   
            } else {
                j = 0;
                for (i = 0; i < MAXCHILDREN; i++) {
			        if((tmp = tree->child[i]) != NULL) {
                        if((tmp->kind.exp == CONST || tmp->kind.exp == ID) && (tmp->expType == NUMB)) {
                                j = 1; break;
                        }
			        }
		        }

                if(j == 0) printErrorMessage(tree->lineno, 0, tree->attr.name, getType(tree),  NULL, 4);           
                j = 0;
            }  
		    break;

		/*
		 * Check if negation or subtraction
		 * Sub - Requires INT_INT, gives INT
		 * Neg - Requires INT, gives INT
		 */
		case DASH:
            //printf("\n\n\n---das---\n\n\n");
            for (i = 0; i < MAXCHILDREN; i++) {
			    if((tmp = tree->child[i]) != NULL) {
                    if(tmp->kind.exp == CONST || tmp->kind.exp == ID) j++;
                }    
		    }
            if(j <= 2) {
                for (i = 0; i < MAXCHILDREN; i++) {
			        if((tmp = tree->child[i]) != NULL) {
                        if(tmp->kind.exp == CONST || tmp->kind.exp == ID) {
                            if(tree->expType != NUMB) {
                                printErrorMessage(tree->lineno, 0, tree->attr.name, getType(tree), getType(tmp), 1);           
                            } else if(tmp->expType != NUMB) {
                                printErrorMessage(tmp->lineno, 0, tmp->attr.name, getType(tmp), getType(tree), 2);
                            }
                        }
			        }
		        }
            } else {
                for (i = 0; i < MAXCHILDREN; i++) {
			        if((tmp = tree->child[i]) != NULL) {
                        if(tmp->kind.exp == CONST || tmp->kind.exp == ID) {
                            if(tmp->expType != tree->expType) {
                                printErrorMessage(tree->lineno, 0, getOp(tree->attr.op), getType(tree), getType(tmp), 3);           
                            }
                        }
			        }
		        }
            }
		    break;

		/*
		 * Check if sizing or multiplication
		 * Mult - Requires INT_INT, gives INT
		 * Size - Requires ARRAY, gives INT
		 */
		case ASTERISK:
            for (i = 0; i < MAXCHILDREN; i++) {
			    if((tmp = tree->child[i]) != NULL) {
                    if(tmp->isArray == 1) {
                        j += 1;
                    }
			    }
		    }
            if(j >= 1) {
                    printErrorMessage(tree->lineno, 0, "*", NULL, NULL,13);   
            } else {
                for (i = 0; i < MAXCHILDREN; i++) {
			        if((tmp = tree->child[i]) != NULL) {
                        if(tmp->kind.exp == CONST || tmp->kind.exp == ID) {
                            if(tree->expType != NUMB) {
                                printErrorMessage(tree->lineno, 0, tree->attr.name, getType(tree), getType(tmp), 1);           
                            } else if(tmp->expType != NUMB) {
                                printErrorMessage(tmp->lineno, 0, tmp->attr.name, getType(tmp), getType(tree), 2);
                            }
                        }
			        }
		        }
            } 
            j = 0;
		    break;

		/*
		 * Requires INT, gives INT
		 * Or ARRAY, gives ARRAY[?SIZEOF]
		 */
		case QMARK:            
            for (i = 0; i < MAXCHILDREN; i++) {
			    if((tmp = tree->child[i]) != NULL) {
                    if(tmp->isArray == 1) {
                        j = 1; 
                        break;
                    }
			    }
		    }
            if(j == 1) {
                for(; i < MAXCHILDREN; i++) {
                    if((tmp = tree->child[i]) != NULL) {
                        if(tmp->isArray == 1) printErrorMessage(tree->lineno, 0, NULL, NULL, NULL, 8);
                    }
                }
            } else {
                for(i = 0; i < MAXCHILDREN; i++) {
                    if((tmp = tree->child[i]) != NULL) {
                        if(tmp->kind.exp == CONST || tmp->kind.exp == ID) {
                            if(tree->expType != NUMB) {
                                printErrorMessage(tree->lineno, 0, tree->attr.name, NULL, NULL, 12);
                            }
                        }
                    }
                }
            }

		    break;

		/*
		 * Requires INT, gives INT
		 */
		case PPLUS:
		case DDASH:
            //printf("\n\n\n---dbl---\n\n\n");
            for (i = 0; i < MAXCHILDREN; i++) {
			    if((tmp = tree->child[i]) != NULL) {
                    if(tmp->kind.exp == ID) {
                        if(tree->expType != NUMB) {
                            printErrorMessage(tree->lineno, 0, tree->attr.name, getType(tmp), NULL, 1);           
                        } 
                    }
			    }
		    }
		    break;

		/*
		 * Requires SAME_SAME, gives BOOL
		 */
		case EQCP:
		case NEQ:
		    for (i = 0; i < MAXCHILDREN; i++) {
			    if((tmp = tree->child[i]) != NULL) {
                    if(tmp->expType != tree->expType) {
                        printErrorMessage(tree->lineno, 0, getOp(tree->attr.op), getType(tree), getType(tmp), 3);           
                    }
                }
		    }
		    break;

		/*
		 * Requires BOOL, gives BOOL
		 */
		case BNOT:
            //printf("\n\n\n---not---\n\n\n");
            for (i = 0; i < MAXCHILDREN; i++) {
			    if((tmp = tree->child[i]) != NULL) {
                    if(tmp->kind.exp == CONST || tmp->kind.exp == ID) {
                        if(tree->expType != TF) {
                            printErrorMessage(tree->lineno, 0, tree->attr.name, getType(tree), getType(tmp), 14);           
                            break;
                        } 
                    }
			    }
		    }
		    break;

		/*
		 * Requires BOOL_BOOL, gives BOOL
		 */
		case BAND:
		case BOR:
            //printf("\n\n\n---bol---\n\n\n");            
            for (i = 0; i < MAXCHILDREN; i++) {
			    if((tmp = tree->child[i]) != NULL) {
                    if(tmp->kind.exp == CONST || tmp->kind.exp == ID) {
                        if(tree->expType != TF) {
                            printErrorMessage(tree->lineno, 0, tree->attr.name, getType(tree), getType(tmp), 14);           
                        } 
                    }
			    }
		    }
		    break;

		/*
		 * Requires INT_INT, gives BOOL
		 * or CHAR_CHAR, gives BOOL
		 */
		case LTEQ:
		case LTHAN:
		case GTHANEQ:
		case GTHAN:
            for (i = 0; i < MAXCHILDREN; i++) {
			    if((tmp = tree->child[i]) != NULL) {
                    if(tmp->kind.exp == CONST || tmp->kind.exp == ID) {
                        if(tree->expType != NUMB || tree->expType != TF) {
                            printErrorMessage(tree->lineno, 0, tree->attr.name, getType(tree), getType(tmp), 1);           
                        } else if(tmp->expType != NUMB) {
                            printErrorMessage(tmp->lineno, 0, tmp->attr.name, getType(tmp), getType(tree), 2);
                        }
                    }
			    }
		    }
		    break;

		//Bad operator
		default:
			printf("Unknown op type\n");
		break;
	}

}

char *getOp(int val) {
    char *result;
    switch(val) {
    case 0: result = "+";
        break;
    case 1: result = "++";
        break;
    case 2: result = "-";
        break;
    case 3: result = "--";
        break;
    case 4: result = "=";
        break;
    case 5: result = "+=";
        break;
    case 6: result = "-=";
        break;
    case 7: result = "*=";
        break;
    case 8: result = "/=";
        break;
    case 9: result = "*";
        break;
    case 10: result = "/";
        break;
    case 11: result = "NOT";
        break;
    case 12: result = "AND";
        break;
    case 13: result = "OR";
        break;
    case 14: result = "==";
        break;
    case 15: result = "!=";
        break;
    case 16: result = "<=";
        break;
    case 17: result = "<";
        break;
    case 18: result = ">=";
        break;
    case 19: result = ">";
        break;
    case 20: result = "?";
        break;
    case 21: result = "%";
        break;
    case 22: result = "[";
        break;
    case 23: result = ".";
        break;
    case 24: result = ":";
        break;
    }
    return result;
}

char *getType(TreeNode *tree) {
    char *a;
    switch(tree->expType) {
        case 0:
            a = "void";
            break;
        case 1:
            a = "int";
            break;
        case 2:
            a = "bool";
            break;
        case 3:
            a = "char";
            break;
        default:
            a = "unknown";
            break;
    }
    return a;
}

