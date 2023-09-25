

/*
 * Script showing an example of double pointers (i.e. pointers to pointers) using strings/characters.
 */


/* LIBRARIES */

#include <stdio.h>
#include <stdint.h>


/* CONSTANTS */

#define LEN     (uint8_t) 4
const char* p[LEN] = {"SEX", "VERDENA", "PLACEBO", "MORPHINE"};           // NB: actually this already a double pointer
const char** pp = &p[0];


/* FUNCTIONS */

void print_string( const char ** msg_ptr, uint8_t idx ){
    char x;
    uint8_t j = 0;
    if( (msg_ptr != NULL) && (idx < LEN) && (msg_ptr[idx] != NULL) ){
        printf(" #%d: ",idx);
        do{
            // x = msg_ptr[idx][j++];                                       // these x3 expressions are equivalent
            // x = *(msg_ptr[idx]+(j++));                                      
            x = *(*(msg_ptr+idx)+(j++));                                    // extract single character from idx-th string
            j++;
            printf("%c",x);                                                 // see NOTE#1
        } while(x != '\0');
        printf("\n");
    }
}


/* MAIN */

int main( void ){

    print_string(pp,1);
    print_string(pp,3);
    print_string(pp,2);
    print_string(pp,0);
    
    return 1;
}


/* NOTES */

// 1. Note in order to print a character with printf(), the placeholder "%c" shall be used. Using "%s" would cause printf()
//    not to work, since %s expectes a string (i.e. an array of chars ending with "\0", aka the null character).
