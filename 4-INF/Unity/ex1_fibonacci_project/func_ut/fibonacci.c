/*
 * Library with all Fibonacci source functions to be tested (invoked by test.c).
 */


/** INCLUDES **/

#include "fibonacci.h"



/** FUNCTIONS **/

/* Function to get Fibonacci sequence value at num-th iteration. */
int fibonacci_get_nth_element( int num ){
    int first  = 1;
    int second = 1;
    int next   = 1;
    if ((num < 0) || (num > FIB_MAX_ELEMENT)){
      return 0;
    }
    int i;
    for (i = 2; i <= num; i++){
      next = first + second;
      first = second;
      second = next;
    }
    return next;
}

/* Function to check if input value is included in Fibonacci sequence. */
int fibonacci_is_element_in_sequence(int num){
    int first  = 1;
    int second = 2;
    int next   = 1;
    if (num <= 0){
        return 0;
    }
    if (num < 3){
        return 1;
    }
    int i;
    for (i = 2; ((next > num) || (i <= FIB_MAX_ELEMENT)); i++){
        next = first + second;
        if (next == num){
            return 1;
        }
        first = second;
        second = next;
    }
    return 0;
}
