
/*
 * Script showing an example of simple linked-list data structure with static allocation.
 */


/*** INCLUDES ***/

#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>



/*** DEFINES ***/

#define MAX_NODES       (uint8_t) 6                                         // Maximum number of nodes within linked-list



/*** TYPEDEFS ***/

struct Node {                                                               // node structure
    uint16_t data;                                                          // data field
    uint8_t priority;                                                       // node priority
    bool free;                                                              // free-node flag
    struct Node *next;                                                      // pointer to next node of the list
};

typedef enum {
    LIST_PHY,                                                               // physical list view type
    LIST_LOG,                                                               // logical list view type
} list_t;

typedef struct Node * const head_phy_t;                                     // typedef for pointer to physical-head node of array/list (fixed duringexecution, always pointing to &linked_list[0])
typedef struct Node * head_log_t;                                           // typedef for pointer to logical-head node of array/list (variable during execution)

typedef struct {
    head_phy_t hphy;
    head_log_t hlog;
} heads_t;                                                                  // typedef-structure containing physical and logical heads



/*** VARIABLES ***/

struct Node linked_list[MAX_NODES];                                         // static linked-list definition



/*** FUNCTIONS ***/

/*
 * @brief Function to initialize all nodes of the linked-list.
 * @param heads pointer to physical and logical heads of the linked-list (only physical needed here)
 */
void Init_List( heads_t * const heads ){
    uint8_t j;
    for( j=0; j<MAX_NODES; j++ ){
        (heads->hphy+j)->data = 0xFFFF;
        (heads->hphy+j)->priority = 0;                                      // NB: priority is set to 0 only during initialization
        (heads->hphy+j)->free = true;                                       // set all nodes as free/available
        (heads->hphy+j)->next = NULL;
    }
}

/*
 * @brief Function to add a new node to the linked-list (in decreasing order of priority).
 * @param heads pointer to physical and logical heads of the linked-list
 * @param newdata data of new node to be added
 * @param newptr priority of new node to be added (NB: shall be > 0)
 */
void Add_Node( heads_t * const heads, uint16_t newdata, uint8_t newprt ){
    if( (heads->hphy != NULL) && (heads->hlog != NULL) && (newprt > 0) ){
        uint8_t idx_phy = 0;                                                // index over physical list
        while( (idx_phy < MAX_NODES) && !((heads->hphy+idx_phy)->free) ){
            idx_phy++;                                                      // get index of first free slot within physical list
        }
        if( idx_phy < MAX_NODES ){                                          // if free slot found...
            struct Node *cnode = heads->hlog;                               // current node pointed
            struct Node *pnode = NULL;                                      // previous node pointed
            uint8_t idx_log = 0;                                            // index over logical list
            while( idx_log < MAX_NODES ){
                if( cnode == NULL ){
                    /* case #1: new node is placed at the end of list (lowest priority) */
                    pnode->next = (heads->hphy+idx_phy);
                    (heads->hphy+idx_phy)->next = NULL;
                    (heads->hphy+idx_phy)->data = newdata;                  // add data member to new node
                    (heads->hphy+idx_phy)->priority = newprt;               // add priority member to new node
                    (heads->hphy+idx_phy)->free = false;                    // set node as not available
                    break;
                } else if( newprt > cnode->priority ){                      // if new priority is higher than that of i-th logical node...
                    /* case #2: new node is placed at the beginnign of list (highest priority or list empty) */
                    if( pnode == NULL ){
                        if( cnode->priority != 0 ){                         // if list is not empty... (see NOTE#1)
                            (heads->hphy+idx_phy)->next = cnode;            // update "next" member of new node
                        }
                        heads->hlog = (heads->hphy+idx_phy);                // update head-node of the logical list
                    /* case #3: new node is placed within list (mid priority) */
                    } else {
                        pnode->next = (heads->hphy+idx_phy);                // update "next" member of previous node
                        (heads->hphy+idx_phy)->next = cnode;                // update "next" member of new node
                    }
                    (heads->hphy+idx_phy)->data = newdata;                  // add data member to new node
                    (heads->hphy+idx_phy)->priority = newprt;               // add priority member to new node
                    (heads->hphy+idx_phy)->free = false;                    // set node as not available
                    break;
                } else {
                    idx_log++;
                    pnode = cnode;
                    cnode = cnode->next;                                    // move to next logical node
                }
            }
        }
    }
}

/*
 * @brief Function to remove the highest priority node from the linked-list.
 * @param heads pointer to physical and logical heads of the linked-list (only logical needed here)
 */
void Remove_Node( heads_t * const heads ){
    if( (heads->hlog != NULL) && !( heads->hlog->free) ){                   // if pointer is valid and list is not already empty...
        heads->hlog->free = true;                                           // release slot
        if( heads->hlog->next != NULL ){                                    // if the node that is being removed is not the last one within the list (since only the last logical node has .next == NULL)...
            heads->hlog = heads->hlog->next;                                // set logical head to next node of the list
        }
    }
}

