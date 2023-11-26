
/*
 * Example of xmacros for database of players (different topic but similar to "ex_xmacros_2.c").
 */

/*** INCLUDES ***/

#include <stdio.h>
#include <stdint.h>


/*** DEFINES ***/

// 1. list definition
#define FOR_LIST_OF_PLAYERS(ENTRY)      \
    ENTRY(MJ,   23,     17/02/1963)     \
    ENTRY(DR,   1,      04/10/1988)     \
    ENTRY(CB,   34,     20/02/1963)

// 2. expansion generating an "enum" with all jersey numbers
#if 1
#define DEF_JERSEY(name,jno,...) name##_jr = jno,
enum {
    FOR_LIST_OF_PLAYERS( DEF_JERSEY )
};
#else
#define DEF_JERSEY(name,jno,...) uint8_t name##_jr = jno;           // alternative that also gives the chance to customize data-size (with "enum" it's always "int" instead)
FOR_LIST_OF_PLAYERS( DEF_JERSEY )
#endif
/*
The following constants are created after macro-expansion:
MJ_jr = 23;
DR_jr = 1;
CB_jr = 34;
*/

// 3. expansion generating constants for the league where each player played (fixed for all players)
#define DEF_LEAGUE(name,...) char * name##_lg =  "NBA";
FOR_LIST_OF_PLAYERS( DEF_LEAGUE )
/*
The following constants are created after macro-expansion:
MJ_lg = "NBA";
DR_lg = "NBA";
CB_lg = "NBA";
*/

// 4. expansion generating all birthdays
#define DEF_BIRTHDAY(name,jno,bday) char * name##_bd = #bday;
FOR_LIST_OF_PLAYERS( DEF_BIRTHDAY )
/*
The following constants are created after macro-expansion:
MJ_bd = "17/02/1963";
DR_bd = "04/10/1988";
CB_bd = "20/02/1963";
*/

// 5. printf function getting values through expansion
void print_info( void ){
    #define PRINT_PLAYERS(name,jno,bday)        \
        printf(#name " | %2d", name##_jr);      \
        printf(" | %s\n",name##_bd);
    FOR_LIST_OF_PLAYERS( PRINT_PLAYERS )
}

static volatile void foo( void );
void foo( void ){
    printf("ciao\n");
}

/*** MAIN ***/

int main(){

    print_info();
    return 1;
}
