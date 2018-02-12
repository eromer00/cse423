#include <stdio.h>
#include <stdlib.h>
#include "symbolTable.h"

int main() {
    symtable = initST();

    char *a, *b, *c;
    a = "hello";
    b = "world";
    c = "!!!";

    Scope *a1 = newScope(1, 5);
    Scope *a2 = newScope(2, 7);
    Scope *a3 = newScope(3, 110);

    Map *b11 = newMap("x", a, 2);
    Map *b12 = newMap("forest", b, 3);
    Map *b21 = newMap("test", a, 8);
    Map *b31 = newMap("forest", a, 115);
    Map *b32 = newMap("y", b, 117);
    Map *b33 = newMap("zee", c, 118);

    insertSymbol(a1, b11);
    insertSymbol(a1, b12);
    insertSymbol(a2, b21);
    insertSymbol(a3, b31);
    insertSymbol(a3, b32);
    insertSymbol(a3, b33);

    printSymbolTable();

    free(symtable);
    

    //printSymbolTable();

}
