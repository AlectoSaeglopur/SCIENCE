
/*
 * Script showing an example of simple linked-list data structure with dynamic allocation.
 */


/*** INCLUDES ***/

#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>                                                         // needed to use "malloc" function



/*** TYPEDEFS ***/

struct Node {                                                               // node structure
    uint16_t data;                                                          // data field
    struct Node *next;                                                      // pointer to next node of the list
};



/*** FUNCTIONS ***/

/*
 * @brief Function to add a new node to the linked-list.
 * @param new_node pointer to new node to be added
 * @param head pointer to head-node of the linked-list
 * @param pos index where to place new node within linked-list
 * @return new head-node
 */
struct Node * Add_Node( struct Node * const new_node, struct Node * head, uint8_t pos ){
    struct Node *cnode = head;                                              // current node pointed
    struct Node *pnode = NULL;                                              // previous node pointed
    uint8_t idx = 0;
    if( (new_node != NULL) && (head != NULL) ){
        // case #1: add new node at the beginning of linked-list
        if( pos == 0 ){
            new_node->next = head;
            head = new_node;                                                // update head (see NOTE#2)
        } else {
            while( (idx < pos) && cnode->next != NULL ){
                idx++;
                pnode = cnode;
                cnode = cnode->next;
            }
            // case #2: add new node within linked-list
            if( idx == pos ){
                pnode->next = new_node;
                new_node->next = cnode;
            // case #3: add new node at the end of linked-list (even in case "pos" is beyond list size)
            } else {
                cnode->next = new_node;
                new_node->next = NULL;
            }
        }
    }
    return head;
}

/*
 * @brief Function to remove a node from the linked-list.
 * @param phead double pointer to head-node of the linked-list
 * @param pos index of node to be removed from linked-list
 */
void Remove_Node( struct Node ** const phead, uint8_t pos ){
    struct Node *cnode = *phead;                                            // current node pointed
    struct Node *pnode = NULL;                                              // previous node pointed
    uint8_t idx = 0;
    if( *phead != NULL ){
        // case #1: remove node at the beginning of linked-list
        if( pos == 0 ){
            *phead = cnode->next;                                           // update head (see NOTE#2)
        } else {
            while( (idx < pos) && cnode->next != NULL ){
                idx++;
                pnode = cnode;
                cnode = cnode->next;
            }
            // case #2: remove node within linked-list
            if( idx == pos ){
                pnode->next = cnode->next;
            // case #3: remove node at the end of linked-list (even in case "pos" is beyond list size)
            } else {
                pnode->next = NULL;
            }
        }
        // free(cnode);                                                        // free malloc-allocation for removed node (commented because freeing twice the same pointer - as here, since it's repeated at the end of main - can cause issues)
    }
}

/*
 * @brief Function to print the data members of input linked-list.
 * @param head pointer to head-node of the linked-list (size is retrieved automatically)
 */
void Print_Nodes( const struct Node * head ){
    uint8_t j = 0;
    const struct Node *cnode = head;                                        // current node pointed
    while( cnode != NULL ){                                                 // end-of-linked-list condition
        printf(" #%d : %d\n",j++,cnode->data);
        if( cnode->next == NULL ){
            break;
        } else {
            cnode = cnode->next;
        }
    }
    printf(" -------\n");
}



/*** MAIN ***/

int main(){

    struct Node *N1 = NULL;
    struct Node *N2 = NULL;
    struct Node *N3 = NULL;
    N1 = (struct Node *)malloc(sizeof(struct Node));                        // see NOTE#1
    N2 = (struct Node *)malloc(sizeof(struct Node));
    N3 = (struct Node *)malloc(sizeof(struct Node));
    N1->data = 111; 
    N1->next = N2;
    N2->data = 222;
    N2->next = N3;
    N3->data = 333;
    N3->next = NULL;
    struct Node *head = N1;
    Print_Nodes(head);                                                      // print original linked-list

    struct Node* const N4 = (struct Node *)malloc(sizeof(struct Node));
    N4->data = 444;
    head = Add_Node(N4,head,9);
    Print_Nodes(head);                                                      // print linked-list after adding N4 in position #9 (end)

    struct Node* const N5 = (struct Node *)malloc(sizeof(struct Node));
    N5->data = 555;
    head = Add_Node(N5,head,0);
    Print_Nodes(head);                                                      // print linked-list after adding N5 in position #0 (beginning)

    struct Node* const N6 = (struct Node *)malloc(sizeof(struct Node));
    N6->data = 666;
    head = Add_Node(N6,head,2);
    Print_Nodes(head);                                                      // print linked-list after adding N6 in position #2

    Remove_Node(&head,0);
    Print_Nodes(head);                                                      // print linked-list after removing node adding N6 in position #0
    
    free(N1);
    free(N2);
    free(N3);
    free(N4);
    free(N5);
    free(N6);

    return 1;

}



/*** NOTES ***/

// 1. Remember that malloc and calloc functions (just like any other function) cannot be called as global (i.e. outside functions). In fact, in C all functions (except
//    for the "main()" one) can be called only from inside another function! For example, defining a global variable as "int XYZ[10] = init(.)" would cause the compiler
//    to generate an error since XYZ initialization is not constant.

// 2. Remember that when a pointer is given as input to a function, only the value/members pointed by that pointer can be modified inside that function, but not the pointer
//    itself! That's why in function "Add_Node(.)" the head-pointer is returned as output in order to be actually updated, since the instructoin "head = new_node" alone
//    modifies the head-pointer only locally. Another method to globally modify a pointer inside a function is to give a double pointer as input, as can be seen in function 
//    "Remove_Node(.)".

// 3. Remember the last node of the list shall have its next member set to NULL!