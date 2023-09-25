
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <math.h>

#define MACRO1(X,Y)         (X > Y) ? X+Y : -1                              // macro-function returning X+Y if X>Y, or -1 otherwise
#define MACRO2(X)           10*X
#define MACRO3(X)           10*(X)                                          // keep in mind the importance of these brackets! (see example [7])


int main(){

    /* [1] conditional expression */
    printf("\n* [1] conditional expression\n");
    int A = 2;
    int B;
    B = ( A > 0 ) ? 5 : A;
    printf("  Y = %d\n\n",B);                                               // expected result : 5


    /* [2] do-while loop */
    int C = 1;
    do {
        printf("* [2] do-while statement %d\n\n",C);                        // expected result : this line printed twice
    } while ( C-- > 0 );


    /* [3] continue-break */
    printf("* [3] continue-break example\n  ");
    int i = 8;
    while( i > 0 ){
        i--;
        if ( i == 5 )
            continue;                                                       // skip directly to next while cycle
        if ( i == 1 )
            break;
        printf("%d ",i);                                                    // expected result : 7 6 4 3 2 
    }


    /* [4] for loop with multiple conditions */
    printf("\n\n* [4] for loop multiple condition\n  ");
    int j;
    for ( i=0, j =5; i<3 || j>4; i++, j-- ){
        printf("%d|%d  ",i,j);
    }


#if 0
    /* [5] scanf + malloc */
    printf("\n\n* [5] scanf + malloc example\n");
    int Nrows = 0, Ncols = 0;
    printf("  enter Nrows value -> ");
    scanf("%d",&Nrows);
    printf("  enter Ncols value -> ");
    scanf("%d",&Ncols);
    printf("  value readback : %d | %d\n", Nrows, Ncols);
    if ( (Nrows < 0) || (Ncols < 0) || Ncols*Nrows >2000 ){
        printf("  ERROR : Invalid input!\n");
        exit(EXIT_FAILURE);                                                 // Failure condition from stdlib.h (use EXIT_SUCCESS in case of successful exit instead)
    }
    uint8_t **Mtx = (uint8_t **)malloc(Nrows*sizeof(uint8_t*));
    if ( Mtx != NULL ){
        for ( i=0; i<Nrows; i++ ){
            Mtx[i] = (uint8_t *)malloc(Ncols*sizeof(uint8_t));
            for ( j=0; j<Ncols; j++ ){
                Mtx[i][j] = i*Ncols+j;
            }
        }
    }
    printf("  Mtx = ");
    for ( i=0; i<Nrows; i++ ){
        for ( j=0; j<Ncols; j++ ){
            printf("%2d ",Mtx[i][j]);
        }
        printf("\n        ");
    }
    free(Mtx);
#endif
    

    /* [6] static variable inside function */
    void IncrFunct( void ){
        static int x = 0;
        x++;
        printf("%d  ",x);
    }
    printf("\n\n* [6] static variable assignment inside function\n  x = ");
    IncrFunct();
    IncrFunct();
    IncrFunct();


    /* [7] macro functions */
    printf("\n\n* [7] macro function\n");
    printf("  MACRO1 = %d\n",MACRO1(50,15));
    int D = 2, E = 1;
    printf("  MACRO2 = %d\n",MACRO2(D+E));                                  // Wrong results : 10*D+E
    printf("  MACRO3 = %d\n",MACRO3(D+E));                                  // Correct result : 10*(D+E)


    /* [8] union */
    typedef union {
    int Birthday[3];                                                        // only one of the union fields can exist at a certain time (i.e. the last modified)
    uint8_t Age;
    } Time;
    printf("\n* [8] union\n");
    Time T1 = {.Age = 28};
    printf("  Age = %d | Bday = %d/%d/%d\n",T1.Age,T1.Birthday[0],T1.Birthday[1],T1.Birthday[2]);
    T1.Birthday[0] = 24;
    T1.Birthday[1] = 11;
    T1.Birthday[2] = 1991;
    printf("  Age = %d | Bday = %d/%d/%d\n",T1.Age,T1.Birthday[0],T1.Birthday[1],T1.Birthday[2]);


    /* [9] Info from built-in C macros (date-time and end-of-file) */
    printf("\n* [9] Info from built-in C macros\n");
    char CurTime[sizeof(__TIME__)];
    char CurDate[sizeof(__DATE__)];
    char CurFIle[sizeof(__FILE__)];
    strcpy(CurTime, __TIME__);
    strcpy(CurDate, __DATE__);
    strcpy(CurFIle, __FILE__);
    printf("  Time of Day -> %s\n", CurTime);
    printf("  Date -> %s\n", CurDate);
    printf("  File Name -> %s\n", CurFIle);
    printf("  End of file at line #%d\n", __LINE__);

    return 1;
    
}
