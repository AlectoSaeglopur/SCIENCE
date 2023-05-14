# Copyright 2011 Free Software Foundation, Inc.
#
# This file is part of GNU Radio
#
# GNU Radio is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 3, or (at your option)
# any later version.
#
# GNU Radio is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with GNU Radio; see the file COPYING.  If not, write to
# the Free Software Foundation, Inc., 51 Franklin Street,
# Boston, MA 02110-1301, USA.

install(FILES
    zVKN_flag_appender_p_mm.xml
    zVKN_flag_appender_c_mm.xml
    zVKN_preamble_adder_c_bb.xml
    zVKN_preamble_adder_tag_c_bb.xml
    zVKN_psk_mapper_c_bc.xml
    zVKN_srrc_filter_tx_c_cc.xml
    zVKN_fsk_modulator.xml
    zVKN_gfsk_modulator.xml
    zVKN_agc_p_cc.xml
    zVKN_add_scrambler_p_mm.xml
    zVKN_psk_mapper_p_mm.xml
    zVKN_awgn_p_cc.xml
    zVKN_srrc_filter_rx_c_cc.xml
    zVKN_squelch_agc_p_cc.xml
    zVKN_psk_decoder.xml
    zVKN_srrc_filter_rx_p_cc.xml
    zVKN_prot_header_tx_p_mm.xml
    zVKN_check_rx_pkt_p_mx.xml DESTINATION share/gnuradio/grc/blocks
)
