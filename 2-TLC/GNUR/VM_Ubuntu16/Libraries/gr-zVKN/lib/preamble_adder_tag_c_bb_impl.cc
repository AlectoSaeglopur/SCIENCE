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
#include "preamble_adder_tag_c_bb_impl.h"

namespace gr {
  namespace zVKN {

    preamble_adder_tag_c_bb::sptr
    preamble_adder_tag_c_bb::make(int prb_val, int prb_len, const std::string& len_tag_key)       // NB: remember to add len_tag_key parameter (and don't forget to destroy and recreate the "build" folder next time you compile!)
    {
      return gnuradio::get_initial_sptr
        (new preamble_adder_tag_c_bb_impl(prb_val, prb_len, len_tag_key));
    }

    /*
     * The private constructor
     */
    preamble_adder_tag_c_bb_impl::preamble_adder_tag_c_bb_impl(int prb_val, int prb_len, const std::string& len_tag_key)      // remember to add len_tag_key parameter (and don't forget to destroy and recreate the "build" folder next time you compile!)
      : gr::tagged_stream_block("preamble_adder_tag_c_bb",
              gr::io_signature::make(1,1,sizeof(uint8_t)),
              gr::io_signature::make(1,1,sizeof(uint8_t)),
              len_tag_key),                                                                       // remember to add len_tag_key parameter (and don't forget to destroy and recreate the "build" folder next time you compile!)
        d_prb_val(prb_val),
        d_prb_len(prb_len)
    {}

    /*
     * Our virtual destructor.
     */
    preamble_adder_tag_c_bb_impl::~preamble_adder_tag_c_bb_impl(){
    }

    /*
     * Tagged stream dedicated function to declare the needed value of noutput_items (i.e. output_packet_length)
     */
    int preamble_adder_tag_c_bb_impl::calculate_output_stream_length(const gr_vector_int &ninput_items){
      int noutput_items = ninput_items[0]+d_prb_len;
      return noutput_items;
    }


    int preamble_adder_tag_c_bb_impl::work (int noutput_items,
                       gr_vector_int &ninput_items,
                       gr_vector_const_void_star &input_items,
                       gr_vector_void_star &output_items)
    {
      const uint8_t *in = (const uint8_t *) input_items[0];
      uint8_t *out = (uint8_t *) output_items[0];
      memset(out,d_prb_val,d_prb_len);                                                            // write preamble bytes into output buffer                                            
      memcpy(&out[d_prb_len],in,ninput_items[0]);                                                 // copy input items into output buffer
      return (ninput_items[0]+d_prb_len);                                                         // return the number of output items to produce (i.e. output_packet_length, since all packet is handled within the current cycle and "noutput_items" value is fixed by "calculate_output_stream_length" function)
    }

  } /* namespace zVKN */
} /* namespace gr */

