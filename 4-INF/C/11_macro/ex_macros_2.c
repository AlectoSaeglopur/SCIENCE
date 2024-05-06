
/*
 * Example of useful macro-functions:
 * - STRVAR -> to convert name into string;
 * - STRBOOL -> to convert boolean value into string;
 * - TOGGLE -> to toggle output GPIO level.
 */

/*** INCLUDES ***/

#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>


/*** TYPEDEFS ***/

typedef struct {
    uint32_t addr;
    bool lev;
} gpio_t;                                                     // output GPIO structure with address and level


/*** DEFINES ***/

#define STRVAR(x) (#x)                                        // macro-function to convert input name into string by using the stringize operator "#"
#define STRBOOL(x) (x == 0 ? "FALSE" : "TRUE")                // macro-function to convert value into boolean string
#define TOGGLE(name) \
    if(Gpio##name.lev == true){Gpio##name.lev = false;} \
    else{Gpio##name.lev = true;}                              // macro-function to toggle output GPIO level (using also the concatenation operator "##")


/*** MAIN ***/

int main( void ){
    gpio_t GpioA3 = {.addr = 0x20003450, .lev = false};
    printf("%s : %s\n",STRVAR(GpioA3),STRBOOL(GpioA3.lev));
    TOGGLE(A3);                                               // toggle GPIO_A3 pin
    printf("%s : %s\n",STRVAR(GpioA3),STRBOOL(GpioA3.lev));   // prints "GpioA3 = TRUE"
    TOGGLE(A3);
    printf("%s : %s\n",STRVAR(GpioA3),STRBOOL(GpioA3.lev));
    return 1;
}
