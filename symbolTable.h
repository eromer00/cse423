#ifndef _SYMBOLTABLE_H_
#define _SYMBOLTABLE_H_

#include <stdio.h>
#include "printTree.h"
/*  Map Structure: acts similarly to the c++ map data
 *  structure
 */
typedef struct Map {
    char *str;
    void *val;
    int lineno;

    struct Map *next;
} Map;


/*  Scope Structure: contains values for a given scope
 *  in the symbol table
 */
typedef struct Scope {
    int name;
    //include debug variable eventually?

    Map *firstSym;
    Map *lastSym;

    struct Scope *parent;
    struct Scope *next;

} Scope;


/*  Symbol Table Structure: contains all defined scopes
 *  given in a program
 */
typedef struct SymbolTable {
    Scope *head;
    Scope *tail;
    Scope *current;  
    int depth;
} SymbolTable;


SymbolTable *symtable;
SymbolTable *initST();
Scope *newScope(int name, int lineno);
Map *newMap(char *str, void *val, int lineno);
void insertSymbol(Scope *sc, Map *m);
Map *findSymbol(Scope *sc, char *str);
Map *stackSearch(char *str);
void printSymbolTable();
void printScope(Scope *sc);
void printSymbol(Map *x);

void treeTraverse(TreeNode* tree);
int scopeNum;

#endif
