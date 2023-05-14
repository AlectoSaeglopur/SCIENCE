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
#include "srrc_filter_tx_c_cc_impl.h"

namespace gr {
  namespace zVKN {

    srrc_filter_tx_c_cc::sptr
    srrc_filter_tx_c_cc::make(int sps, int span, float beta)
    {
      return gnuradio::get_initial_sptr
        (new srrc_filter_tx_c_cc_impl(sps, span, beta));
    }


    /*
     * The private constructor
     */
    srrc_filter_tx_c_cc_impl::srrc_filter_tx_c_cc_impl(int sps, int span, float beta)
      : gr::block("srrc_filter_tx_c_cc",
              gr::io_signature::make(1,1,sizeof(gr_complex)),
              gr::io_signature::make(1,1,sizeof(gr_complex))),
        d_sps(sps),                                                           // initialize oversampling factor (i.e. number of samples per symbol) [Sa]
        d_span(span),                                                         // initialize number of symbols for filter representation [S]
        d_beta(beta),                                                         // initialize roll-off factor
        Ntaps((uint16_t)(sps*span+1))                                         // initialize number of filter taps
    {
      set_output_multiple(sps);                                               // set output size as a multiple of sps
      GetSrrcTaps(Taps_Tx);                                                   // calculate filter taps
    }


    /*
     * Our virtual destructor.
     */
    srrc_filter_tx_c_cc_impl::~srrc_filter_tx_c_cc_impl(){
    }


   /*
    *	Function for scaling the SRRC filter taps amplitude.
    */
    void srrc_filter_tx_c_cc_impl::ScaleSrrcTaps( float *Taps ){
      uint16_t j;
      float Energy = 0;
      for ( j=0; j<Ntaps; j++ ){
        Energy += pow(Taps[j],2);
      }
      Energy = sqrt(Energy);
      for ( j=0; j<Ntaps; j++ ){
        Taps[j] /= Energy;
      }
    }


   /*
    *	Function for getting the square-root-raised-cosine (SRRC) filter taps as a function
    *	of parameters sps, span and d_beta.
    */
    void srrc_filter_tx_c_cc_impl::GetSrrcTaps( float *Taps ){
      uint16_t j;
      float Time;
      float epsilon = 1e-30;
      float ZeroVal = 1/(2*M_PI*d_sps)*(M_PI*(d_beta+1)*sin(M_PI*(d_beta+1)/(4*d_beta))-4*d_beta*
                sin(M_PI*(d_beta-1)/(4*d_beta))+M_PI*(d_beta-1)*cos(M_PI*(d_beta-1)/(4*d_beta)));
      for ( j=0; j<Ntaps; j++ ){
        Time = (j-(float)d_sps*d_span/2)/d_sps;
        if ( fabs(fabs(4*d_beta*Time)-1) < epsilon ){
          Taps[j] = ZeroVal;
        } else {
          Taps[j] = -4*d_beta/d_sps*(cos((1+d_beta)*M_PI*Time)+sin((1-d_beta)*M_PI*Time)/
            (4*d_beta*Time))/(M_PI*(pow(4*d_beta*Time,2)-1));
        }
      }
      Taps[d_sps*d_span/2] = -1/(M_PI*d_sps)*(M_PI*(d_beta-1)-4*d_beta);
      ScaleSrrcTaps(Taps);
    }


   /*
    *	Function for upsampling an input complex symbol stream by the factor sps.
    */
    void srrc_filter_tx_c_cc_impl::UpsampleC( gr_complex *SymbStream, size_t SymbLen, gr_complex *SampStream ){
      uint8_t i;
      uint16_t j;
      for ( j=0; j<SymbLen; j++ ){
        SampStream[j*d_sps].real() = SymbStream[j].real();
        SampStream[j*d_sps].imag() = SymbStream[j].imag();
        for ( i=1; i<d_sps; i++ ){
          SampStream[j*d_sps+i].real() = 0;
          SampStream[j*d_sps+i].imag() = 0;
        }
      }
    }
      

