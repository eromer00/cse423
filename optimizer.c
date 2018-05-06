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
 
 int powerTwo(int x) {
    return x && !(x & (x - 1));
 }

 void strengthReduce(TreeNode *tree) {
    TreeNode *tmp1 = NULL;
    TreeNode *tmp2 = NULL;
    TreeNode *tmp3 = NULL;
    int power = 0;
    int inttmp = 0;
    int inttmp2 = 0;
    while(tree != NULL){
        power = 0;
        tmp3 = tree;
        
        for(int i = 0; i < MAXCHILDREN; i++) {
            if(tree->child[i] != NULL) {
                strengthReduce(tree->child[i]);
            }
        }

        if(tree->nodekind == ExpK && tree->kind.exp == OpK){
            if(tree->attr.op == asterisk) {
                if(tree->child[0] != NULL && tree->child[1] != NULL) {
                    tmp1 = tree->child[0];
                    tmp2 = tree->child[1];
                    if(tmp1->kind.exp == ConstK && tmp2->kind.exp == ConstK) {
                        if(powerTwo(tmp1->attr.value) == 1 && tmp1->attr.value != 0) {
                            printf("ASDFASDFASDF\n");
                            inttmp = tmp1->attr.value;
                            while(inttmp >>= 1) {
                                power++;
                            }
                            tmp2->attr.value <<= power;
                            tmp3->kind.exp = ConstK;
                            tmp3->attr.value = tmp2->attr.value;
                            tmp3->sibling = tmp2->sibling;
                            for(inttmp2 = 0; inttmp2 < MAXCHILDREN; inttmp2++) {
                                tmp3->child[inttmp2] = tmp2->child[inttmp2];
                            }
                            tmp3->expType = Integer;
                        } 
                        else if(powerTwo(tmp2->attr.value) == 1 && tmp2->attr.value != 0) {
                            printf("zxcvzxcvzxcvzxcv\n");
                            inttmp = tmp1->attr.value;
                            while(inttmp >>= 1) {
                                power++;
                            }
                            tmp1->attr.value <<= power;
                            tmp3->kind.exp = ConstK;
                            tmp3->attr.value = tmp1->attr.value;
                            tmp3->sibling = tmp1->sibling;
                            for(inttmp2 = 0; inttmp2 < MAXCHILDREN; inttmp2++) {
                                tmp3->child[inttmp2] = tmp1->child[inttmp2];
                            }
                            tmp3->expType = Integer;
                        } 
                    }
                }
            } else if(tree->attr.op == fslash) {
                if(tree->child[0] != NULL && tree->child[1] != NULL) {
                    tmp1 = tree->child[0];
                    tmp2 = tree->child[1];
                    if(tmp1->kind.exp == ConstK && tmp2->kind.exp == ConstK) {
                        if(powerTwo(tmp2->attr.value) == 1 && tmp2->attr.value != 0) {
                            inttmp = tmp2->attr.value;
                            while(inttmp >>= 1) {
                                power++;
                            }
                            tmp2->attr.value >>= power;
                            tmp3->kind.exp = ConstK;
                            tmp3->attr.value = tmp2->attr.value;
                            tmp3->sibling = tmp2->sibling;
                            for(inttmp2 = 0; inttmp2 < MAXCHILDREN; inttmp2++) {
                                tmp3->child[inttmp2] = tmp2->child[inttmp2];
                            }
                            tmp3->expType = Integer;
                        } 
                    }
                }
            }
        }




        //prev = &tree;
        tree = tree->sibling;
    }
 }

 void constantPropagation(TreeNode *tree){
    TreeNode **prev = NULL;
    TreeNode *new = NULL;
    int ret;
    while(tree != NULL){
        
        if(tree->nodekind == ExpK && tree->kind.exp == OpK){
            ret = recursiveOpCalc(tree);
            if(ret != -1){
                //we managed to fold the constants. replace the op with a constant
                tree->nodekind = ExpK;
                tree->kind.exp = ConstK;
                tree->attr.value = ret;
                tree->sibling = NULL;
                for(int i = 0; i < MAXCHILDREN; i++)
                    tree->child[i] = NULL;
            }
        }
        
        for(int i = 0; i < MAXCHILDREN; i++)
            if(tree->child[i] != NULL)
                constantPropagation(tree->child[i]);
        
        //prev = &tree;
        tree = tree->sibling;
    }
    
 }
 
 int recursiveOpCalc(TreeNode *tree){
    int left = 0;
    int right = 0;
    if(tree->nodekind == ExpK){
        if(tree->kind.exp == OpK){
            switch(tree->attr.op){
                case plus:
                case dash:
                case asterisk:
                case fslash:
                    left = recursiveOpCalc(tree->child[0]);
                    right = recursiveOpCalc(tree->child[1]);
                    if(left != -1 && right != -1){
                        switch(tree->attr.op){
                            case plus:
                                return left + right;
                            case dash:
                                return left - right;
                            case asterisk:
                                return left * right;
                            case fslash:
                                return left / right;
                            default:
                                return -1;
                        }
                    }
                break;
                default:
                    return -1;
            }
        }
        else if(tree->kind.exp == ConstK){
            return tree->attr.value;
        }
        else{
            return -1;
        }
    }
 }
 
 void deadCodeCheck(TreeNode *tree){
    int ret;
    TreeNode * head = tree;
    TreeNode * prev = tree;
    while(tree != NULL){
        if(tree->nodekind == ExpK && tree->kind.exp == OpK){
            switch(tree->attr.op){
                case assign:
                case passign:
                case sassign:
                case massign:
                case dassign:
                    printf("EXPRESSION %d\n", tree->lineno);
                    ret = searchForUsage(tree, tree->child[0]);
                    if(ret == 0 && tree->child[0]->kind.exp != ConstK){
                        printf("OPTIMIZER: %d: %s is never used.\n", tree->lineno, tree->child[0]->attr.name);
                        prev->sibling = tree->sibling;
                    }
                default:
                break;
            }
        }
        if(tree->nodekind == StmtK){
            switch(tree->kind.stmt){
                case IfK:
                    //check left and right conditions for usage
                    if(tree->child[0]->nodekind == ExpK){
                        ret = searchForPrevUsage(head, tree->child[0]->child[0]);
                        if(ret == 0){
                            //left of comparison is detected to not be used
                            printf("LEFT of COMPARISON NOT changed!\n");
                            prev->sibling = tree->sibling;
                        }
                        //check right child if it's an Id
                        ret = searchForPrevUsage(head, tree->child[0]->child[1]);
                        if(ret == 0){
                            //right of comparison is detected to not be used
                            printf("RIGHT of COMPARISON NOT changed!\n");
                            prev->sibling = tree->sibling;
                        }
                        
                    }
                    break;
                case RepeatK:
                    //check left and right conditions for usage
                    if(tree->child[0]->nodekind == ExpK){
                        ret = searchForPrevUsage(head, tree->child[0]->child[0]);
                        if(ret == 0){
                            //left of comparison is detected to not be used
                            printf("LEFT of COMPARISON NOT changed!\n");
                            prev->sibling = tree->sibling;
                        }
                        //check right child if it's an Id
                        ret = searchForPrevUsage(head, tree->child[0]->child[1]);
                        if(ret == 0){
                            //right of comparison is detected to not be used
                            printf("RIGHT of COMPARISON NOT changed!\n");
                            prev->sibling = tree->sibling;
                        }
                    }
                    break;
            }
        }
        for(int i = 0; i < MAXCHILDREN; i++)
            if(tree->child[i] != NULL)
                deadCodeCheck(tree->child[i]);
        
        if(ret != 0)
            prev = tree;
        tree = tree->sibling;
    }
 }
 
 int searchForPrevUsage(TreeNode *t, TreeNode *search){
    TreeNode *temp = NULL;
    TreeNode *old_t = NULL;
    TreeNode *head = t;
    int ret = 0;
    while(t != NULL){
        if(t->lineno > search->lineno){
            old_t = t;
            temp = t->sibling;
            t->sibling = NULL;
        }
        t = t->sibling;
    }
    ret = searchForUsage(head, search);
    old_t ->sibling = temp;
    return ret;
 }
 
 int searchForUsage(TreeNode *t, TreeNode *search){
    int isChanged = 0;
    int isUsed = 0;

    if(t == NULL || search == NULL || !(search->nodekind == ExpK && search->kind.exp == IdK)){
        return -1; //cant search an empty tree, or for invalid data
    }
    while(t != NULL){
        if(t->nodekind == ExpK && t->lineno != search->lineno){
            if(t->kind.exp == OpK){
                
                switch(t->attr.op){
                    case pplus:
                    case ddash:
                    case assign:
                    case passign:
                    case sassign:
                    case massign:
                    case dassign:
                        //printf("%d, %s, %p\n",t->attr.op, t->child[0]->attr.name, t->child[1]);
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

