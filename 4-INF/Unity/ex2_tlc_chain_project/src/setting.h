
/**
 * @file setting.h
 * @author Filippo Valmori
 * @date 14/12/2018
 * @brief Main header with all simulation parameters.
 */

#ifndef GENERAL_H
#define GENERAL_H


/****************/
/*** INCLUDES ***/
/****************/

#include <stdio.h>																	/** Standard I/O library */
#include <stdbool.h>																	/** To use boolean type */
#include <stdint.h>																	/** To use well-defined integer types */
#include <string.h>																	/** To use "memcpy" and "memset" functions */
#include <stdlib.h>																	/** To generate random values */
#include <time.h>																	/** To link random seed to actual time */
#include <math.h>																	/** To use "sin", "cos", "log" and "exp" functions */



/******************/
/*** PARAMETERS ***/
/******************/

#define SrcBytLen		(uint32_t)100												/** Source info stream byte-length [B] (NB: Max value = 1000) */
#define Rc				RATE_23														/** Convolutional code rate, Rc = k/n */
#define K				(uint8_t)7u													/** Convolutional constrain length (NB: 8 max.) */
#define	MemFact			(uint16_t)10												/** Viterbi decoder memory factor */
#define VitDecMth		HARD														/** Viterbi decoding method */
#define ModType			PSK															/** Modulation type */
#define M				(uint8_t)4u													/** Modulation order */
#define EbN0			(float)5													/** Energy-per-bit-to-noise-power-spectral-density ratio over AWGN channel [dB] (NB: SNR=Eb/N0*log2(M)/sps) */



/**************/
/*** MACROS ***/
/**************/

#define G				(uint8_t[6][2]) {{7,5},{15,11},{23,25},{47,53}, \
							{79,109},{159,229}}										/** Convolutional connector vectors for each K */
#define PUNCT_23 		(uint8_t[4]) {1,1,0,1}										/** Puncturing vector for Rc = 2/3 */
#define PUNCT_34 		(uint8_t[6]) {1,1,0,1,1,0}									/** Puncturing vector for Rc = 3/4 */
#define PUNCT_56 		(uint8_t[10]) {1,1,0,1,1,0,0,1,1,0}							/** Puncturing vector for Rc = 5/6 */
#define PUNCT_78 		(uint8_t[14]) {1,1,0,1,0,1,0,1,1,0,0,1,1,0}					/** Puncturing vector for Rc = 7/8 */
#define RATE_12 		(uint8_t)1													/** 1/2 convolutional code rate */
#define RATE_23			(uint8_t)2													/** 2/3 convolutional code rate */
#define RATE_34			(uint8_t)3													/** 3/4 convolutional code rate */
#define RATE_56			(uint8_t)5													/** 5/6 convolutional code rate */
#define RATE_78			(uint8_t)7													/** 7/8 convolutional code rate */
#define N_TSTAT 		(uint8_t)(1<<(K-1))											/** Number of trellis states */
#define MEM_DIM 		(uint16_t)(N_TSTAT*MemFact)									/** Viterbi decoder memory dimension for survivor paths storage */ 
#define HARD 			(uint8_t)13u												/** Viterbi hard decoding method ID */
#define SOFT 			(uint8_t)14u												/** Viterbi soft decoding method ID */

#define L				(uint8_t)log2(M)											/** Number of modulated bits per symbol */
#define PhOfst			(float)(M_PI/M)                               				/** Constellation phase offset [rad] */
#define SymLen			(uint32_t)PunBitLen/L										/** Mapped stream symbol-length [S] */
#define PSK 			(uint8_t)30													/** PSK modulation ID */
#define QAM 			(uint8_t)31													/** QAM modulation type */

#define SrcBitLen 		(uint32_t)(SrcBytLen<<3)									/** Source info stream bit-length [b] */
#define DepBytLen		(uint32_t)(2*SrcBytLen)										/** Depunctured convolutional coded byte-length [B] */
#define DepBitLen		(uint32_t)(DepBytLen<<3)									/** Depunctured convolutional coded bit-length [b] */
#define PunBytLen		(uint32_t)(SrcBytLen*(Rc+1)/Rc)								/** Punctured convolutional coded byte-length [B] */
#define PunBitLen		(uint32_t)(PunBytLen<<3)									/** Punctured convolutional coded bit-length [b] */



/****************/
/*** TYPEDEFS ***/
/****************/

typedef struct TD1 {
	uint8_t OutBits[2];
	uint8_t NextState[2];
} info;

typedef struct TD2 {
	info States[N_TSTAT];
} trellis;

typedef struct TD3 {
	uint32_t Iter[N_TSTAT];
	uint32_t Dist[N_TSTAT];
	uint8_t Path[N_TSTAT][MEM_DIM];
} vitdech;

typedef struct TD4 {
	uint32_t Iter[N_TSTAT];
	float Dist[N_TSTAT];
	uint8_t Path[N_TSTAT][MEM_DIM];
} vitdecs;

typedef struct TD5 {
	float Re;
	float Im;
} complex;

typedef struct TD6 {
	uint8_t Bits[M];
	complex Symbs[M];
} phasemap;


#endif