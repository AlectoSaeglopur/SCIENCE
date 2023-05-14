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
#include "flag_appender_c_mm_impl.h"

namespace gr {
  namespace zVKN {

    flag_appender_c_mm::sptr
    flag_appender_c_mm::make(bool flag_pos, int flag_val)
    {
      return gnuradio::get_initial_sptr
        (new flag_appender_c_mm_impl(flag_pos, flag_val));
    }

    /*
     * The private constructor
     */
    flag_appender_c_mm_impl::flag_appender_c_mm_impl(bool flag_pos, int flag_val)
      : gr::block("flag_appender_c_mm",
              gr::io_signature::make(0,0,0),                                                                  // no data type to be declared since input is of type message
              gr::io_signature::make(0,0,0)),                                                                 // no data type to be declared since output is of type message
              d_flag_val(flag_val),                                                                           // store 1st parameter into class variable
              d_flag_pos(flag_pos)                                                                            // store 2nd parameter into class variable
    {
      message_port_register_in(pmt::mp("port_in"));                                                           // set "port_in" as input port for blob messages
      message_port_register_out(pmt::mp("port_out"));                                                         // set "port_out" as output port for blob messages
      set_msg_handler(pmt::mp("port_in"),boost::bind(&flag_appender_c_mm_impl::appender_handler,this,_1));      // set "appender_handler" as the function to be executed each time a message is received at "port_in"
    }

    /*
     * Our virtual destructor.
     */
    flag_appender_c_mm_impl::~flag_appender_c_mm_impl()
    {
    }


    /*
     * Message handler function, executed upon the reception of each single message.
     */
    void flag_appender_c_mm_impl::appender_handler(pmt::pmt_t msg_in){
      pmt::pmt_t msg_out;
      uint8_t *buf_in;
      uint8_t *buf_out;
      uint32_t len_in;
      uint32_t len_out;
      uint32_t j;
      uint8_t len_flag = 2;                                                                                   // NB: the input flag is always converted into an unsigned 16-bit value!
      pmt::pmt_t data_in = pmt::cdr(msg_in);                                                                  // extract blob content of the input message by removing the extra meta-data
      len_in = pmt::blob_length(data_in);                                                                     // get the input message data length (in bytes)
      buf_in = (uint8_t *)calloc(len_in,sizeof(uint8_t));                                                     // allocate size for the input byte stream
      len_out = len_in+len_flag;                                                                              // output data length [B]
      buf_out = (uint8_t *)calloc(len_out,sizeof(uint8_t));                                                   // allocate size for the output byte stream
      memcpy(buf_in,pmt::blob_data(data_in),len_in);                                                          // convert and copy the content of the input message from blob to byte array
#ifdef VERBOSE                                                                                                // enable VERBOSE mode by adding the line "#define VERBOSE" in "flag_appender_c_mm.h"
      printf("IN : %d B || ",unsigned(len_in));
      for ( j=0; j<len_in; j++ )
        printf("%2X ",buf_in[j]);
      printf("\n");
#endif  
      if ( d_flag_pos ){
        buf_out[0] = (uint8_t)(d_flag_val>>8);
        buf_out[1] = (uint8_t)(d_flag_val&0x00FF);
        memcpy(&buf_out[len_flag],buf_in,len_in);
      } else {
        memcpy(buf_out,buf_in,len_in);
        buf_out[len_out-2] = (uint8_t)(d_flag_val>>8);
        buf_out[len_out-1] = (uint8_t)(d_flag_val&0x00FF);
      }
#ifdef VERBOSE
      printf("OUT : %d B || ",unsigned(len_out));
      for ( j=0; j<len_out; j++ )
        printf("%2X ",buf_out[j]);
      printf("\n");
#endif
      msg_out = pmt::make_u8vector(len_out,0);                                                                // create an all-0 uint8 data message of the desided length
      for ( j=0; j<len_out; j++ ){
        pmt::u8vector_set(msg_out,j,buf_out[j]);                                                              // copy the content of buf_out into msg_out     
      }
      free(buf_in);                                                                                           // release temporary input buffer from calloc
      free(buf_out);                                                                                          // release temporary output buffer from calloc
      message_port_pub(pmt::mp("port_out"),pmt::cons(pmt::PMT_NIL,msg_out));                                  // encapsulate final message by adding metadata (NIL) and forward it to "port_out" to be transmitted
    }


    void flag_appender_c_mm_impl::forecast (int noutput_items, gr_vector_int &ninput_items_required){         // don't care about forecast here (since I/O is handled through messages)
      /* <+forecast+> e.g. ninput_items_required[0] = noutput_items */
    }


    int flag_appender_c_mm_impl::general_work (int noutput_items,                                             // don't care about work here (since I/O is handled through messages)
                       gr_vector_int &ninput_items,
                       gr_vector_const_void_star &input_items,
                       gr_vector_void_star &output_items)
    {
      //const <+ITYPE+> *in = (const <+ITYPE+> *) input_items[0];                                             // remember to comment this line!
      //<+OTYPE+> *out = (<+OTYPE+> *) output_items[0];                                                       // remember to comment this line!
      consume_each (noutput_items);
      return noutput_items;
    }

  } /* namespace zVKN */
} /* namespace gr */

