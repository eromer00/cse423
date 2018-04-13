
/**
 *
 * @date Spring 2018
 * @author Omar Soliman
 * @title Code generation functions
 *    _____
 *   /\   /\
 *  /  \ /  \
 * |    xmst |
 *  \  / \  /
 *   \/___\/
 *
 **/

#include <stdio.h>
#include "codegen.h"

/*
 * Generate TM machine code
 */
void codeGen(TreeNode* t) {

	FILE* codeout = fopen("testfile.tm","w+");
	printf("we made it!\n");
	fclose(codeout);

	return;
}
