/**
 *
 * @date Spring 2018
 * @author Franz Cahvez
 * @title Code Optimizations
 *    _____
 *   /\   /\
 *  /  \ /  \
 * |    xmst |
 *  \  / \  /
 *   \/___\/
 *
 **/
#include<stdio.h>
#include<getopt.h>
#include<string.h>

#include "printtree.h"

void deadCodeCheck(TreeNode *tree);
void constantPropagation(TreeNode *tree);
int recursiveOpCalc(TreeNode *tree);
int searchForPrevUsage(TreeNode *t, TreeNode *search);
int searchForUsage(TreeNode *t, TreeNode *search);
void strengthReduce(TreeNode *tree);

