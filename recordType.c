
/*
    Group: Spaghet_Code
    Members: Erik Romero, Carlos Rubio, Franz Chavez
    File: recType.c
    Description: program that handles record types in c- grammer.
*/

//System library imports
#include<stdio.h>
#include<stdlib.h>
#include<string.h>

//AST definition import
#include "recordType.h"

extern int line_num;
void yyerror(const char* s);

RecordType *RecTypeList = NULL;

/*
* add RecType to the List, inserted into head
*/

void addRecType(char *name){
    RecordType *newRecord = malloc(sizeof(RecordType));
    
    if(newRecord){
        newRecord->name = strdup(name);
        newRecord->lineno = line_num;
        newRecord->next = RecTypeList;
        RecTypeList = newRecord;
    }
    else yyerror("failed to create new record! Malloc error");
}

void emptyRecTypeList(){
    RecordType *r = RecTypeList;
    RecordType *t = NULL;
    while(r != NULL){
        t = r;
        r = r->next;
        free(t->name);
        free(t);
    }
}
