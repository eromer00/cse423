#ifndef _CODEGEN_H_
#define _CODEGEN_H_

/**
 *
 * @date Spring 2018
 * @author Omar Soliman
 * @title Code Generation Definitions
 *    _____
 *   /\   /\
 *  /  \ /  \
 * |    xmst |
 *  \  / \  /
 *   \/___\/
 *
 **/

#include "semantic.h"

extern char *filename;

void codeGen(TreeNode* t);
void printFileInfo(char *fname, FILE* out);
void genPrototypes();


#endif
