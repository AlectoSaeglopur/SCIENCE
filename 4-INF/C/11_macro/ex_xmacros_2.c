
/*
 * Example of xmacros for a finite state-machine.
 * NB#1: This example defines a list of x4 entries (rows of STATE_TABLE) and for each of them
 *       generates the declaration of all x3 arguments (columns of STATE_TABLE) representing respectively
 *       the state name, the state ID and default state message to show (on LCD, for example).
 * NB#2: This example shows the most recommended way to use x-macros, since more readable;
 *       in particular, here x-macros are handled as macros fed by another macros.
 */

/*** INCLUDES ***/

#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>


/*** TYPEDES ***/

typedef void (p_func_t) ( void );                   // typedef for callback functions
typedef int sz_t;                                   // typedef for number of states estimate


/*** DEFINES ***/

// 1. list definition
#define STATE_TABLE(ENTRY)      \
    ENTRY(OFF,  4,  disabled)   \
    ENTRY(INIT, 5,  starting)   \
    ENTRY(ON,   7,  enabled)    \
    ENTRY(ERR,  11, fault)

// 2. expansion generating an "enum" with all state-IDs
#define DEF_STATE(st,id,fn) ST_##st = id,
enum{
    STATE_TABLE( DEF_STATE )
    //N_STATE                                       // not added here, otherwise i would mistakenly get "N_STATE=12"!
};
/*
The following constants are created after macro-expansion:
ST_OFF = 4;
ST_INIT = 5;
ST_ON = 7;
ST_ERR = 11;
*/

// 3. expansion generating a fictional "struct" type (since an instance "table_struct_t" will never be allocated throughout the code) just to estimate the number os states
typedef struct{
#define DEF_N_STATES(st,id,fn) sz_t st;
    STATE_TABLE( DEF_N_STATES )
} table_struct_t;
#define N_STATE sizeof(table_struct_t)/sizeof(sz_t)
/*
The following constants are created after macro-expansion:
N_STATE = 4;
*/

// 4. list expansion generating the prototype of each callback function
#define DEF_CBACKS(st,id,fn) p_func_t cb_##st;
    STATE_TABLE( DEF_CBACKS )
/*
The following prototypes are created after macro-expansion:
void cb_OFF( void );
void cb_INIT( void );
void cb_ON( void );
void cb_ERR( void );
*/

// 5. expansion generating a function array for all command-callbacks
//    NB: function names hereafter shall match prototypes created above and actual callbacks definition below!
p_func_t * TRANS_ARRAY[N_STATE] = {
#define DEF_FARRAY(st,id,fn) &cb_##st,
    STATE_TABLE( DEF_FARRAY )
};

// 6. printf function getting values through expansion
void print_info( void ){
    #define PRINT_STATES(st,id,fn)                  \
        printf(#st " | %d | " #fn "\n", ST_##st);
    STATE_TABLE( PRINT_STATES )
    printf("N_STATE = %d\n-----\n",N_STATE);
}


/*** CALLBACKS ***/

void cb_OFF( void ){
    printf("- execute OFF callback\n");
}

void cb_INIT( void ){
    printf("- execute INIT callback\n");
}

void cb_ON( void ){
    printf("- execute ON callback\n");
}

void cb_ERR( void ){
    printf("- execute ERR callback\n");
}


/*** MAIN ***/

int main( void ){

    print_info();

    p_func_t ** fptr = NULL;
    fptr = TRANS_ARRAY;
    uint8_t j;
    for( j=0; j<N_STATE; j++ ){
        fptr[j]();
    }

    return 1;
}
