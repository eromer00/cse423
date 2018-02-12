#include <stdio.h>
#include <stdlib.h>
#include "symbolTable.h"

int main() {
    symtable = malloc(sizeof(SymbolTable));
    symtable->count = 0;

    char *a = "my";
    char *b = "name";
    char *c = "jeff";

    insertScope("a", "func", a);
    insertScope("b", "x", b);
    insertScope("c", "y", c);
    insertScope("a", "cond", a);
    insertScope("c", "main", c);
    insertScope("a", "func", c);
    insertScope("c", "func", c);

    printSymbolTable();
}
