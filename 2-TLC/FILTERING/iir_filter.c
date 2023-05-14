
/***********************************************************************************************
 *** Title: INFINITE IMPULSIVE RESPONSE FILTERING [NB: TO BE CHECKED YET]
 *** Author: Filippo Valmori
 *** Date: 08/06/2019
 *** Reference: [1] Wikipedia - https://en.wikipedia.org/wiki/Infinite_impulse_response
 ***********************************************************************************************/


/*** NEEDED LIBRARIES ***/

#include <stdio.h>														// Standard library
#include <stdint.h>														// To use well-defined integer types
#include <math.h>														// To use the sin, cos, log and exp functions
#include <stdlib.h>														// To generate random bytes
#include <time.h>														// To link random seed to actual time



/*** PARAMETERS ***/

#define SLEN       (uint32_t) 5                                         // Input buffer length [Sa]
#define ALEN       (uint32_t) 2                                         // Number of filter taps in the feedback path
#define BLEN       (uint32_t) 2                                         // Number of filter taps in the direct path
float aTaps[ALEN] = {-1.0, 1.0};
float bTaps[BLEN] = {1.0, 2.0};



/*** FUNCTION PROTOTYPES ***/

void IirFilterR( float *InSamps, float *OutSamps, uint32_t SampLen,  float *aTaps, float *bTaps );
void Printfloats( float *InStream, uint16_t Len );



/*** MAIN FUNCTION ***/

int main(){
    float InBuf[SLEN] = {[0 ... SLEN-1] = 1.0};                         // input array (constant to 1.0 here)
    float OutBuf[SLEN];
    IirFilterR(InBuf,OutBuf,SLEN,aTaps,bTaps);
    Printfloats(InBuf,SLEN);
    Printfloats(OutBuf,SLEN);
}



/*** IIR FUNCTIONS ***/

/**
 *	Function for performing infinite impulse response (IIR) filtering according
 *	to the specified taps on the input real sample stream.
 **/
void IirFilterR( float *InSamps, float *OutSamps, uint32_t SampLen,  float *aTaps, float *bTaps ){
	uint16_t i, j;
	float aStateReg[ALEN] = {0.0};							            // State register of the feedback line
	float bStateReg[BLEN-1] = {0.0};							        // State register of the forward line
	float InValue, OutValue;
	uint16_t Delay = 0;										 // Sample delay [TBC: always 0 for IIR filters?]
	for ( i=0; i<SampLen+Delay; i++ ){
		if ( i < SampLen ){
			InValue = InSamps[i];
        } else {
			InValue = 0;
        }
		OutValue = bTaps[0]*InValue;
		for ( j=1; j<BLEN; j++ ){
			OutValue += bTaps[j]*bStateReg[j-1];			            // Estimate latest y(n) for just the forward branch
        }
		for ( j=0; j<ALEN; j++ ){
			OutValue -= aTaps[j]*aStateReg[j];			                // Estimate latest y(n) also for the feedback branch
        }
		if ( i >= Delay ){
			OutSamps[i-Delay] = OutValue;					            // Write latest y(n) into the output array
		}
		for ( j=BLEN-2; j>0; j-- ){
			bStateReg[j] = bStateReg[j-1];					            // Update the shift register of the forward branch
        }
		bStateReg[0] = InValue;
		for ( j=ALEN-1; j>0; j-- ){
			aStateReg[j] = aStateReg[j-1];					            // Update the shift register of the feedback branch
        }
		aStateReg[0] = OutValue;
	}
}


/**
 *	Function for printing on terminal the input float array content.
 **/
void Printfloats( float *InStream, uint16_t Len ){
	uint16_t j;
	printf("\n\t");
	for ( j=0; j<Len; j++){
		if ( InStream[j] >= 0){
			printf("+");
		}
		printf("%1.2f ",InStream[j]);
		if ( (j%8 == 7) && (j<(Len-1)) ) {
			printf("\n\t");
		}
	}
	printf("\n\n");
}