
/** LIBRARIES **/

#include <iostream>
#include <complex>
#include <math.h>
#include <stdint.h>
#include <time.h>
using namespace std;



/** PROTOTYPES **/

uint32_t GetLenFft( uint32_t InLen );
void FFT( complex<double> *InSgn, uint32_t InLen, complex<double> *OutSpc, uint32_t OutLen );
void RevOrd( complex<double>* Vect, uint32_t Len );
uint32_t GetRevIdx(uint32_t Len, uint32_t InIdx);
void DFT( complex<double> *InSgn, uint32_t InLen, complex<double> *OutSpc );
void WriteSamplesBin( complex<double> *Vect, uint32_t Len, char Label );



/** MAIN FUNCTION **/

int main(){

  FILE *fptr = NULL;
  uint32_t ByteLen = 0;
  uint32_t InLen = 0;
  fptr = fopen("WaveIn","rb");                                          // MATLAB binary file where to read waveform
  if ( fptr == NULL ){
      printf("ERROR : unable to open file!\n");
      exit(-1);
  }
  fseek(fptr, 0L, SEEK_END);
  ByteLen = ftell(fptr);
  fseek(fptr, 0L, SEEK_SET);
  InLen = ByteLen/sizeof(complex<double>);                              // Estimate automatically the length of the input stream
  complex<double> InSgn[InLen];
  fread(InSgn,1,ByteLen,fptr);                                          // Read and store the complex waveform
  fclose(fptr);

  clock_t Tstr, Tend;                                                   // Variables for execution time estimates
  double Tcpu;
  uint32_t LenFft = GetLenFft(InLen);                                   // Calculate the FFT stream length
  complex<double> SpcFft[LenFft];
  Tstr = clock();
  FFT(InSgn, InLen, SpcFft, LenFft);                                    // Calculate FFT of input waveform
  Tend = clock();
  Tcpu = ((double) (Tend - Tstr)) / CLOCKS_PER_SEC;                     // Estimate the execution time of FFT
  cout << " * Execution Time FFT = " << Tcpu << " s" << endl;
  Tstr = clock();
  complex<double> SpcDft[InLen];
  DFT(InSgn, InLen, SpcDft);                                            // Calculate DFT of input waveform
  Tend = clock();
  Tcpu = ((double) (Tend - Tstr)) / CLOCKS_PER_SEC;                     // Estimate the execution time of DFT
  cout << " * Execution Time DFT = " << Tcpu << " s" << endl;
  WriteSamplesBin(SpcFft,LenFft,'F');                                   // Write FFT output samples into the corresponding binary file
  WriteSamplesBin(SpcDft,InLen,'D');                                    // Write DFT output samples into the corresponding binary file

  return 0;

}



/** EXTRA FUNCTIONS **/

/**
 * Function for calculating the FFT length by rounding to nearest upper power of 2.
 **/
uint32_t GetLenFft( uint32_t InLen ){

  uint32_t OutLen = 0x00000001;
  if ( (InLen>0) && (InLen&(InLen-1)) != 0 ){                           // Check if current length is a power of 2
    while ( OutLen < InLen ){
      OutLen <<= 1;
    }
  } else {
    OutLen = InLen;
  }
  return OutLen;

}


/**
 * Function for calculating the Discrete Fourier Transform (DFT) with the optimized
 * Cooley-Tukey FFT algorithm.
 **/
void FFT( complex<double> *InSgn, uint32_t InLen, complex<double> *OutSpc, uint32_t OutLen ){

  uint32_t i, j;
  uint32_t n = 1;
  uint32_t k = OutLen/2;
  complex<double> W[k];
  complex<double> Tmp1, Tmp2;

  for ( j=0; j<InLen; j++ ){
    OutSpc[j] = InSgn[j];
  }
  for ( j=InLen; j<OutLen; j++ ){
    OutSpc[j] = 0;
  }

  RevOrd(OutSpc,OutLen);                                                // Rearrange the vector in reverse order
  W[0] = 1;                                                             // Estimate the twiddle factors
  W[1] = polar(1.0,-2.*M_PI/(OutLen));             
  for ( i=2; i<k; i++ )
    W[i] = pow(W[1],i);

  for ( i=0; i<log2(OutLen); i++ ){
    for ( j=0; j<OutLen; j++ ){
      if ( !(j&n) ) {
        Tmp1 = OutSpc[j];
        Tmp2 = W[(j*k)%(n*k)]*OutSpc[j+n];
        OutSpc[j] = Tmp1+Tmp2;
        OutSpc[j+n] = Tmp1-Tmp2;
      }
    }
    n *= 2;
    k = k/2;
  }

}


/**
 * Function for rearranging the elements in reverse order.
 **/
void RevOrd( complex<double>* Vect, uint32_t Len ){

  uint32_t j;
  complex<double> Tmp[Len];
  for( j=0; j<Len; j++ )
    Tmp[j] = Vect[GetRevIdx(Len,j)];
  for ( j=0; j<Len; j++ )
    Vect[j] = Tmp[j];

}


/**
 * Function for reversing the input index as a function of the vector length.
 **/
uint32_t GetRevIdx( uint32_t Len, uint32_t InIdx ){

  uint32_t j;
  uint32_t OutIdx = 0;
  uint32_t L = log2(Len);
  for ( j=0; j<L; j++ ){
    if ( InIdx & (1 << (L-j-1)) )
      OutIdx |= (1<<j);
  }
  return OutIdx;
}


/**
 * Function for calculating the Discrete Fourier Transform (DFT) in its
 * standard form.
 **/
void DFT( complex<double> *InSgn, uint32_t InLen, complex<double> *OutSpc ){

  uint32_t i, j;
  for ( j=0; j<InLen; j++ ){
    OutSpc[j] = 0;
  }
  for ( i=0; i<InLen; i++ ){
    for ( j=0; j<InLen; j++ ){
      OutSpc[i] = OutSpc[i]+InSgn[j]*polar(1.0,-2*M_PI*i*j/InLen);
    }
  }

}



/** EXTRA FUNCTIONS **/

/**
 *	Function for writing the input complex sample stream into a binary file.
 **/
void WriteSamplesBin( complex<double> *Vect, uint32_t Len, char Label ){

	uint32_t j;
	FILE *fid;
	float CrossData[2*Len];

	if ( Label == 'F' )
		fid = fopen("CppFFT","wb");
	else if ( Label == 'D' )
		fid = fopen("CppDFT","wb");

	if (fid != NULL){
		for ( j=0; j<Len; j++ ){
			CrossData[2*j] = (float)real(Vect[j]);
			CrossData[2*j+1] = (float)imag(Vect[j]);
		}
		fwrite(CrossData,sizeof(CrossData),1,fid);
	}
	fclose(fid);

}
