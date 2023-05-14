
/*******************************************************************************************************************
 *** Title: FSK, CPSK and GFSK MODULATORS (MAPPING WITH GRAY CODING)
 *** Author: Filippo Valmori
 *** Date: 28/05/2018
 *** Reference: [1] Wikipedia - https://en.wikipedia.org/wiki/Frequency-shift_keying
 *******************************************************************************************************************/


/*** NEEDED LIBRARIES ***/

#include <stdio.h>														// Standard library
#include <stdint.h>														// To use well-defined integer types
#include <string.h>														// To allow the memset function usage
#include <stdlib.h>														// To generate random bytes
#include <time.h>														// To link random seed to actual time
#include <math.h>														// To use the sin, cos, log and exp functions



/*** PARAMETERS ***/

const uint16_t ByteLen = 50;											// Source info stream length (in bytes)
const uint8_t M = 4;													// Modulation order
const uint32_t Rb = 10e3;												// Bit rate [b/s]
const uint32_t Fc = 1e6;												// Carrier frequency [Hz] (NB: Max 4.3 GHz with uint32 representation)
const float dev = 1.3e3;                                           	    // Inner frequency deviation [Hz]
const uint8_t osf = 20;                                                	// Baseband oversampling factor
const uint8_t span = 8;                                               	// Span for Gaussian filter representation [S] (only GFSK)
const uint8_t sps = 8;                                                	// Number of samples per symbol for Gaussian filter representation [Sa/S] (only GFSK)
const float beta = 0.5;												    // 3-dB bandwidth - symbol time (BT) product
const uint32_t FsSDR = 250e3;											// Target SDR sample rate [Sa/s]



/*** CONSTANTS AND GLOBAL VARIABLES ***/

const float pi = 3.141593;												// pi-value
const uint32_t Rs = Rb/log2(M);                                        	// Symbol rate [S/s]
const float h = 2*(M-1)*dev/Rs;													// Modulation index
const uint32_t FsBB = osf*Rs;                                          	// Ideal baseband sample rate [Sa/s]
const float TsBB = 1.0/FsBB;                                          	// Ideal baseband sample period [s]
const uint32_t FsRF = 12*Fc;                                           	// RF sample rate [Sa/s]
const uint8_t L = log2(M);												// Number of bits per symbol
const uint16_t BitLen = ByteLen<<3;										// Ideal info bit stream length [b]
const uint16_t SymbLen = BitLen/L;										// Ideal symbol stream length [S]
const uint32_t SampLen = (uint32_t)osf*SymbLen;							// Ideal baseband sample stream length [Sa]
const uint32_t SampLenSDR = (uint32_t)(TsBB*(SampLen-1)*FsSDR)+1;		// SDR baseband sample stream length [Sa]
#define ZERO			0
#define REPEAT			1
#define FSK				0
#define CPFSK			1
#define GFSK			2
#define FSK_SDR			3
#define CPFSK_SDR		4
#define GFSK_SDR		5



/*** TYPEDEFS ***/

typedef struct TD1 {
	float Re;
	float Im;
} complex;

typedef struct TD2 {
	uint8_t Bits[M];
	int Symbs[M];
} freqmap;



/*** FUNCTION PROTOTYPES ***/

void CheckParam( void );
void GetFreqTable( freqmap *IoTable );
void GetGray( uint8_t *IoArray );
void FreqMapper( uint8_t *InBytes, float *OutSymbs, freqmap *Table );
void FskModulatorBB( float *InSymbs, complex *OutSamps );
void Upsampling( float *InStream, float *OutStream, uint32_t OutLen, uint8_t UpFactor, uint8_t Mode );
void LinResamplingR( float *InStream, float *OutStream, uint32_t InLen, uint32_t OutLen, uint32_t FsIn, uint32_t FsOut );
void LinResamplingC( complex *InStream, complex *OutStream, uint32_t InLen, uint32_t OutLen, uint32_t FsIn, uint32_t FsOut );
void IntergatorR( float *InSamps, float *OutSamps, uint32_t SampLen, float Ts );
void IntergatorC( complex *InSamps, complex *OutSamps, uint32_t SampLen, float Ts );
void CpfskModulatorBB( float *InSymbs, complex *OutSamps );
void GetGaussTaps( float *Taps, float BT, uint8_t span, uint8_t sps );
void ScaleGaussTaps( float *Taps, uint16_t Ntaps );
void FirFilterR( float *InSamps, float *OutSamps, float *Taps, uint16_t Ntaps );
void GfskModulatorBB( float *InSymbs, complex *OutSamps );

