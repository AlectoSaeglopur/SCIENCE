
/*** INCLUDES ***/

#include <stdio.h>
#include <stdlib.h>



/*** DEFINES ***/

#define MEM_SZ      (unsigned int) 1000                     // number of bytes to allocate each cycle
#define TEST_STACK        


/*** FUNCTIONS ***/

void foo1( void ){
    int * ptr = (int *)malloc(MEM_SZ);
    free(ptr);
}


void foo2( void ){
    printf("a");
    int buf[MEM_SZ] = {0};
    foo2();

}



/*** MAIN ***/

int main( void ){
#if defined(TEST_HEAP)
    unsigned long long int cyc = 0;                         // aka uint64_t
    unsigned long int cnt = 0;                              // aka uint32_t
    while( 1 ){
        foo1();
        if(cyc++ == 5e6){
            cyc = 0;
            printf(" cnt = %d\n",cnt++);
        }
    }
#elif defined(TEST_STACK)
    foo2();
#endif
    return 1;
}



/*** NOTES ***/

// 1. Check RAM's heap occupation by using "#define TEST_HEAP". Each time "foo1()" is invoked, ptr is first created and then
//    destroyed (thus, causing the malloc location to be lost). Therefore, by commenting "free()", the memory allocated each
//    cycle is never released causing a massive RAM occupation (check with TaskManger) and starting to retur NULL at some point.

// 2. Check RAM's stack occupation by using "#define TEST_STACK". When "foo2()" is invoked, data are progressively and endlessly
//    added/nested in the stack causing eventually a stack overflow error (this error cannot be explicitly seen in Windows since
//    the OS provides built-in mechanisms to prevent it).

//    destroyed (thus, causing the malloc location to be lost). Therefore, by commenting "free()", the memory allocated each
//    cycle is never released causing a massive RAM occupation (check with TaskManger) and starting to retur NULL at some point.
