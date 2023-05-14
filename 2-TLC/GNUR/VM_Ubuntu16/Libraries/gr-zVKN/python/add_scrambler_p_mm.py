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
import pmt
from numpy import zeros, copy

class add_scrambler_p_mm(gr.basic_block):
    """
    docstring for block add_scrambler_p_mm
    """
    def __init__(self, Ncel, ConVect, InitSt):
        gr.basic_block.__init__(self,
            name="add_scrambler_p_mm",
            in_sig=None,
            out_sig=None)
        self.message_port_register_in(pmt.intern('port_in'))
        self.message_port_register_out(pmt.intern('port_out'))
        self.set_msg_handler(pmt.intern('port_in'),self.scrambler_handler)
        self.Ncel = Ncel
        self.ConVect = self.dec2bin(ConVect,Ncel)
        self.InitSt = self.dec2bin(InitSt,Ncel)


    """
    " Function for converting an input decimal value into the corresponding binary array
    " (specifying also the number of bits for the representation).
    """
    def dec2bin( self, Val, Ndig ) :
        OutMtx = zeros(Ndig,dtype=int)
        for j in range(Ndig) :
            OutMtx[Ndig-j-1] = Val%2
            Val = int(Val/2)
        return OutMtx


    """
    " Function for converting a byte stream into the corresponding bit stream.
    """
    def Byte2BitConv( self, InBytes ) :
        InLen = len(InBytes)
        OutLen = (InLen<<3)
        OutBits = [0]*OutLen
        for j in range(OutLen) :
            ByteIdx = (j>>3)
            BitIdx = 7-(j%8)
            if (InBytes[ByteIdx] >>BitIdx)%2 :
                OutBits[j] = 1
        return OutBits


    """
    " Function for converting a bit stream into the corresponding byte stream.
    """
    def Bit2ByteConv( self, InBits ) :
        InLen = len(InBits)
        OutLen = (InLen>>3)
        OutBytes = [0]*OutLen
        for j in range(InLen) :
            if InBits[j] :
                ByteIdx = (j>>3)
                BitIdx = 7-(j%8)
                OutBytes[ByteIdx] += (1<<BitIdx)
        return OutBytes


    """
    " Function for implementing an additive scrambler (aka synchronous or
    " linear-feedback shift register scrambler) and descrambler.
    """
    def AddScramb( self, InBytes ) :
        InBits = self.Byte2BitConv(InBytes)
        BitLen = len(InBits)
        RegState = copy(self.InitSt)
        OutBits = [0]*BitLen
        for j in range(BitLen) :
            RegBit = (sum([v1*v2 for v1,v2 in zip(RegState,self.ConVect)])%2)
            OutBits[j] = InBits[j]^RegBit
            RegState[1:] = RegState[:-1]
            RegState[0] = RegBit
        return self.Bit2ByteConv(OutBits)


    def scrambler_handler(self, msg_in):
        blob_in = pmt.cdr(msg_in)
        len_io = pmt.blob_length(blob_in)                                                                   # get the input message data length [B]
        data_in = pmt.to_python(blob_in)                                                                    # retrieve message data array
        data_out = self.AddScramb(data_in)
        msg_out = pmt.make_u8vector(len_io,0)                                                               # create an all-0 uint8 data message of the specified length
        for j in range(len_io) :
            pmt.u8vector_set(msg_out,j,data_out[j])                                                         # copy the content of data_out into msg_out     
        self.message_port_pub(pmt.intern('port_out'),pmt.cons(pmt.PMT_NIL,msg_out))                         # encapsulate final message by adding metadata (NIL) and forward it to "port_out" to be transmitted


    def forecast(self, noutput_items, ninput_items_required):
        #setup size of input_items[i] for work call
        for i in range(len(ninput_items_required)):
            ninput_items_required[i] = noutput_items


    def general_work(self, input_items, output_items):
        output_items[0][:] = input_items[0]
        consume(0, len(input_items[0]))
        #self.consume_each(len(input_items[0]))
        return len(output_items[0])
