
/**
 * @file main.c
 * @author Filippo Valmori
 * @date 14/12/2018
 * @brief Main file for executing Tx/RX chain simulation.
 */


/****************/
/*** INCLUDES ***/
/****************/

#include "convolutional.h"															/** Add convolutional coding library */
#include "modulation.h"																/** Add modulation library */
#include "extra.h"																	/** Add simulation and debug library */



/************/
/*** MAIN ***/
/************/

int main(){

	trellis ConvDiagr;																/** Convolutional decoder trellis diagram */
	phasemap ModTable;																/** Constellation mapping table */
	uint8_t ConVect[2]; 															/** Convolutional connector vector */
	uint8_t PunctVect[2*Rc];														/** Convolutional puncturing vector */
	uint8_t TxSrcByt[SrcBytLen], RxSrcByt[SrcBytLen];								/** TX and RX source info stream */
	uint8_t TxConvByt[DepBytLen], DemByt[DepBytLen];								/** TX and RX convolutional depunctured stream */
	float SoftLLR[DepBitLen];														/** RX soft LLR stream */
	complex ChSym[SymLen];															/** Complex modulated symbol stream passing through channel */

 	CheckParam();																	/** Check parameters correctness */
	PrintParam();																	/** Print parameters on terminal */

	RandBytGen(TxSrcByt);															/** Random generation of source info stream */
	PrintByt(TxSrcByt,SrcBytLen,TXINFOB);											/** Print TX source info stream on terminal */
	// WriteBytCsv(TxSrcByt,SrcBytLen,TXINFOB);									    /** Write TX source info stream into .csv file */

	GetConvCP(ConVect,PunctVect);													/** Retrieve convolutional encoder setting */
	ConvEncoder(TxSrcByt,TxConvByt,ConVect,PunctVect);								/** Convolutional encoding */

	switch( ModType ){
		case PSK:
			GetPskTable(&ModTable);													/** Get PSK constellation mapping table */
			break;
		case QAM:
			GetQamTable(&ModTable);													/** Get QAM constellation mapping table */
			break;
		default:
			break;
	}
	Mapper(TxConvByt,ChSym,&ModTable);												/** Map bits into modulated symbols */
	// PrintSym(ChSym,SymLen,TXSYMB);													/** Print TX symbol stream on terminal */
	// WriteSymCsv(ChSym,SymLen,TXSYMB);												/** Write TX symbol stream into .csv file */

	ChanAWGN(ChSym);																/** AWGN channel simulation */
	// PrintSym(ChSym,SymLen,RXSYMB);												/** Print RX symbol stream on terminal */
	// WriteSymCsv(ChSym,SymLen,RXSYMB);												/** Write RX symbol stream into .csv file */
	GetTrellis(ConVect,&ConvDiagr);													/** Get convolutional decoder trellis diagram */

	if ( VitDecMth == HARD ){
		HardDemapper(ChSym,DemByt,&ModTable);										/** Hard demapping (symbol to bit conversion) */
		CheckWrongBits(TxConvByt,DemByt,PunBytLen,RXCCB);							/** Check number of corrupted bits before convolutional decoding */
		HardConvDecoder(DemByt,RxSrcByt,&ConvDiagr,PunctVect);						/** Viterbi hard decoding */
	} else if ( VitDecMth == SOFT ){	
		SoftDemapper(ChSym,SoftLLR,&ModTable);										/** Soft demapping (symbol to LLR conversion) */
		SoftConvDecoder(SoftLLR,RxSrcByt,&ConvDiagr,PunctVect);						/** Viterbi soft decoding */
	}

	PrintByt(RxSrcByt,SrcBytLen,RXINFOB);											/** Print RX source info stream on terminal */
	CheckWrongBits(TxSrcByt,RxSrcByt,SrcBytLen,RXINFOB);							/** Check number of corrupted bits after convolutional decoding */

	return 1;

}



/*************/
/*** NOTES ***/
/*************/

/*
 * 1. To run the project, use the following command :
 *	  cls && gcc -c extra.c convolutional.c modulation.c main.c && gcc extra.o convolutional.o modulation.o main.o -o asd && asd
 */
