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


#ifndef INCLUDED_ZVKN_PSK_MAPPER_C_BC_H
#define INCLUDED_ZVKN_PSK_MAPPER_C_BC_H

#include <zVKN/api.h>
#include <gnuradio/block.h>

namespace gr {
  namespace zVKN {

    /*!
     * \brief <+description of block+>
     * \ingroup zVKN
     *
     */
    class ZVKN_API psk_mapper_c_bc : virtual public gr::block
    {
     public:
      typedef boost::shared_ptr<psk_mapper_c_bc> sptr;

      /*!
       * \brief M = Modulation order (up to 64)
       */

      /*!
       * \brief PO = Constellation phase offset [deg]
       */
       
      /*!
       * \brief R = Constellation rotation
       */
      static sptr make(int M, float PO, bool R);
    };

  } // namespace zVKN
} // namespace gr

#endif /* INCLUDED_ZVKN_PSK_MAPPER_C_BC_H */