void RandGen( uint8_t *IoBytes );
void GenUpktSitael( uint8_t *IoBytes );
void PrintParam( void );
void PrintBytes( uint8_t *Bytes, uint16_t Len );
void PrintSymbs( float *Symbs, uint16_t Len );
void PrintSamps( complex *Samples, uint32_t Len );
void PrintTable( freqmap *InTable );
void WriteSamplesCsv( complex *InSamps, uint32_t Len, uint32_t SampRate, uint8_t Label );
void WriteBBSamplesBin( complex *InSamps, uint32_t Len, uint8_t Label );



/*** MAIN FUNCTION ***/

int main(){

	uint8_t InfoBytes[ByteLen];
	float FreqSymbs[SymbLen];
	complex FskSamps[SampLen];
	complex CpfskSamps[SampLen];
	complex GfskSamps[SampLen];
	complex SdrSamps[SampLenSDR];
	freqmap FreqTable;
	
	CheckParam();															// Check the parameters correctness
#if 1
	RandGen(InfoBytes);														// Random generation of source stream
#else
	GenUpktSitael(InfoBytes);
#endif
	GetFreqTable(&FreqTable);												// Retrieve the mapping table between bits and FSK constellation
	FreqMapper(InfoBytes,FreqSymbs,&FreqTable);								// Convert input bits into symbols
	FskModulatorBB(FreqSymbs,FskSamps);										// Get FSK modulated signal
	CpfskModulatorBB(FreqSymbs,CpfskSamps);									// Get CPFSK modulated signal
	GfskModulatorBB(FreqSymbs,GfskSamps);									// Get GFSK modulated signal

	PrintParam();
	PrintTable(&FreqTable);
	PrintBytes(InfoBytes,ByteLen);
//	PrintSymbs(FreqSymbs,SymbLen);
//	PrintSamps(FskSamps,SampLen);
//	WriteSamplesCsv(FskSamps,SampLen,FsBB,FSK);
//	WriteSamplesCsv(CpfskSamps,SampLen,FsBB,CPFSK);
//	WriteSamplesCsv(GfskSamps,SampLen,FsBB,GFSK);

	LinResamplingC(FskSamps,SdrSamps,SampLen,SampLenSDR,FsBB,FsSDR);		// Resample the FSK signal to match SDR sample rate
	WriteBBSamplesBin(SdrSamps,SampLenSDR,FSK_SDR);							// Write FSK complex samples (as crossed float) into binary file
	LinResamplingC(CpfskSamps,SdrSamps,SampLen,SampLenSDR,FsBB,FsSDR);		// Resample the CPFSK signal to match SDR sample rate
	WriteBBSamplesBin(SdrSamps,SampLenSDR,CPFSK_SDR);						// Write CPFSK complex samples (as crossed float) into binary file
	LinResamplingC(GfskSamps,SdrSamps,SampLen,SampLenSDR,FsBB,FsSDR);		// Resample the GFSK signal to match SDR sample rate
	WriteBBSamplesBin(SdrSamps,SampLenSDR,GFSK_SDR);						// Write GFSK complex samples (as crossed float) into binary file

}



/*** CODING FUNCTIONS ***/

/**
 *	Function for checking the parameters correctness.
 **/
void CheckParam( void ){
	if ( log2((float)M) != round(log2((float)M)) ){
		printf("\n ERROR : Invalid modulation order (M)\n");
		exit(1);
	} else if ( BitLen % L ){
		printf("\n ERROR : Invalid number of bits\n");
		exit(1);
	} else if ( osf < 2 ){
		printf("\n ERROR : Invalid oversampling factor\n");
		exit(1);
	} else if ( (SampLen < 2) || (SampLenSDR < 2) ){
		printf("\n ERROR : Invalid sample-length\n");
		exit(1);
	}
}


/**
 *	Function for getting the mapping table between bit sets and FSK symbols according
 *	to Gray Coding.
 **/
void GetFreqTable( freqmap *IoTable ){
	uint8_t j;
	uint8_t GrayArray[M];
	int MaxVal = M-1;
	GetGray(GrayArray);
	for ( j=0; j<M; j++ ){
		IoTable->Bits[j] = GrayArray[j];
		IoTable->Symbs[j] = -MaxVal+2*j;
	}
}


