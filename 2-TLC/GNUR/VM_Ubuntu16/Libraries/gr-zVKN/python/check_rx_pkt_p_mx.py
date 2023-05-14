#!/usr/bin/env python
# -*- coding: utf-8 -*-
# 
# Copyright 2022 <+YOU OR YOUR COMPANY+>.
# 
# This is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 3, or (at your option)
# any later version.
# 
# This software is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this software; see the file COPYING.  If not, write to
# the Free Software Foundation, Inc., 51 Franklin Street,
# Boston, MA 02110-1301, USA.
# 

from gnuradio import gr
import pmt

class check_rx_pkt_p_mx(gr.basic_block):
    """
    docstring for block check_rx_pkt_p_mx
    """
    def __init__(self):
        gr.basic_block.__init__(self,
            name="check_rx_pkt_p_mx",
            in_sig=None,
            out_sig=None)
        self.message_port_register_in(pmt.intern('port_in'))
        self.set_msg_handler(pmt.intern('port_in'),self.check_handler)
        self.Cnt = 0


    def check_handler(self, msg_in):
        self.Cnt += 1
        blob_in = pmt.cdr(msg_in) 
        len_in = pmt.blob_length(blob_in)
        data_in = pmt.to_python(blob_in)
        print('>> PKT RX #'+str(self.Cnt))+' <<'
        OutStr = ' '+str(len_in)+' B | 0x '
        for j, val in enumerate(data_in) :
            OutStr += str(format(val,'02X'))
        print(OutStr)
        print('-----')


    def forecast(self, noutput_items, ninput_items_required):
        for i in range(len(ninput_items_required)):
            ninput_items_required[i] = noutput_items


    def general_work(self, input_items, output_items):
        output_items[0][:] = input_items[0]
        consume(0, len(input_items[0]))
        return len(output_items[0])
