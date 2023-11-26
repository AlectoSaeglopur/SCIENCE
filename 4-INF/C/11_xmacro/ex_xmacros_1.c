
/*
 * Example of xmacros for a communication handler.
 * NB#1: This example defines a list of x3 entries (rows of COMMAND_TABLE) and for each of them
 *       generates the declaration of all x2 arguments (columns of COMMAND_TABLE) representing respectively
 *       the command name and the byte to be sent via UART to execute the command.
 * NB#2: This example shows the least recommended way to use x-macros, since less readable;
 *       to avoid the need of "#undef ENTRY" every time, use x-macros with another macro as input for
 *       higher quality code (see "ex_xmacros_2.c").
 */

/*** INCLUDES ***/

#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>


/*** TYPEDES ***/

typedef void (p_func_t) ( uint16_t );                   // typedef for callback functions


/*** DEFINES ***/

// 1. list definition
#define COMMAND_TABLE                       \
    ENTRY(WRITE,    (uint8_t) 0x15)         \
    ENTRY(READ,     (uint16_t) 0xF490)      \
    ENTRY(RESET,    (uint32_t) 0x00BA1234)

// 2. list expansion generating an "enum" with all command-IDs (plus overall number)
enum{
#define ENTRY(name,byte) name##_ID,
    COMMAND_TABLE
#undef ENTRY
    N_CMD                                               // extra field expressing the number of commands (i.e. number of TABLE entries)
};
/*
The following constants are created after macro-expansion:
WRITE_ID = 0;
READ_ID = 1;
WRITE_ID = 2;
N_CMD = 3;
*/

// 3. list expansion generating an "enum" with all command-bytes
enum{
#define ENTRY(name,byte) name##_VAL = byte,
    COMMAND_TABLE
#undef ENTRY
};
/*
The following constants are created after macro-expansion:
WRITE_VAL = 0x15;
READ_VAL = 0xF490;;
WRITE_VAL = 0xBA1234
*/

// 4. list expansion generating an "enum" with all command-bytes size (in bytes)
enum{
#define ENTRY(name,byte) name##_LEN = sizeof(byte),
    COMMAND_TABLE
#undef ENTRY
};
/*
The following constants are created after macro-expansion:
WRITE_LEN = 1;
READ_LEN = 2;
WRITE_LEN = 4;
*/

// 5. list expansion generating the prototype of each callback function
#define ENTRY(name,byte) static p_func_t cb_##name;     // NB: equivalent to "#define ENTRY(name,byte) static void cb_##name(uint16_t);"
    COMMAND_TABLE
#undef ENTRY
/*
The following prototypes are created after macro-expansion:
static void cb_WRITE( uint16_t );
static void cb_READ( uint16_t );
static void cb_RESET( uint16_t );
*/

// 6. list expansion generating a function array for all command-callbacks
//    NB: function names hereafter shall match prototypes created above and actual callbacks definition below!
p_func_t * CBACK_ARRAY[N_CMD] = {
#define ENTRY(name,byte) &cb_##name,
    COMMAND_TABLE
#undef ENTRY
};

// 7. list expansion generating a "struct" with all command-errors
typedef struct{
#define ENTRY(name,byte) bool par_##name; bool ovf_##name;
    COMMAND_TABLE
#undef ENTRY
} cmderr_t;
/*
The following structure is created:
typedef struct{
    bool par_WRITE;             // parity error occurred during WRITE-command execution
    bool par_READ;
    bool par_RESET;
    bool ovf_WRITE;             
    bool ovf_READ;              // overflow error occurred during READ-command execution
    bool ovf_RESET;
} cmderr_t;
*/

// 8. printf function getting values through list expansion
void print_variables( void ){
    #define ENTRY(name,...) printf(#name " = %d | 0x%X (%d) \n",name##_ID,name##_VAL,name##_LEN);
    COMMAND_TABLE
    #undef ENTRY
    printf("N_CMD = %d\n-----\n",N_CMD);
}


/*** CALLBACKS ***/

static void cb_WRITE( uint16_t x ){
    printf("- WRITING! (%d)\n",x);
}

static void cb_READ( uint16_t x ){
    printf("- READING! (%d)\n",x);
}

static void cb_RESET( uint16_t x ){
    printf("- RESETTING! (%d)\n",x);
}


/*** MAIN ***/

int main(){

    print_variables();

    CBACK_ARRAY[WRITE_ID](41);      // returns 41 (i.e. invokes "cb_WRITE(41);"") 
    CBACK_ARRAY[READ_ID](12);       // returns 12 (i.e. invokes "cb_READ(12);"") 
    CBACK_ARRAY[RESET_ID](37);      // returns 37 (i.e. invokes "cb_RESET(37);"") 

    cmderr_t err;
    err.par_READ = true;            // test struct (field exists!)
    
    return 1;
}


/*** NOTES ***/

// 1. X-macros (just like "standard" macros) create constants, not variables. For instance,
//    here adding inside "main()" the line "WRITE_ID = 46;" would cause an error, since "WRITE_ID" is
//    a constant and cannot be modified.

// 2. COMMAND_TABLE and its entries (e.g. WRITE or READ) do not really exist, they're just
//    not-interpreted values that can be used in future expansions.

// 3. In the definition/expansion of a single entry, if only the first arguments are used, the additional ones
//    can be neglected by using "...". For example, see below the "#define ENTRY(name,...)" line.

// 4. As additional example (see "https://riptutorial.com/c/example/16845/code-generation"), the code...
//      #define X_123 X(1) X(2) X(3)        /* define a list of preprocessor tokens on which to call X */
//      #define X(val) printf("X(%d) made this print\n", val);  /* define X to use */
//      X_123
//      #undef X                            /* good practice to "undef" X to facilitate reuse later on */
//    ...is expanded by the pre-processor as:
//      printf("X(%d) made this print\n", 1);
//      printf("X(%d) made this print\n", 2);
//      printf("X(%d) made this print\n", 3);

// 5. X-macros give huge flexibility to your code in terms of interpretation and parameterization,
//    since the overall behavior can be updated by just modifying the main table "STATE_TABLE"
//    (e.g. changing the message related to each state or adding a new state).

// 6. To expand X-macros, use the online tool at "https://godbolt.org". Here by copy-and-paste your
//    code, set "C++" as language, "(x86-64) GCC" as compiler and "-E" as option. NB: remember to
//    remove included header-files from the code to avoid compilation errors!