/**
 *	Function for retrieving the Gray coded vector of length M.
 **/
void GetGray( uint8_t *IoArray ){
	uint8_t i, WrIdx, Counter;
	uint8_t Nblk, Shift;
	uint8_t Mask = 0x01;
	memset(IoArray,0,M);
	for ( i=0; i<L; i++ ){
		Nblk = M/(1<<i);													// Number of bits per block at i-th iteration
		Shift = L-i-1;														// Bit shift value at i-th iteration								
		Counter = 0;														// Counter within each single block
		WrIdx = Nblk/2;														// Starting value of the writing index
		while ( WrIdx < M ){
			IoArray[WrIdx] |= (Mask<<Shift);
			if ( Counter < (Nblk-1) ){
				Counter++;
			} else {
				Counter = 0;
				WrIdx += Nblk;
			}
			WrIdx++;
		}
	}
}


/**
 * Function for mapping an input bit stream into the frequency constellation
 * symbols specified by Table.
 **/
void FreqMapper( uint8_t *InBytes, float *OutSymbs, freqmap *Table ){
	uint8_t i, BitIdx;
	uint16_t ByteIdx;
	uint16_t j = 0;
	int8_t CurBits = 0;
	uint8_t SymbIdx = 0;
	uint8_t Mask = 0x01;
	uint16_t BitLen = ByteLen<<3;
	while ( j < BitLen ){
		SymbIdx++;
		ByteIdx = j>>3;
		BitIdx = (uint8_t)(7-(j&0x0007));
		CurBits |= ((InBytes[ByteIdx]>>BitIdx)&Mask)<<(L-SymbIdx);
		if ( SymbIdx == L ){
			for ( i=0; i<M; i++ ){
				if ( Table->Bits[i] == CurBits ){
					OutSymbs[(j+1)/L-1] = dev*Table->Symbs[i];
					break;
				}
			}
			SymbIdx = 0;
			CurBits = 0;
		}
		j++;
	}
}


/**
 * Function for modulating the input frequency-mapped symbols into the complex
 * I/Q FSK (Frequency Shift Keying) baseband waveform.
 **/
void FskModulatorBB( float *InSymbs, complex *OutSamps ){
	uint32_t i;
	float Time;															// Sampling instant
	float FreqShift[SampLen];												// Temporary sample stream representing frequency shift in time
	Upsampling(InSymbs,FreqShift,SampLen,osf,REPEAT);						// Upsample with repetition to pass from symbols to samples (frequency shift in time)
	for ( i=0; i<SampLen; i++ ){
		Time = TsBB*i;
		OutSamps[i].Re = cos(2*pi*Time*FreqShift[i]);						// Get the in-phase part of the baseband signal 
		OutSamps[i].Im = sin(2*pi*Time*FreqShift[i]);						// Get the quadrature part of the baseband signal 
	}
}


/**
 * Function for upsammpling the incoming float-stream by the specified input factor
 * implementing ZERO or REPEAT method.
 **/
void Upsampling( float *InStream, float *OutStream, uint32_t OutLen, uint8_t UpFactor, uint8_t Mode ){
	uint32_t i;
	if ( Mode == REPEAT ){
		for ( i=0; i<OutLen; i++ )
			OutStream[i] = InStream[i/UpFactor];
	} else if ( Mode == ZERO ){
		for ( i=0; i<OutLen; i++ ){
			if ( i%UpFactor == 0 )
				OutStream[i] = InStream[i/UpFactor];
			else
			OutStream[i] = 0;
		}
	}
}


/**
 * Function for linearly resampling the incoming real waveform from FsIn to FsOut sample rate.
 **/
void LinResamplingR( float *InStream, float *OutStream, uint32_t InLen, uint32_t OutLen, uint32_t FsIn, uint32_t FsOut ){
	uint32_t i;
	uint32_t j = 1;
	float m, q, TimeOut;
	float TsIn = 1.0/FsIn;													// Original sample period
	float TsOut = 1.0/FsOut;												// Target sample period
	float TimeAxisIn[InLen];
	for ( i=0; i<InLen; i++ )
		TimeAxisIn[i] = i*TsIn;
	OutStream[0] = InStream[0];
	for ( i=1; i<OutLen; i++){
		TimeOut = i*TsOut;
		while ( !((TimeOut >= TimeAxisIn[j-1]) && (TimeOut <= TimeAxisIn[j])) ){
			j++;
		}
		m = (InStream[j]-InStream[j-1])/(TimeAxisIn[j]-TimeAxisIn[j-1]);	// Slope of the line
		q = InStream[j-1]-m*TimeAxisIn[j-1];								// Y-intercept of the line
		OutStream[i] = m*TimeOut+q;
	}
}


