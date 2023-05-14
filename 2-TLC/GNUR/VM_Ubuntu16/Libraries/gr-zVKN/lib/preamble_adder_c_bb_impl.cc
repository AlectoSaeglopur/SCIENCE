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
#include "preamble_adder_c_bb_impl.h"

namespace gr {
  namespace zVKN {

    preamble_adder_c_bb::sptr
    preamble_adder_c_bb::make(int prb_val, int prb_len)
    {
      return gnuradio::get_initial_sptr
        (new preamble_adder_c_bb_impl(prb_val, prb_len));
    }

    /*
     * The private constructor
     */
    preamble_adder_c_bb_impl::preamble_adder_c_bb_impl(int prb_val, int prb_len)
      : gr::block("preamble_adder_c_bb",
              gr::io_signature::make(1,1,sizeof(uint8_t)),
              gr::io_signature::make(1,1,sizeof(uint8_t))),
        d_prb_val(prb_val),
        d_prb_len(prb_len)
    {
      WaitNewPkt = true;
    }

    /*
     * Our virtual destructor.
     */
    preamble_adder_c_bb_impl::~preamble_adder_c_bb_impl(){
    }

    void preamble_adder_c_bb_impl::forecast (int noutput_items, gr_vector_int &ninput_items_required)
    {
      /* <+forecast+> e.g. ninput_items_required[0] = noutput_items */
    }

    int preamble_adder_c_bb_impl::general_work (int noutput_items,
                       gr_vector_int &ninput_items,
                       gr_vector_const_void_star &input_items,
                       gr_vector_void_star &output_items)
    {
      uint8_t *in = (uint8_t *) input_items[0];                           // initialize input buffer
      uint8_t *out = (uint8_t *) output_items[0];                         // initialize output buffer
      int Nin = 0;                                                        // number of input items (in this case bytes) consumed during current work cycle
      int Nout = 0;                                                       // number of output items (in this case bytes) produced during current work cycle
      if( ninput_items[0] > 0 ){                                          // check if there's input data available
        if( WaitNewPkt ){                                                 // if waiting for a new packet...
          WaitNewPkt = false;                                             // disable the waiting-for-new-packet flag
          memset(out,d_prb_val,d_prb_len);                                // write preamble bytes into output buffer
          if( ninput_items[0] > noutput_items-d_prb_len ){                // check if input items are too many to be handle entirely in the current work cycle
            Nin += noutput_items-d_prb_len;                               // calculate number of input items to be consumed
          } else {
            Nin += ninput_items[0];
          }
          memcpy(&out[d_prb_len],in,Nin);                                 // copy input items into output buffer
          Nout += Nin+d_prb_len;                                          // calculate number of output items to be produced
        } else {                                                          // if still handling the tail of the same packet (started cycles before)...
          if( ninput_items[0] > noutput_items ){                          // check if input items are too many to be handle entirely in the current work cycle
            Nin += noutput_items;                                         // calculate number of input items to be consumed
          } else {
            Nin += ninput_items[0];
          }
          memcpy(out,in,Nin);                                             // copy input items into output buffer
          Nout += Nin;                                                    // calculate number of output items to be produced
        }
      } else {
        WaitNewPkt = true;                                                // re-enable the waiting-for-new-packet flag
      }
      consume_each(Nin);                                                  // tell runtime system how many input items to consume in this cycle
      return Nout;                                                        // tell runtime system how many output items to produce in this cycle
    }

  } /* namespace zVKN */
} /* namespace gr */



// NB#1 : This block works properly (it can be checked by saving the processed bytes in a .bin file through the "File Sink" block),
//        but it doesn't update the tagged length of the stream (which creates issues when trying to reconvert the tagged stream into
//        a PDU and to print it through the "Message Debug" block -> refer to "test_preamble_adder.grc"). Moreover, the start of a
//        new packet and the end of the previous one is roughly estimated once a cycle with no input items is detected : 
//        SO DO NOT USE THIS BLOCK FOR REAL APPLICATION! (CREATED ONLY FOR DEVELOPMENT PURPOSE)
