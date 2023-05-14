/* -*- c++ -*- */
/* 
 * Copyright 2022 <+YOU OR YOUR COMPANY+>.
 * 
 * This is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 3, or (at your option)
 * any later version.
 * 
 * This software is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this software; see the file COPYING.  If not, write to
 * the Free Software Foundation, Inc., 51 Franklin Street,
 * Boston, MA 02110-1301, USA.
 */

#ifdef HAVE_CONFIG_H
#include "config.h"
#endif

#include <gnuradio/io_signature.h>
#include "psk_mapper_c_bc_impl.h"

//#define VERBOSE                                                           // to enable debug printings

namespace gr {
  namespace zVKN {

    psk_mapper_c_bc::sptr
    psk_mapper_c_bc::make(int M, float PO, bool R)
    {
      return gnuradio::get_initial_sptr
        (new psk_mapper_c_bc_impl(M, PO, R));
    }

    /*
     * The private constructor
     */
    psk_mapper_c_bc_impl::psk_mapper_c_bc_impl(int M, float PO, bool R)
      : gr::block("psk_mapper_c_bc",
              gr::io_signature::make(1,1,sizeof(uint8_t)),
              gr::io_signature::make(1,1,sizeof(gr_complex))),
        ModOrd(M),                                                        // initialize modulation order
        Rotat(R)                                                          // initialize constellation rotation
    {
      PhOfst = 2*M_PI*PO/360;                                             // deg-to-rad convert and initialize constellation phase offset (recommended value is pi/M) [rad]
      UpdateParamM(M);                                                    // initialize alla parameters related to modulation order
      GetPskTable(&PskTable);                                             // retrieve PSK mapping table
      message_port_register_in(pmt::mp("port_in"));                       // set "port_in" as input port for blob messages
      set_msg_handler(pmt::mp("port_in"),boost::bind(&psk_mapper_c_bc_impl::change_param_handler,this,_1));      // set "appender_handler" as the function to be executed each time a message is received at "port_in"
    }


    /*
     * Our virtual destructor.
     */
    psk_mapper_c_bc_impl::~psk_mapper_c_bc_impl(){
    }


    /*
     * Function executed each time a new message is received on "port_in".
     */
    void psk_mapper_c_bc_impl::change_param_handler(pmt::pmt_t msg_in){
      char *buf_in;
      uint8_t len_in;
      pmt::pmt_t data_in = pmt::cdr(msg_in);                              // extract blob content of the input message by removing the extra meta-data
      len_in = pmt::blob_length(data_in);                                 // get the input message data length (in char)
      buf_in = (char *)calloc(len_in,sizeof(char));                       // allocate size for the input char stream
      memcpy(buf_in,pmt::blob_data(data_in),len_in*sizeof(char));         // convert and copy the content of the input message from blob to char array
      char Param = buf_in[0];                                             // save parameter ID
#ifdef VERBOSE
      uint8_t j;
      for ( j=0; j<len_in; j++ )
        printf("%c",buf_in[j]);
      printf("\n%d\n",len_in);
      printf("%d\n",Param);
#endif
      if( Param == 'M' ){
        int NewM;
        NewM = atoi(&buf_in[2]);                                          // string to interger conversion of message final part to retrieve new modulation order value
        ModOrd = NewM;                                                    // store new value into class local variable
        UpdateParamM(NewM);
        //printf(">>> %d\n",NewM);
      } else if( Param == 'O' ){
        float NewO;
        NewO = atoi(&buf_in[2]);                                          // NB: new offset value must be positive (thus to have, for example, an offset of -10 deg, type "... O 350")
        PhOfst = 2*M_PI*NewO/360;
      } else if( Param == 'R' ){
        bool NewR;
        NewR = atoi(&buf_in[2]);
        Rotat = NewR;
      } else {
        printf(" >> ERROR: Invalid update parameter!\n");
        exit(1);                                                          // abort execution
      }
      GetPskTable(&PskTable);                                             // recalculate mapping table
      free(buf_in);                                                       // release temporary input buffer from calloc
    }


   /*
    *	Function for updating internal variable related to modulation order.
    */
    void psk_mapper_c_bc_impl::UpdateParamM( int M ){
      L = log2(M);                                                        // update number of bits per symbol
      switch( M ){
        case 2 :
          Nfcast = 1;
          Nsom = 8;
          break;
        case 4 :
          Nfcast = 1;
          Nsom = 4;
          break;
        case 8 :
          Nfcast = 3;
          Nsom = 8;
          break;
        case 16 :
          Nfcast = 1;
          Nsom = 2;
          break;
        case 32 :
          Nfcast = 5;
          Nsom = 8;
          break;
        case 64 :
          Nfcast = 3;
          Nsom = 4;
          break;
        default :
          M = 4;                                                          // if the input modulation order is not valid, set it to 4 by default
          Nfcast = 1;
          Nsom = 4;
          break;
      }
      set_output_multiple(Nsom);                                          // force "noutput_items" to be a multiple of "Nsom" (complex symbols in this case) during each work cycle -> what is the minimum integer number of output symbols needed to map an integer number of input bytes?
    }


