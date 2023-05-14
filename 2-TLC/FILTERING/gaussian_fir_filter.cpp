
/**********************************************************************************
 *** Title: GAUSSIAN FILTERING
 *** Author: Filippo Valmori
 *** Date: 15/01/2019
 *** Reference: [1] Wikipedia - https://en.wikipedia.org/wiki/Gaussian_filter
 **********************************************************************************/


/*** NEEDED LIBRARIES ***/

#include <stdio.h>														// Standard library
#include <stdint.h>														// To use well-defined integer types
#include <math.h>														// To use the sin, cos, log and exp functions
#include <stdlib.h>														// To generate random bytes
#include <time.h>														// To link random seed to actual time



/*** PARAMETERS ***/

const uint16_t SymbLen = 15;											// Symbol stream length
const uint8_t sps = 8;													// Samples per symbol
const uint8_t span = 8;													// Number of symbols for filter representation
const float beta = 0.5;												// Bandwidth - symbol time (BT) product



/*** CONSTANTS AND GLOBAL VARIABLES ***/
const uint16_t SampLen = sps*SymbLen;									// Sample stream length
const uint16_t Ntaps = sps*span+1;										// Number of filter taps
const uint16_t FirDelay = sps*span/2;									// Filter delay (always (Ntaps-1)/2 for FIR filters) [Sa]
const float pi = 3.141593;												// π value
const uint8_t SYMB = 0;
const uint8_t SATX = 1;
const uint8_t SARX = 2;



/*** TYPEDEFS ***/

typedef struct TD1 {
	float Re;
	float Im;
} complex;



/*** FUNCTION PROTOTYPES ***/

void GetGaussTaps( float *Taps );
void ScaleGaussTaps( float *Taps );
void UpsampleR( float * SymbStream, float *SampStream );
void FirFilterR( float *InSamps, float *OutSamps, float *Taps );
void UpsampleC( complex *SymbStream, complex *SampStream );
void FirFilterC( complex *InSamps, complex *OutSamps, float *Taps );

void RandSymbGenR( float *IoSymbs );
void RandSymbGenC( complex *IoSymbs );
void Printfloats( float *InStream, uint16_t Len );
void WriteRealCsv( float *InStream, uint32_t Len, uint8_t Label );
void WriteComplexCsv( complex *InStream, uint32_t Len, uint8_t Label );



/*** MAIN FUNCTION ***/

int main(){

	float Taps[Ntaps];
	GetGaussTaps(Taps);
	Printfloats(Taps,Ntaps);

#if 0										// REAL CASE
	float Symbs[SymbLen];
	float InSamps[SampLen];
	float OutSamps[SampLen];

	RandSymbGenR(Symbs);
	Printfloats(Symbs,SymbLen);
	UpsampleR(Symbs,InSamps);
	FirFilterR(InSamps,OutSamps,Taps);
	Printfloats(OutSamps,SampLen);
#else										// COMPLEX CASE
	complex Symbs[SymbLen];
	complex InSamps[SampLen];
	complex OutSampsTx[SampLen];
	complex OutSampsRx[SampLen];

	RandSymbGenC(Symbs);
	WriteComplexCsv(Symbs,SymbLen,SYMB);
	UpsampleC(Symbs,InSamps);

	FirFilterC(InSamps,OutSampsTx,Taps);
	WriteComplexCsv(OutSampsTx,SampLen,SATX);
	FirFilterC(OutSampsTx,OutSampsRx,Taps);
	WriteComplexCsv(OutSampsRx,SampLen,SARX);
#endif

}



/*** SRRC FUNCTIONS ***/

/**
 *	Function for getting the Gaussian filter taps as a function
 *	of parameters sps, span and beta.
 **/
void GetGaussTaps( float *Taps ){

	uint16_t j;
	float Time;
	float alpha = sqrt(log(2)/2)/beta;

	for ( j=0; j<Ntaps; j++ ){
		Time = (j-(float)sps*span/2)/sps;
		Taps[j] = sqrt(pi)/alpha*exp(-pow(pi*Time/alpha,2));
	}

	ScaleGaussTaps(Taps);

}


/**
 *	Function for scaling the SRRC filter taps amplitude.
 **/
void ScaleGaussTaps( float *Taps ){

	uint16_t j;
	float Sum = 0;

	for ( j=0; j<Ntaps; j++ )
		Sum += Taps[j];

	for ( j=0; j<Ntaps; j++ )
		Taps[j] /= Sum;

}


/**
 *	Function for upsampling an input real symbol stream by the factor sps.
 **/
void UpsampleR( float *SymbStream, float *SampStream ){

	uint8_t i;
	uint16_t j;

	for ( j=0; j<SymbLen; j++ ){
		SampStream[j*sps] = SymbStream[j];
		for ( i=1; i<sps; i++ )
			SampStream[j*sps+i] = 0;	
	}

}


/**
 *	Function for upsampling an input complex symbol stream by the factor sps.
 **/
void UpsampleC( complex *SymbStream, complex *SampStream ){

	uint8_t i;
	uint16_t j;

	for ( j=0; j<SymbLen; j++ ){
		SampStream[j*sps].Re = SymbStream[j].Re;
		SampStream[j*sps].Im = SymbStream[j].Im;
		for ( i=1; i<sps; i++ ){
			SampStream[j*sps+i].Re = 0;
			SampStream[j*sps+i].Im = 0;
		}
	}

}


/**
 *	Function for performing finite impulse response (FIR) filtering according
 *	to the specified taps on the input real sample stream.
 **/