   /*
    *	Function for performing finite impulse response (FIR) filtering according
    *	to the specified taps on the input complex sample stream.
    */
    void srrc_filter_tx_c_cc_impl::FirFilterC( gr_complex *IoSamps, size_t SampLen, float *Taps ){
      static float FirRegRe_Tx[MAX_NTAPS_TX] = {0};
      static float FirRegIm_Tx[MAX_NTAPS_TX] = {0};
      uint16_t i, j;
      float InValueRe, InValueIm, OutValueRe, OutValueIm;
      gr_complex TmpSamps[SampLen];
      for ( i=0; i<SampLen; i++ ){
        InValueRe = IoSamps[i].real();
        InValueIm = IoSamps[i].imag();
        OutValueRe = Taps[0]*InValueRe;
        OutValueIm = Taps[0]*InValueIm;
        for ( j=1; j<Ntaps; j++ ){
          OutValueRe += Taps[j]*FirRegRe_Tx[j-1];
          OutValueIm += Taps[j]*FirRegIm_Tx[j-1];
        }
        TmpSamps[i].real() = OutValueRe;
        TmpSamps[i].imag() = OutValueIm;
        for ( j=Ntaps-2; j>0; j-- ){
          FirRegRe_Tx[j] = FirRegRe_Tx[j-1];
          FirRegIm_Tx[j] = FirRegIm_Tx[j-1];
        }
        FirRegRe_Tx[0] = InValueRe;
        FirRegIm_Tx[0] = InValueIm;
      }
      memcpy(IoSamps,TmpSamps,SampLen*sizeof(gr_complex));
    }


    void srrc_filter_tx_c_cc_impl::forecast (int noutput_items, gr_vector_int &ninput_items_required) {
      ninput_items_required[0] = 0;                                           // see NOTE#1 below
    }


    int srrc_filter_tx_c_cc_impl::general_work (int noutput_items,
                       gr_vector_int &ninput_items,
                       gr_vector_const_void_star &input_items,
                       gr_vector_void_star &output_items)
    {
      gr_complex *in = (gr_complex *) input_items[0];
      gr_complex *out = (gr_complex *) output_items[0];
      int Nout = 0;                                                           // number of input items consumed in the current work cycle
      int Nin = 0;                                                            // number of output items produced in the current work cycle
      if ( ninput_items[0] > 0 ){                                             // if input items are available...
        while( (ninput_items[0]-Nin > 0) && (noutput_items-Nout) >= d_sps ){  // as long as there are input items available and free space in the output buffer...
          UpsampleC(&in[Nin],1,&out[Nout]);                                   // upsample input symbol (one at a time)
          FirFilterC(&out[Nout],d_sps,Taps_Tx);                               // filter input symbol (one at a time)
          Nin++;                                                              // consume one input item per while cycle
          Nout += d_sps;                                                      // produce sps output item per while cycle
        }
      } else {                                                                // if no input items are available...
          int j;
          int DummySz = 2;                                                    // dummy buffer length (don't care exact value)
          gr_complex dummy[DummySz];                                          // initialize dummy buffer
          for (j=0; j<DummySz; j++ ){
            dummy[j].real() = 0;                                              // set complex dummy symbols to zero
            dummy[j].imag() = 0;
          }
          while( (noutput_items-Nout) > DummySz*d_sps ){                      // as long there's free space in the output buffer
            UpsampleC(dummy,DummySz,&out[Nout]);
            FirFilterC(&out[Nout],DummySz*d_sps,Taps_Tx);
            Nout += DummySz*d_sps;                                            // produce Sz*sps output item per while cycle
          

            //for( j=0; j<DummySz*d_sps; j++){
            //  out[Nout-DummySz*d_sps+j].real() = 0.5;
            //  out[Nout-DummySz*d_sps+j].imag() = 0.3;
            //}
            
          
          
          
          }
      }
      consume_each(Nin);                                                      // tell the runtime system how many input items (complex symbols in this case) to consume in this cycle
      return Nout;                                                            // tell the runtime system how many output items (complex samples in this case) to produce in this cycle
    }

  } /* namespace zVKN */
} /* namespace gr */



// NOTE#1: In this case a forecast value of "1" could have been simply used, since just even a single input symbol is enough to produce sps output samples.
//         However, a non-null forecast value causes the work function to be executetd only when input items are available (i.e. ninput_items[0] > 0), and
//         here this would mean there's no possibility to empty the FIR filter (Delay = sps*span/2). So, by setting forecast to "0" in case input items are
//         no more present the filter is fed with dummy zero-complex symbols in order to empty the filter buffer making the tail of the wave not truncated.
//         For a more efficient approach (since now the block consumes CPU even when no input items are present), consider using tagged input stream so to
//         know the exact inout stream length and add only the minimumdummy symbols at the end.