/*
 * @brief Function to print input linked-list info:
 *        - 1. node number
 *        - 2. node data member
 *        - 3. node priority member
 *        - 4. node free member
 *        - 5. node next member
 *        - 6. node address
 * @param head pointer to head-node of the linked-list
 * @param list_view physical/logical list view
 */
void Print_List( const heads_t * const heads, list_t list_view ){
    uint8_t j = 0;
    if( list_view == LIST_PHY ){
        for( ; j<MAX_NODES; j++ ){
            printf(" #%d : x%4X | %d | %d | x%6x || x%6x\n",j,(heads->hphy+j)->data,
                (heads->hphy+j)->priority,(heads->hphy+j)->free,(heads->hphy+j)->next,(heads->hphy+j));
        }
    } else if( list_view == LIST_LOG ) {
        const struct Node *cnode = heads->hlog;                             // current node pointed
        while( (cnode != NULL) && !(cnode->free) ){                         // end-of-linked-list condition
            printf(" #%d : x%4X | %d | %d | x%6x || x%6x\n",j++,cnode->data,
                cnode->priority,cnode->free,cnode->next,cnode);
            if( cnode->next == NULL ){
                break;
            } else {
                cnode = cnode->next;
            }
        }
    }
    printf(" -------\n");
}



/*** MAIN ***/

int main(){

    list_t print_type = LIST_LOG;                                           // print view (LIST_LOG for logical, LIST_PHY for physical) -> see NOTE#1

    heads_t heads = {&linked_list[0],&linked_list[0]};                      // define structure with physical and logical heads (both initialized to 1st element of "linked_list" array)
    Init_List(&heads);                                                      // initialize array/list nodes to default/empty values

    if( print_type == LIST_PHY ){
        printf("\n >>> PHYSICAL LIST <<<\n\n");
    } else {
        printf("\n >>> LOGICAL LIST <<<\n\n");
        print_type = LIST_LOG;
    }
    Print_List(&heads,print_type);

    Add_Node(&heads,0xAA11,5);                                              // add x5 elements to the list
    Add_Node(&heads,0xAA22,8);
    Add_Node(&heads,0xAA33,6);
    Add_Node(&heads,0xAA44,2);
    Add_Node(&heads,0xAA55,3);
    Print_List(&heads,print_type);

    Remove_Node(&heads);                                                    // remove x2 elements from the list
    Remove_Node(&heads);
    Print_List(&heads,print_type);

    Add_Node(&heads,0xBB11,1);                                              // add x3 elements to the list
    Add_Node(&heads,0xBB22,4);
    Add_Node(&heads,0xBB33,7);
    Print_List(&heads,print_type);

    return 1;

}



/*** NOTES ***/

// .1 The project focuses on a linked-list implemented statically, i.e. without dynamic allocation (as in "linked_list_dynamic.c)". The physical array of struct is
//    actually handled logically as a linked-list (i.e. the beginning is defined by "head_log" and then the list is sorted through the "next"-member of each node).
//    Thus, "linked_list" can be seen as both a physical array and a logical linked-list here.
//    In particular, the logic list is automatically sorted in decreasing order of priority (thus depending on the "priority"-member of each node). Each time a new
//    node is added, the first free slot of the physical array list is used (and its "free"-slot isthen set as false) and locally the new node is located just after
//    other member with hgher or equal priority. Instead, calling function "Remove_Node(.)" removes the node with highest priority present in the list. Remember that
//    each new node added to the list shall have a priority higher than 0, since 0 is a unique value that can beused only during initialization. Note the "next"-member
//    of the last node of the logic linked-list shall be always set to NULL in order to identify the current end of the list (done automatically by the code).
//    To switch between array/list physical and logical states visualization, modify the "print_type" variable.

// 2. Note that the same approach with physical and logical heads can be implemented just the same also for the dynamic case. For example, defining:
//    "linked_list = malloc(MAX_NODES*sizeof(struct Node))".

// 3. Remember that when a function parameter is specified as "const1 type_t * const2 XYZ":
//    - the 1st "const" (aka const1 here) means no member (or pointed value) of pointer XYZ can be modified inside the function (i.e. also no global change is possible),
//      that's useful to protect the pointed value/members in case the function is not expected to modify them; 
//    - the 2nd "const" (aka const2 here) means the pointing value of pointer XYZ (i.e. address) cannot be modified LOCALLY inside the function, that's useful to protect
//      the pointer address in case the function is not expected to modify it (however, remember the pointer address would not be GLOBALLY modified in any case -> see
//      NOTE#2 in "linked_list_dynamic.c" for further details). 