   /*
    *	Function for retrieving the Gray coded vector of length M.
    */
    void psk_mapper_c_bc_impl::GetGray( uint8_t *IoArray ){
      uint8_t i, WrIdx, Counter;
      uint8_t Nblk, Shift;
      uint8_t Mask = 0x01;
      memset(IoArray,0,ModOrd);
      for ( i=0; i<L; i++ ){
        Nblk = ModOrd/(1<<i);												                      // Number of bits per block at i-th iteration
        Shift = L-i-1;													                          // Bit shift value at i-th iteration								
        Counter = 0;													                            // Counter within each single block
        WrIdx = Nblk/2;													                          // Starting value of the writing index
        while ( WrIdx < ModOrd ){
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


   /*
    *	Function for getting the mapping table between bit sets and PSK symbols according
    *	to Gray Coding.
    */
    void psk_mapper_c_bc_impl::GetPskTable( phasemap *IoTable ){
      uint8_t j;
      uint8_t GrayArray[ModOrd];
      GetGray(GrayArray);
      for ( j=0; j<ModOrd; j++ ){
        IoTable->Bits[j] = GrayArray[j];
        if ( Rotat ){
          IoTable->Symbs[j].real() = cos(PhOfst+2*M_PI*j/ModOrd);
          IoTable->Symbs[j].imag() = sin(PhOfst+2*M_PI*j/ModOrd);
        } else {
          IoTable->Symbs[j].real() = cos(PhOfst-2*M_PI*j/ModOrd);
          IoTable->Symbs[j].imag() = sin(PhOfst-2*M_PI*j/ModOrd);
        }
      }
    }


   /*
    * Function for mapping an input bit stream into the constellation
    * symbols specified by Table.
    */
    void psk_mapper_c_bc_impl::Mapper( uint8_t *InBytes, size_t ByteLen, gr_complex *OutSymbs, phasemap *Table ){
      uint8_t i, BitIdx;
      uint16_t ByteIdx;
      uint16_t j = 0;
      int8_t CurBits = 0;
      uint8_t SymbIdx = 0;
      uint8_t Mask = 0x01;
      size_t BitLen = ByteLen<<3;
      while ( j < BitLen ){
        SymbIdx++;
        ByteIdx = j>>3;
        BitIdx = (uint8_t)(7-(j&0x0007));
        CurBits |= ((InBytes[ByteIdx]>>BitIdx)&Mask)<<(L-SymbIdx);
        if ( SymbIdx == L ){
          for ( i=0; i<ModOrd; i++ ){
            if ( Table->Bits[i] == CurBits ){
              OutSymbs[(j+1)/L-1] = Table->Symbs[i];
              break;
            }
          }
          SymbIdx = 0;
          CurBits = 0;
        }
        j++;
      }
    }


   /*
    * Forecast function.
    */
    void psk_mapper_c_bc_impl::forecast (int noutput_items, gr_vector_int &ninput_items_required){
      ninput_items_required[0] = Nfcast;                                  // force "ninput_items" to be a multiple of Nfcast (bytes in this case) -> what is the minimum integer number of input bytes that can be mapped into an integer number of output symbols?
    }


   /*
    * Work function.
    */
    int psk_mapper_c_bc_impl::general_work (int noutput_items,
                       gr_vector_int &ninput_items,
                       gr_vector_const_void_star &input_items,
                       gr_vector_void_star &output_items)
    {
      uint8_t *in = ( uint8_t *) input_items[0];                          // declaring this vector as constant would generate an error when called in Mapper() function!
      gr_complex *out = (gr_complex *) output_items[0];
      int Nin = 0;                                                        // number of input items (i.e. bytes) to consumed in the current work cycle
      int Nout = 0;                                                       // number of output items (i.e. complex symbols) to be produced in the current work cycle
      
      while( ((ninput_items[0]-Nin) >= Nfcast) &&                         // if enough input items are still available
             ((noutput_items-Nout) >= Nsom) ){                            // if there's still enough space in the output buffer
        Mapper(&in[Nin],Nfcast,&out[Nout],&PskTable);
        Nin += Nfcast;
        Nout += Nsom;
      }

#ifdef VERBOSE
      if( (Nin != 0) || (Nout != 0) ){
        printf("* Nin consumed = %d\n",Nin);
        printf("* Nout produced = %d\n",Nout);
        printf("* Input items left = %d\n",ninput_items[0]-Nin);
        printf("-----------------\n");
      }
#endif

      consume_each(Nin);                                                  // tell the runtime system how many input items (bytes in this case) to consume in this cycle
      return Nout;                                                        // tell the runtime system how many output items (complex symbols in this case) to produce in this cycle
    }

  } /* namespace zVKN */
} /* namespace gr */




// #NB1: Reasoning for setting the "forecast()" and "set_output_multiple()" functions.
//                      ---------------------------
//                      | FORECAST | SET_OUT_MULT |
// --------------------------------|---------------
// M = 2  -> L = 1 b/S -> Min. 1 B | Min. 8 S
// M = 4  -> L = 2 b/S -> Min. 1 B | Min. 4 S
// M = 8  -> L = 3 b/S -> Min. 3 B | Min. 8 S
// M = 16 -> L = 4 b/S -> Min. 1 B | Min. 2 S
// M = 32 -> L = 5 b/S -> Min. 5 B | Min. 8 S
// M = 64 -> L = 6 b/S -> Min. 3 B | Min. 4 S