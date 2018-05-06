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
void printCodeTree(TreeNode* tree, FILE *output);
void initPrintCode(FILE *output);
void expressionCode(TreeNode *tree, FILE *output);


#endif