/**
 * Function for linearly resampling the incoming complex waveform from FsIn to FsOut sample rate.
 **/
void LinResamplingC( complex *InStream, complex *OutStream, uint32_t InLen, uint32_t OutLen, uint32_t FsIn, uint32_t FsOut ){
	uint32_t i;
	uint32_t j = 1;
	float m, q, OutTime;
	float TsIn = 1.0/FsIn;
	float TsOut = 1.0/FsOut;
	float InTimeAxis[InLen];
	for ( i=0; i<InLen; i++ )
		InTimeAxis[i] = i*TsIn;
	OutStream[0].Re = InStream[0].Re;
	OutStream[0].Im = InStream[0].Im;
	for ( i=1; i<OutLen; i++){
		OutTime = i*TsOut;
		while ( !((OutTime >= InTimeAxis[j-1]) && (OutTime <= InTimeAxis[j])) )
			j++;
		m = (InStream[j].Re-InStream[j-1].Re)/(InTimeAxis[j]-InTimeAxis[j-1]);
		q = InStream[j-1].Re-m*InTimeAxis[j-1];
		OutStream[i].Re = m*OutTime+q;
		m = (InStream[j].Im-InStream[j-1].Im)/(InTimeAxis[j]-InTimeAxis[j-1]);
		q = InStream[j-1].Im-m*InTimeAxis[j-1];
		OutStream[i].Im = m*OutTime+q;
	}
}


/**
 * Function for integrating the input real signal, providing as input also its sample period.
 **/
void IntergatorR( float *InSamps, float *OutSamps, uint32_t SampLen, float Ts ){
	uint32_t j;
	float LastOut = 0;
	for ( j=0; j<SampLen; j++ ){
		LastOut += Ts*InSamps[j];
		OutSamps[j] = LastOut;
	}
}


/**
 * Function for integrating the input complex signal, providing as input also its sample period.
 **/
void IntergatorC( complex *InSamps, complex *OutSamps, uint32_t SampLen, float Ts ){
	uint32_t j;
	complex LastOut = {.Re = 0, .Im = 0};
	for ( j=0; j<SampLen; j++ ){
		LastOut.Re += Ts*InSamps[j].Re;
		OutSamps[j].Re = LastOut.Re;
		LastOut.Im += Ts*InSamps[j].Im;
		OutSamps[j].Im = LastOut.Im;
	}
}


/**
 * Function for modulating the input frequency-mapped symbols into the complex
 * I/Q CPFSK (Continuous-Phase Frequency Shift Keying) baseband waveform.
 **/
void CpfskModulatorBB( float *InSymbs, complex *OutSamps ){
	uint32_t i;
	float FrPhShift[SampLen];											// Temporary sample stream representing frequency and phase shift in time
	Upsampling(InSymbs,FrPhShift,SampLen,osf,REPEAT);					// Upsample with repetition to pass from symbols to samples (frequency shift in time)
	IntergatorR(FrPhShift,FrPhShift,SampLen,TsBB);						// Integrate to pass from frquency to phase shift in time
	for ( i=0; i<SampLen; i++ ){
		OutSamps[i].Re = cos(2*pi*FrPhShift[i]);						// Get the in-phase part of the baseband signal 
		OutSamps[i].Im = sin(2*pi*FrPhShift[i]);						// Get the quadrature part of the baseband signal 
	}
}


/**
 *	Function for getting the Gaussian filter taps as a function of
 *	parameters sps, span and BT product (aka beta).
 **/
void GetGaussTaps( float *Taps, float beta, uint8_t span, uint8_t sps ){
	uint16_t j;
	float Time;
	float alpha = sqrt(log(2)/2)/beta;
	uint16_t Ntaps = span*sps+1;
	for ( j=0; j<Ntaps; j++ ){
		Time = (j-(float)sps*span/2)/sps;
		Taps[j] = sqrt(pi)/alpha*exp(-pow(pi*Time/alpha,2));
	}
	ScaleGaussTaps(Taps,Ntaps);
}


/**
 *	Function for scaling the SRRC filter taps amplitude.
 **/