void FirFilterR( float *InSamps, float *OutSamps, float *Taps ){

	uint16_t i, j;
	float StateReg[Ntaps-1] = {0};
	float InValue, OutValue;
	
	for ( i=0; i<SampLen+FirDelay; i++ ){

		if ( i < SampLen )
			InValue = InSamps[i];
		else
			InValue = 0;

		if ( i >= FirDelay ){
			OutValue = Taps[0]*InValue;
			for ( j=1; j<Ntaps; j++ )
				OutValue += Taps[j]*StateReg[j-1];
			OutSamps[i-FirDelay] = OutValue;
		}

		for ( j=Ntaps-2; j>0; j-- )
			StateReg[j] = StateReg[j-1];
		StateReg[0] = InValue;
			
	}

}


/**
 *	Function for performing finite impulse response (FIR) filtering according
 *	to the specified taps on the input complex sample stream.
 **/
void FirFilterC( complex *InSamps, complex *OutSamps, float *Taps ){

	uint16_t i, j;
	float StateRegRe[Ntaps-1] = {0};
	float StateRegIm[Ntaps-1] = {0};
	float InValueRe, InValueIm, OutValueRe, OutValueIm;
	
	for ( i=0; i<SampLen+FirDelay; i++ ){

		if ( i < SampLen ){
			InValueRe = InSamps[i].Re;
			InValueIm = InSamps[i].Im;
		} else {
			InValueRe = 0;
			InValueIm = 0;
		}

		if ( i >= FirDelay ){
			OutValueRe = Taps[0]*InValueRe;
			OutValueIm = Taps[0]*InValueIm;
			for ( j=1; j<Ntaps; j++ ){
				OutValueRe += Taps[j]*StateRegRe[j-1];
				OutValueIm += Taps[j]*StateRegIm[j-1];
			}
			OutSamps[i-FirDelay].Re = OutValueRe;
			OutSamps[i-FirDelay].Im = OutValueIm;
		}

		for ( j=Ntaps-2; j>0; j-- ){
			StateRegRe[j] = StateRegRe[j-1];
			StateRegIm[j] = StateRegIm[j-1];
		}
		StateRegRe[0] = InValueRe;
		StateRegIm[0] = InValueIm;
			
	}

}



/*** EXTRA FUNCTIONS ***/

/**
 *	Function for filling the input real array with random antipodal symbols (+/-1).
 **/
void RandSymbGenR( float *IoSymbs ){

	uint16_t j;
	float Prob0 = 0.5;
	srand(time(NULL));														// Link random seed to actual time
	for ( j=0; j<SymbLen; j++ ){
		if ( rand()*(1.0/RAND_MAX) < Prob0 )
			IoSymbs[j] = -1;
		else
			IoSymbs[j] = 1;
	}
	IoSymbs[0] = 0;
	IoSymbs[SymbLen-1] = 0;

}


/**
 *	Function for filling the input complex array with random antipodal symbols (+/-1).
 **/
void RandSymbGenC( complex *IoSymbs ){

	uint16_t j;
	float Prob0 = 0.5;
	srand(time(NULL));														// Link random seed to actual time
	for ( j=0; j<SymbLen; j++ ){
		if ( rand()*(1.0/RAND_MAX) < Prob0 )
			IoSymbs[j].Re = -1;
		else
			IoSymbs[j].Re = 1;
	}
	IoSymbs[0].Re = 0;
	IoSymbs[SymbLen-1].Re = 0;
	for ( j=0; j<SymbLen; j++ ){
		if ( rand()*(1.0/RAND_MAX) < Prob0 )
			IoSymbs[j].Im = -1;
		else
			IoSymbs[j].Im = 1;
	}
	IoSymbs[0].Im = 0;
	IoSymbs[SymbLen-1].Im = 0;

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
		printf("%1.4f ",InStream[j]);

		if ( (j%8 == 7) && (j<(Len-1)) ) {
			printf("\n\t");

		}
	}
	printf("\n\n");

}


/**
 *	Function for writing the input real symbol stream into a csv file.
 **/
void WriteRealCsv( float *InStream, uint32_t Len, uint8_t Label ){

	uint32_t j;
	FILE *fid;

	if ( Label == SYMB ){
		fid = fopen("SymbsR.csv","w");
	} else if ( Label == SATX ){
		fid = fopen("SampsTxR.csv","w");
	} else if ( Label == SARX ){
		fid = fopen("SampsRxR.csv","w");
	}

	if ( fid != NULL ){
		for ( j=0; j<Len; j++ ){
			fprintf(fid,"%1.4f",InStream[j]);
			if ( j < Len-1 ){
				fprintf(fid,",");
			}
		}
	}
	fclose(fid);

}


/**
 *	Function for writing the input complex symbol stream into a csv file.
 **/
void WriteComplexCsv( complex *InStream, uint32_t Len, uint8_t Label ){

	uint32_t j;
	FILE *fid;

	if ( Label == SYMB ){
		fid = fopen("SymbsC.csv","w");
	} else if ( Label == SATX ){
		fid = fopen("SampsTxC.csv","w");
	} else if ( Label == SARX ){
		fid = fopen("SampsRxC.csv","w");
	}

	if (fid != NULL){
		for ( j=0; j<Len; j++ ){
			fprintf(fid,"%1.4f,%1.4f",InStream[j].Re,InStream[j].Im);
			if ( j < Len-1 ){
				fprintf(fid,",");
			}
		}
	}
	fclose(fid);

}
