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
#include "srrc_filter_rx_c_cc_impl.h"

namespace gr {
  namespace zVKN {

    srrc_filter_rx_c_cc::sptr
    srrc_filter_rx_c_cc::make(int sps, int span, float beta)
    {
      return gnuradio::get_initial_sptr
        (new srrc_filter_rx_c_cc_impl(sps, span, beta));
    }

    /*
     * The private constructor
     */
    srrc_filter_rx_c_cc_impl::srrc_filter_rx_c_cc_impl(int sps, int span, float beta)
      : gr::block("srrc_filter_rx_c_cc",
              gr::io_signature::make(1,1,sizeof(gr_complex)),
              gr::io_signature::make(1,1,sizeof(gr_complex))),
        d_sps(sps),                                                           // initialize oversampling factor (i.e. number of samples per symbol) [Sa]
        d_span(span),                                                         // initialize number of symbols for filter representation [S]
        d_beta(beta),                                                         // initialize roll-off factor
        Ntaps((uint16_t)(sps*span+1)),                                        // initialize number of filter taps
        WinSz(8*sps)                                                          // Internal window size
    {
      set_output_multiple(WinSz);                                               // set output vector size as a multiple of sps
      GetSrrcTaps(Taps_Rx);                                                   // calculate filter taps
    }


    /*
     * Our virtual destructor.
     */
    srrc_filter_rx_c_cc_impl::~srrc_filter_rx_c_cc_impl(){
    }


    /*
    *	Function for scaling the SRRC filter taps amplitude.
    */
    void srrc_filter_rx_c_cc_impl::ScaleSrrcTaps( float *Taps ){
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
    void srrc_filter_rx_c_cc_impl::GetSrrcTaps( float *Taps ){
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
    *	Function for performing finite impulse response (FIR) filtering according
    *	to the specified taps on the input complex sample stream.
    */
    void srrc_filter_rx_c_cc_impl::FirFilterC( gr_complex *InSamps, gr_complex *OutSamps, size_t SampLen, float *Taps ){
      static float FirRegRe_Rx[MAX_NTAPS_RX];
      static float FirRegIm_Rx[MAX_NTAPS_RX];
      uint16_t i, j;
      float InValueRe, InValueIm, OutValueRe, OutValueIm;
      for ( i=0; i<SampLen; i++ ){
        InValueRe = InSamps[i].real();
        InValueIm = InSamps[i].imag();
        OutValueRe = Taps[0]*InValueRe;
        OutValueIm = Taps[0]*InValueIm;
        for ( j=1; j<Ntaps; j++ ){
          OutValueRe += Taps[j]*FirRegRe_Rx[j-1];
          OutValueIm += Taps[j]*FirRegIm_Rx[j-1];
        }
        OutSamps[i].real() = OutValueRe;
        OutSamps[i].imag() = OutValueIm;
        for ( j=Ntaps-2; j>0; j-- ){
          FirRegRe_Rx[j] = FirRegRe_Rx[j-1];
          FirRegIm_Rx[j] = FirRegIm_Rx[j-1];
        }
        FirRegRe_Rx[0] = InValueRe;
        FirRegIm_Rx[0] = InValueIm;
      }
    }


    void srrc_filter_rx_c_cc_impl::forecast (int noutput_items, gr_vector_int &ninput_items_required){
      ninput_items_required[0] = WinSz;                                                             // run the block when at least WinSz new input samples are available (assuming contnuous input, see test_dvbs.grc)
    }


    int srrc_filter_rx_c_cc_impl::general_work (int noutput_items,
                       gr_vector_int &ninput_items,
                       gr_vector_const_void_star &input_items,
                       gr_vector_void_star &output_items) 
    {
      gr_complex *in = (gr_complex *) input_items[0];
      gr_complex *out = (gr_complex *) output_items[0];
      int Nout = 0;
      int Nin = 0;
      while( (ninput_items[0]-Nin >= WinSz) && (noutput_items-Nout) >= WinSz ){
        FirFilterC(&in[Nin],&out[Nout],WinSz,Taps_Rx);
        Nin += WinSz;
        Nout += WinSz;
      }
      consume_each(Nin);
      return Nout;
    }

  }
}

