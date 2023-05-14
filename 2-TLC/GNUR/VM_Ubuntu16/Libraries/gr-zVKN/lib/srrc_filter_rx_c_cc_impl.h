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

#ifndef INCLUDED_ZVKN_SRRC_FILTER_RX_C_CC_IMPL_H
#define INCLUDED_ZVKN_SRRC_FILTER_RX_C_CC_IMPL_H

#include <zVKN/srrc_filter_rx_c_cc.h>

const uint16_t MAX_NTAPS_RX = 512;

namespace gr {
  namespace zVKN {

    class srrc_filter_rx_c_cc_impl : public srrc_filter_rx_c_cc
    {
     private:
      int d_sps;
      int d_span;
      float d_beta;
      uint16_t Ntaps;
      uint16_t WinSz;
      float Taps_Rx[MAX_NTAPS_RX];

      void ScaleSrrcTaps( float *Taps );
      void GetSrrcTaps( float *Taps );
      void FirFilterC( gr_complex *InSamps, gr_complex *OutSamps, size_t SampLen, float *Taps );

     public:
      srrc_filter_rx_c_cc_impl(int sps, int span, float beta);
      ~srrc_filter_rx_c_cc_impl();

      // Where all the action really happens
      void forecast (int noutput_items, gr_vector_int &ninput_items_required);

      int general_work(int noutput_items,
           gr_vector_int &ninput_items,
           gr_vector_const_void_star &input_items,
           gr_vector_void_star &output_items);
    };

  } // namespace zVKN
} // namespace gr

#endif /* INCLUDED_ZVKN_SRRC_FILTER_RX_C_CC_IMPL_H */

