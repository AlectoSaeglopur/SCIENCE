
/*
 * Example of xmacros for database of players (similar to "ex_xmacros_2.c", plus an example of function macro expansion).
 */

/*** INCLUDES ***/

#include <stdio.h>
#include <stdint.h>

/*** VARIABLES ***/

uint8_t Cnt = 0;


/*** DEFINES ***/

// 1. list definition
#define LIST_OF_PLAYERS(ENTRY)          \
    ENTRY(MJ,   23,     17/02/1963)     \
    ENTRY(DR,   1,      04/10/1988)     \
    ENTRY(CB,   34,     20/02/1963)

// 2. expansion generating an "enum" with all jersey numbers
#if 1
#define DEF_JERSEY(name,jno,...) name##_jr = jno,
enum {
    LIST_OF_PLAYERS( DEF_JERSEY )
};
#else
#define DEF_JERSEY(name,jno,...) uint8_t name##_jr = jno;           // alternative that also gives the chance to customize data-size (with "enum" it's always "int" instead)
LIST_OF_PLAYERS( DEF_JERSEY )
#endif
/*
The following constants are created after macro-expansion:
MJ_jr = 23;
DR_jr = 1;
CB_jr = 34;
*/

// 3. expansion generating constants for the league where each player played (fixed for all players)
#define DEF_LEAGUE(name,...) char * name##_lg =  "NBA";
LIST_OF_PLAYERS( DEF_LEAGUE )
/*
The following constants are created after macro-expansion:
MJ_lg = "NBA";
DR_lg = "NBA";
CB_lg = "NBA";
*/

// 4. expansion generating all birthdays
#define DEF_BIRTHDAY(name,jno,bday) char * name##_bd = #bday;
LIST_OF_PLAYERS( DEF_BIRTHDAY )
/*
The following constants are created after macro-expansion:
MJ_bd = "17/02/1963";
DR_bd = "04/10/1988";
CB_bd = "20/02/1963";
*/

// 5. expansion generating functions to print info of each player separately
#define DEF_FUNCS(name,jno,bday)                                \
void print_##name##_info( uint8_t * pCnt ){                     \
  if( pCnt != NULL )  {                                         \
    printf("%d. " #name " | " #jno " | " #bday "\n",*pCnt);     \
    (*pCnt)++;                                                  \
  }                                                             \
}
LIST_OF_PLAYERS( DEF_FUNCS )
/*
The following constants are created after macro-expansion:
void print_MJ_info( uint8_t * pCnt ){ ... }
void print_DR_info( uint8_t * pCnt ){ ... }
void print_CB_info( uint8_t * pCnt ){ ... }
>> see NOTE#1
*/



/*** MAIN ***/

int main(){
    print_MJ_info(&Cnt);
    print_DR_info(&Cnt);
    print_CB_info(&Cnt);
    return 1;
}



/*** NOTES ***/

// 1. Note these functions can have any input type (here uint8_t*), any return type (here void),
// define local variable, and invoke other functions (e.g. print fhere) like any standard function!

// 2. As a more extensive and detailed example, see "ConfigHandler.c" within the Orville project.
