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
    int ret;
    while(tree != NULL){
        if(tree->nodekind == ExpK && tree->kind.exp == OpK){
            switch(tree->attr.op){
                case assign:
                case sassign:
                case massign:
                case dassign:
                    printf("EXPRESSION %d\n", tree->lineno);
                    ret = searchForUsage(tree, tree->child[0]);
                    if(ret == 0 && tree->child[0]->kind.exp != ConstK){
                        printf("OPTIMIZER: %d: %s is never used.\n", tree->lineno, tree->child[0]->attr.name);
                        tree->sibling = tree->sibling->sibling;
                    }
                default:
                break;
            }
        }
        for(int i = 0; i < MAXCHILDREN; i++)
            if(tree->child[i] != NULL)
                redundantCodeCheck(tree->child[i]);
        
        tree = tree->sibling;
    }
 }
 
 int searchForUsage(TreeNode *t, TreeNode *search){
    int isChanged = 0;
    int isUsed = 0;

    if(t == NULL){
        return -1; //cant search an empty tree
    }
    while(t != NULL){
        if(t->nodekind == ExpK && t->lineno != search->lineno){
            if(t->kind.exp == OpK){
                
                switch(t->attr.op){
                    case pplus:
                    case ddash:
                    case assign:
                    case sassign:
                    case massign:
                    case dassign:
                        printf("%d, %s, %p\n",t->attr.op, t->child[0]->attr.name, t->child[1]);
                        if(strcmp(t->child[0]->attr.name, search->attr.name) == 0 ){
                            isChanged = 1;
                            printf("%s changes! %d\n", search->attr.name, t->lineno);
                        }
                        break;
                    case period:
                    case lsb:
                    case asterisk:
                    case fslash:
                    case plus:
                    case dash:
                    case qmark:
                    case eqeq:
                    case neq:
                    case lteq:
                    case lthan:
                    case gteq:
                    case gthan:
                        if(t->child[0]->kind.exp == IdK)
                            if(strcmp(t->child[0]->attr.name, search->attr.name) == 0){
                                isUsed = 1;
                                printf("%s used! %d\n", search->attr.name, t->lineno);
                            }
                        if(t->child[1]->kind.exp == IdK)
                            if(strcmp(t->child[1]->attr.name, search->attr.name) == 0){
                                isUsed = 1;
                                printf("%s used! %d\n", search->attr.name, t->lineno);
                            }
                        break;
                
                }
            }
            else if(t->kind.exp == IdK){
                if(strcmp(t->attr.name, search->attr.name) == 0){
                    isUsed = 1;
                    printf("%s ID USED! %d\n", search->attr.name, t->lineno);
                }
            }
        }
        
        
        if(isChanged || isUsed){
            return 1;
        }
        
        for(int i = 0; i < MAXCHILDREN ; i++)
            if(searchForUsage(t->child[i], search)==1)
                return 1;
        
        t = t->sibling;
        
    }
    return 0;
 }
