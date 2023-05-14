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


#ifndef INCLUDED_ZVKN_PREAMBLE_ADDER_C_BB_H
#define INCLUDED_ZVKN_PREAMBLE_ADDER_C_BB_H

#include <zVKN/api.h>
#include <gnuradio/block.h>

namespace gr {
  namespace zVKN {

    /*!
     * \brief <+description of block+>
     * \ingroup zVKN
     *
     */
    class ZVKN_API preamble_adder_c_bb : virtual public gr::block
    {
     public:
      typedef boost::shared_ptr<preamble_adder_c_bb> sptr;

      /*!
       * \brief Return a shared_ptr to a new instance of zVKN::preamble_adder_c_bb.
       *
       * To avoid accidental use of raw pointers, zVKN::preamble_adder_c_bb's
       * constructor is in a private implementation
       * class. zVKN::preamble_adder_c_bb::make is the public interface for
       * creating new instances.
       */
      static sptr make(int prb_val, int prb_len);
    };

  } // namespace zVKN
} // namespace gr

#endif /* INCLUDED_ZVKN_PREAMBLE_ADDER_C_BB_H */