void ScaleGaussTaps( float *Taps, uint16_t Ntaps ){
	uint16_t j;
	float Sum = 0;
	for ( j=0; j<Ntaps; j++ )
		Sum += Taps[j];
	for ( j=0; j<Ntaps; j++ )
		Taps[j] /= Sum;
}


/**
 *	Function for performing finite impulse response (FIR) filtering according
 *	to the specified taps on the input real sample stream.
 **/
void FirFilterR( float *InSamps, float *OutSamps, float *Taps, uint16_t Ntaps ){
	uint16_t i, j;
	uint16_t FirDelay = (Ntaps-1)/2;
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
 * Function for modulating the input frequency-mapped symbols into the complex
 * I/Q GFSK (Gaussian Frequency Shift Keying) baseband waveform.
 **/
void GfskModulatorBB( float *InSymbs, complex *OutSamps ){
	uint32_t i;
	uint16_t Ntaps = span*sps+1;										// Number of Gaussian taps
	float FreqPhShift[SampLen];										// Temporary sample stream representing frequency/phase shift in time
	float GaussTaps[Ntaps];											// Gaussian taps for FIR filtering
	Upsampling(InSymbs,FreqPhShift,SampLen,osf,REPEAT);					// Upsample with repetition to pass from symbols to samples (frequency shift in time)
	GetGaussTaps(GaussTaps,beta,span,sps);								// Retrieve Gaussian filter taps
	FirFilterR(FreqPhShift,FreqPhShift,GaussTaps,Ntaps);				// Gaussian FIR filtering
	IntergatorR(FreqPhShift,FreqPhShift,SampLen,TsBB);					// Integrate to pass from frquency to phase shift in time
	for ( i=0; i<SampLen; i++ ){
		OutSamps[i].Re = cos(2*pi*FreqPhShift[i]);						// Get the in-phase part of the baseband signal 
		OutSamps[i].Im = sin(2*pi*FreqPhShift[i]);						// Get the quadrature part of the baseband signal 
	}
}



/*** EXTRA FUNCTIONS ***/

/**
 *	Function for filling the input array with random bytes (integer values from 0 to 255).
 **/
void RandGen( uint8_t *IoBytes ){
	uint16_t j;
	srand(time(NULL));													// Link random seed to actual time
	if ( IoBytes != NULL ){
		for ( j=0; j<ByteLen; j++ ){
			IoBytes[j] = (uint8_t)rand();
		} 
	}
}


/**
 *	Function for printing parameters on terminal.
 **/
void PrintParam( void ){
	printf("\n * PARAMETERS\n");
	printf("\tM = %d\n",M);
	printf("\tRb = %1.1f kb/s\n",Rb/1e3);
	printf("\th = %1.2f\n",h);
	printf("\tFsBB = %1.1f kSa/s\n",FsBB/1e3);
	printf("\tNB: For optimal SDR Fs matching use osf >= %d\n",(int)round((float)FsSDR/Rs));
	printf("\n");
}


/**
 *	Function for printing on terminal (in hexadecimal format) the input byte-array content.
 **/
void PrintBytes( uint8_t *Bytes, uint16_t Len ){
	uint16_t j;
	printf(" - INFO BYTES (%d)\n\t",Len);
	for ( j=0; j<Len; j++){
		printf("%2X ",Bytes[j]);
		if ( (j%20 == 19) && (j<(Len-1)) ) {
			printf("\n\t");
		}
	}
	printf("\n\n");
}


/**
 *	Function for printing on terminal the input symbol-array content.
 **/
void PrintSymbs( float *Symbs, uint16_t Len ){
	uint16_t j;
	printf(" - MAPPED SYMBOLS (%d)\n\t",Len);
	for ( j=0; j<Len; j++){
		if ( Symbs[j] > 0)
			printf("+");
		printf("%1.0f ",Symbs[j]);
		if ( (j%10 == 9) && (j<(Len-1)) ) {
			printf("\n\t");
		}
	}
	printf("\n\n");
}


/**
 *	Function for printing on terminal the input sample-array content.
 **/
void PrintSamps( complex *Samples, uint32_t Len ){
	uint32_t j;
	printf(" - FSK SAMPLES (%d)\n\t",Len);
	for ( j=0; j<Len; j++ ){
		if ( Samples[j].Re > 0){
			printf("+");
		}
		printf("%1.2f",Samples[j].Re);
		if ( Samples[j].Im > 0){
			printf("+");
		}
		printf("%1.2fi | ",Samples[j].Im);
		if ( (j%5 == 4) && (j<(Len-1)) ) {
			printf("\n\t");
		}
	}
	printf("\n\n");
}


/**
 *	Function for printing on terminal the constellation mapping table.
 **/
void PrintTable( freqmap *InTable ){
	uint16_t j;
	printf(" - PSK MAPPING TABLE\n\t");
	for ( j=0; j<M; j++){
		printf("%2d : ",InTable->Bits[j]);
		if ( InTable->Symbs[j] >= 0){
			printf("+");
		}
		printf("%d",InTable->Symbs[j]);
		if ( (j%4 == 3) || (j==(M-1)) )
			printf("\n\t");
		else
			printf(" |");
	}
	printf("\n");
}


/**
 *	Function for writing the input complex sample stream and relative
 *	sample rate (as final value) into a csv file.
 **/
void WriteSamplesCsv( complex *InSamps, uint32_t Len, uint32_t SampRate, uint8_t Label ){
	uint32_t j;
	FILE *fid;
	if ( Label == FSK )
		fid = fopen("FskSamps.csv","w");
	else if ( Label == CPFSK )
		fid = fopen("CpfskSamps.csv","w");
	else if ( Label == GFSK )
		fid = fopen("GfskSamps.csv","w");
	else if ( Label == FSK_SDR )
		fid = fopen("FskSdrSamps.csv","w");
	else if ( Label == CPFSK_SDR )
		fid = fopen("CpfskSdrSamps.csv","w");
	else if ( Label == GFSK_SDR )
		fid = fopen("GfskSdrSamps.csv","w");
	if (fid != NULL){
		for ( j=0; j<Len; j++ ){
			fprintf(fid,"%1.4f,%1.4f,",InSamps[j].Re,InSamps[j].Im);
		}
		fprintf(fid,"%1.2f",(float)SampRate);
	}
	fclose(fid);
}


/**
 *	Function for writing the input complex sample stream into a binary file.
 **/
void WriteBBSamplesBin( complex *InSamps, uint32_t Len, uint8_t Label ){
	uint32_t j;
	FILE *fid;
	float CrossData[2*Len];
	if ( Label == FSK_SDR )
		fid = fopen("Fsk_BB_Cpp","wb");
	else if ( Label == CPFSK_SDR )
		fid = fopen("Cpfsk_BB_Cpp","wb");
	else if ( Label == GFSK_SDR )
		fid = fopen("Gfsk_BB_Cpp","wb");
	if (fid != NULL){
		for ( j=0; j<Len; j++ ){
			CrossData[2*j] = (float)InSamps[j].Re;
			CrossData[2*j+1] = -(float)InSamps[j].Im;
		}
		fwrite(CrossData,sizeof(CrossData),1,fid);
	}
	fclose(fid);
}


/**
 *	Function for generating SITAEL missions U-packets (ESEO or uHETsat).
 **/
void GenUpktSitael( uint8_t *IoBytes ){
	uint8_t j;
	if ( ByteLen != 48 ){
		printf(" ERROR: uHETsat packet length must be 48 bytes\n");
		exit(1);
	} else if ( M != 2 ){
		printf(" ERROR: uHETsat modulation order must be 2\n");
		exit(1);
	} else if ( (Rb != 9600) && (Rb != 38600) && (Rb != 77200) ){
		printf(" ERROR: uHETsat data rate must be 9.6, 38.6 or 77.2 kb/s\n");
		exit(1);
	} else if ( h != 1 ){
		printf(" ERROR: uHETsat modulation index must be 1\n");
		exit(1);
	}
	uint8_t Upkt[48] = {0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xD3, 0x91,
                     	0xD3, 0x91, 0x21, 0x5A, 0x04, 0xB9, 0xFA, 0x95, 0xFD, 0x44,
                     	0x0E, 0x11, 0xA8, 0xA6, 0x92, 0x81, 0xCF, 0x52, 0x47, 0x25,
                     	0xCA, 0xEE, 0x9D, 0x0A, 0xA7, 0x2F, 0x57, 0xBB, 0x85, 0xE6,
                     	0xF1, 0xA3, 0xB4, 0x4A, 0x35, 0x33, 0x22, 0x22};
	for ( j=0; j<48; j++ )
		Upkt[j] = ~Upkt[j];
	memcpy(IoBytes,Upkt,48);
}
