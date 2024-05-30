
/*** INCLUDES ***/

#include <assert.h>                                             // makes avaialbel the "static_assert" function (added starting from standard C11)
#include <stdio.h>



/*** ERROR CHECKS ***/

// Method #1: Error check at compile-time using the "#error" directive
#define MY_MACRO_1                                              // comment this line to trigger the compilation error
#ifndef MY_MACRO_1
  #error "Compilation error #1"
#endif

// Method #2: Error check at compile-time using the "static_assert" keyword
#define MY_MACRO_2    0x2F
static_assert(MY_MACRO_2 < 0x40, "Compilation error #2a");      // error message is triggered if the 1st argument condition/check is not met
static_assert(sizeof(int) == 13, "Compilation error #2b");



/*** MAIN ***/

int main() 
{ 
    printf(" Execution ok!\n");
    return 0; 
}
