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

import numpy
from gnuradio import gr
import pmt                                                                                                  # NB: don't forget to import the pmt library!

class flag_appender_p_mm(gr.basic_block):
    """
    docstring for block flag_appender_p_mm
    """
    def __init__(self, flag_pos, flag_val):
        gr.basic_block.__init__(self,
            name="flag_appender_p_mm",
            in_sig=None,                                                                                    # set no input type, since here input data is actually managed through messages
            out_sig=None)                                                                                   # set no output type, since here output data is actually managed through messages
        self.message_port_register_in(pmt.intern('port_in'))                                                # set port named "port_in" as the input for blob messages
        self.message_port_register_out(pmt.intern('port_out'))                                              # set port named "port_out" as the output for blob messages
        self.set_msg_handler(pmt.intern('port_in'),self.appender_handler)                                   # set "appender_handler" as the function to be executed each time a message is received at "port_in
        self.flag_pos = flag_pos                                                                            # store 1st input parameter into class variable
        self.flag_val = flag_val                                                                            # store 2nd input parameter into class variable


    def appender_handler(self, msg_in):                                                                     # message handler function, executed each time a new message is received
        blob_in = pmt.cdr(msg_in)                                                                           # extract blob content of the input message by removing the extra meta-data
        len_in = pmt.blob_length(blob_in)                                                                   # get the input message data length (in bytes)
        data_in = pmt.to_python(blob_in)                                                                    # retrieve message data array
        len_flag = len(self.flag_val)                                                                       # estimate flag length [B]
        len_out = len_in+len_flag                                                                           # calculate output message data length [B]
        if self.flag_pos == True :                                                                          # i.e. if Pos == START
            data_out = numpy.concatenate((self.flag_val,data_in))                                           # append flag at the beginning
        else :                                                                                              # i.e. if Pos == END
            data_out = numpy.concatenate((data_in,self.flag_val))                                           # append flag at the end
        msg_out = pmt.make_u8vector(len_out,0)                                                              # create an all-0 uint8 data message of the specified length
        for j in range(len_out) :
            pmt.u8vector_set(msg_out,j,data_out[j])                                                         # copy the content of data_out into msg_out     
        self.message_port_pub(pmt.intern('port_out'),pmt.cons(pmt.PMT_NIL,msg_out))                         # encapsulate final message by adding metadata (NIL) and forward it to "port_out" to be transmitted


    def forecast(self, noutput_items, ninput_items_required):                                               # don't care about forecast here (since I/O is handled through messages)
        #setup size of input_items[i] for work call
        for i in range(len(ninput_items_required)):
            ninput_items_required[i] = noutput_items

    def general_work(self, input_items, output_items):                                                      # don't care about work here (since I/O is handled through messages)
        output_items[0][:] = input_items[0]
        consume(0, len(input_items[0]))
        #self.consume_each(len(input_items[0]))
        return len(output_items[0])
