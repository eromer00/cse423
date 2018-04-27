/**
 *
 * @date Spring 2018
 * @author Franz Chavez
 * @title optimizer functions
 *    _____
 *   /\   /\
 *  /  \ /  \
 * |    xmst |
 *  \  / \  /
 *   \/___\/
 *
 **/
 
 #include "optimizer.h"
 
 void redundantCodeCheck(TreeNode *tree){
    while(tree != NULL){
        printf("here ");
        for(int i = 0;i < MAXCHILDREN; i++)
            if(tree->child[i] != NULL)
                redundantCodeCheck(tree->child[i]);
        
        tree = tree->sibling;
    }
 }
