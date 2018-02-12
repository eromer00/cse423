#ifndef _RECORDTYPE_H_
#define _RECORDTYPE_H_

/**
 *
 * @date Spring 2018
 * @author Erik Romero, Franz Chavez, Carlos Rubio
 * @title Record type Definitions
 *
 **/
 
/*
* Structure to hold Record Type Info
*/
typedef struct RecordType_t {
    int lineno; //line declared
    char *name; //name of record type
    struct RecordType_t *next; //next record
} RecordType;

//add a new type to the list
void addRecType(char *name);

//empty the record type list
void emptyRecTypeList();

#endif
