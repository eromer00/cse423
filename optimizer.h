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

void redundantCodeCheck(TreeNode *tree);
int searchForUsage(TreeNode *t, TreeNode *search);
