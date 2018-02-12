#include "symbolTable.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>


void insertStack(Scope sc) {
    int i = symtable->count;
    symtable->stack[i] = sc;
    symtable->count++;
}

void insertScope(char *scopeName, char *str, void *val) {
    Map *mtmp = malloc(sizeof(Map));
    mtmp->str = str;
    mtmp->val = val;

    int i, j;
    i = j = 0;

    for(i = 0; i < symtable->count; i++) {
        if(strcmp(symtable->stack[i].name, scopeName) == 0) {
            int count = symtable->stack[i].count;
            symtable->stack[i].map[count] = *mtmp;
            symtable->stack[i].count++;
            j = 1;
        }
    }

    if(j == 0) {
        Scope *scope = malloc(sizeof(Scope));
        scope->count = 1;
        scope->map[0] = *mtmp;
        scope->name = scopeName;

        insertStack(*scope);
    }

    /*

    for(i = 0; i < 100; i++) {
        if(strcmp(symtable->stack[i].name, scopeName) == 0) {
            Scope scope = symtable->stack[i];
            for(j = 0; i < 100; j++) {
                if(scope.map[j] != NULL) {
                    symtable->stack[i].map[j] = mtmp;
                    break;
                }
            }
            if(j >= 100) { printf("Error in map: either need to realloc or fix something\n");
        } else if(symtable->stack[i] == NULL) {
            Scope *stmp;
            stmp->name = scopeName;
            stmp->map[0] = mtmp;            

            symtable->stack[i] = stmp;
        }
    }

    if(i == 100) { printf("Error in scope: either need to realloc or fix something\n"); } */
}

//free memory for now, memory leaks are big enough as is
void printSymbolTable() {
    int i = 0;
    int j = 0;
    for(i = 0; i < symtable->count; i++) {
        printf("Scope[%s] :\n", symtable->stack[i].name);
        for(j = 0; j < symtable->stack[i].count; j++) {
            printf("\tSymbol %d : %s,%s\n", j, symtable->stack[i].map[j].str, (char *)symtable->stack[i].map[j].val); 
        }
    }
    free(symtable);
}

