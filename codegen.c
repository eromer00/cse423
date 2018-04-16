
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
	printFileInfo(filename, codeout);
	genPrototypes(codeout);
	fclose(codeout);

	return;
}

void printFileInfo(char *fname, FILE* out){
    fprintf(out, "* C- compiler version C-F16\n"
    "* Built: April 13, 2018\n"
    "* Author: Franz Chavez\n"
    "* File compiled:  %s\n"
    "* \n"
    "* ** ** ** ** ** ** ** ** ** ** ** **\n", fname);
}

void genPrototypes(FILE* out){
    fprintf(out, ""
    "* FUNCTION input\n"
    "  1:     ST  3,-1(1)	Store return address \n"
    "  2:     IN  2,2,2	Grab int input \n"
    "  3:     LD  3,-1(1)	Load return address \n"
    "  4:     LD  1,0(1)	Adjust fp \n"
    "  5:    LDA  7,0(3)	Return \n"
    "* END FUNCTION input\n"
    "* \n"
    "* ** ** ** ** ** ** ** ** ** ** ** **\n"
    "* FUNCTION output\n"
    "  6:     ST  3,-1(1)	Store return address \n"
    "  7:     LD  3,-2(1)	Load parameter \n"
    "  8:    OUT  3,3,3	Output integer \n"
    "  9:    LDC  2,0(6)	Set return to 0 \n"
    " 10:     LD  3,-1(1)	Load return address \n"
    " 11:     LD  1,0(1)	Adjust fp \n"
    " 12:    LDA  7,0(3)	Return \n"
    "* END FUNCTION output\n"
    "* \n"
    "* ** ** ** ** ** ** ** ** ** ** ** **\n"
    "* FUNCTION inputb\n"
    " 13:     ST  3,-1(1)	Store return address \n"
    " 14:    INB  2,2,2	Grab bool input \n"
    " 15:     LD  3,-1(1)	Load return address \n"
    " 16:     LD  1,0(1)	Adjust fp \n"
    " 17:    LDA  7,0(3)	Return \n"
    "* END FUNCTION inputb\n"
    "* \n"
    "* ** ** ** ** ** ** ** ** ** ** ** **\n"
    "* FUNCTION outputb\n"
    " 18:     ST  3,-1(1)	Store return address \n"
    " 19:     LD  3,-2(1)	Load parameter \n"
    " 20:   OUTB  3,3,3	Output bool \n"
    " 21:    LDC  2,0(6)	Set return to 0 \n"
    " 22:     LD  3,-1(1)	Load return address \n"
    " 23:     LD  1,0(1)	Adjust fp \n"
    " 24:    LDA  7,0(3)	Return \n"
    "* END FUNCTION outputb\n"
    "* \n"
    "* ** ** ** ** ** ** ** ** ** ** ** **\n"
    "* FUNCTION inputc\n"
    " 25:     ST  3,-1(1)	Store return address \n"
    " 26:    INC  2,2,2	Grab char input \n"
    " 27:     LD  3,-1(1)	Load return address \n"
    " 28:     LD  1,0(1)	Adjust fp \n"
    " 29:    LDA  7,0(3)	Return \n"
    "* END FUNCTION inputc\n"
    "* \n"
    "* ** ** ** ** ** ** ** ** ** ** ** **\n"
    "* FUNCTION outputc\n"
    " 30:     ST  3,-1(1)	Store return address\n" 
    " 31:     LD  3,-2(1)	Load parameter \n"
    " 32:   OUTC  3,3,3	Output char \n"
    " 33:    LDC  2,0(6)	Set return to 0 \n"
    " 34:     LD  3,-1(1)	Load return address \n"
    " 35:     LD  1,0(1)	Adjust fp \n"
    " 36:    LDA  7,0(3)	Return \n"
    "* END FUNCTION outputc\n"
    "* \n"
    "* ** ** ** ** ** ** ** ** ** ** ** **\n"
    "* FUNCTION outnl\n"
    " 37:     ST  3,-1(1)	Store return address\n" 
    " 38:  OUTNL  3,3,3	Output a newline \n"
    " 39:     LD  3,-1(1)	Load return address \n"
    " 40:     LD  1,0(1)	Adjust fp \n"
    " 41:    LDA  7,0(3)	Return \n"
    "* END FUNCTION outnl\n"
    "* \n"
    "* ** ** ** ** ** ** ** ** ** ** ** **\n");
}
