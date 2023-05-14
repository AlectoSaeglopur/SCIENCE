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

#ifndef INCLUDED_ZVKN_PSK_MAPPER_C_BC_IMPL_H
#define INCLUDED_ZVKN_PSK_MAPPER_C_BC_IMPL_H

#include <zVKN/psk_mapper_c_bc.h>

const uint8_t MAX_M = 64;                                                 // maximum modulation order allowed (the higher the less efficient)

typedef struct TD1 {
	uint8_t Bits[MAX_M];
	gr_complex Symbs[MAX_M];
} phasemap;

namespace gr {
  namespace zVKN {

    class psk_mapper_c_bc_impl : public psk_mapper_c_bc {

     private:
      int ModOrd;                                                         // modulation order (all powers of 2 up to MAX_M can be chosen)
      float PhOfst;                                                       // constellation offset [rad]
      bool Rotat;                                                         // constellation rotation (clockwise or counter-clockwise)
      int L;                                                              // number of bits per symbol
      int Nfcast;                                                         // forecast factor
      int Nsom;                                                           // set_out_multiple factor
      phasemap PskTable;

      void GetGray( uint8_t *IoArray );
      void GetPskTable( phasemap *IoTable );
      void Mapper( uint8_t *InBytes, size_t ByteLen, gr_complex *OutSymbs, phasemap *Table );
      void UpdateParamM( int M );

     public:
      psk_mapper_c_bc_impl(int M, float PO, bool R);
      ~psk_mapper_c_bc_impl();
      void change_param_handler(pmt::pmt_t msg_in);

      // Where all the action really happens
      void forecast (int noutput_items, gr_vector_int &ninput_items_required);

      int general_work(int noutput_items,
           gr_vector_int &ninput_items,
           gr_vector_const_void_star &input_items,
           gr_vector_void_star &output_items);
    };

  } // namespace zVKN
} // namespace gr

#endif /* INCLUDED_ZVKN_PSK_MAPPER_C_BC_IMPL_H */

