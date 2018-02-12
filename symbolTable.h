#ifndef _SYMBOLTABLE_H_
#define _SYMBOLTABLE_H_

/*  Map Structure: acts similarly to the c++ map data
 *  structure
 */
typedef struct {
    char *str;
    void *val;
} Map;


/*  Scope Structure: contains values for a given scope
 *  in the symbol table
 */
typedef struct {
    char *name;
    //include debug variable eventually?
    Map map[100]; //static for now until i figure out how this works, realloc maybe?
    int count;
} Scope;


/*  Symbol Table Structure: contains all defined scopes
 *  given in a program
 */
typedef struct {
    Scope stack[100]; //static as listed in scope struct    
    int count;
} SymbolTable;


SymbolTable *symtable;
void insertStack(Scope sc);
void insertScope(char *scopeName, char *str, void *val);
void printSymbolTable();

#endif
