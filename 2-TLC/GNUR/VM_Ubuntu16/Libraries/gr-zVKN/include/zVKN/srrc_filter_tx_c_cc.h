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


#ifndef INCLUDED_ZVKN_SRRC_FILTER_TX_C_CC_H
#define INCLUDED_ZVKN_SRRC_FILTER_TX_C_CC_H

#include <zVKN/api.h>
#include <gnuradio/block.h>

namespace gr {
  namespace zVKN {

    /*!
     * \brief <+description of block+>
     * \ingroup zVKN
     *
     */
    class ZVKN_API srrc_filter_tx_c_cc : virtual public gr::block
    {
     public:
      typedef boost::shared_ptr<srrc_filter_tx_c_cc> sptr;

      /*!
       * \brief Return a shared_ptr to a new instance of zVKN::srrc_filter_tx_c_cc.
       *
       * To avoid accidental use of raw pointers, zVKN::srrc_filter_tx_c_cc's
       * constructor is in a private implementation
       * class. zVKN::srrc_filter_tx_c_cc::make is the public interface for
       * creating new instances.
       */
      static sptr make(int sps, int span, float beta);
    };

  } // namespace zVKN
} // namespace gr

#endif /* INCLUDED_ZVKN_SRRC_FILTER_TX_C_CC_H */

