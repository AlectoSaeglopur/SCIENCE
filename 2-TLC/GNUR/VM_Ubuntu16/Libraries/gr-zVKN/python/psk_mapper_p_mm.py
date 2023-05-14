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
from numpy import zeros, pi, log2, flipud, multiply
from cmath import exp

class psk_mapper_p_mm(gr.basic_block):
    """
    * INPUT : byte message
    * OUTPUT : complex PSK modulated message
    * PARAMETERS :
      - Order = Modulation order
      - Offset = Constellation phase offset [deg]
      - Rotation = Constellation rotation
    """
    def __init__(self, Order, Offset, Rotation):
        gr.basic_block.__init__(self,
            name="psk_mapper_p_mm",
            in_sig=None,
            out_sig=None)
        self.message_port_register_in(pmt.intern('port_in'))
        self.message_port_register_out(pmt.intern('port_out'))
        self.set_msg_handler(pmt.intern('port_in'),self.mapper_handler)
        self.M = Order
        self.PhOfs = pi*Offset/180.0
        self.Rotat = Rotation
        self.L = int(log2(Order))
        self.PskTable = self.GetPskTable()


    """
    " Function for converting an input binary array into the corresponding decimal
    " value.
    """
    def bin2dec( self, InBin ) :
        OutDe = str(InBin).replace(' ','').replace(',','')
        OutDe = OutDe.replace(']','').replace('[','') 
        return int(OutDe,2)


    """
    " Function for getting an M-sequence of Gray coded decimal numbers.
    """
    def GetGray( self ) :
        L = int(log2(self.M))
        GrayMtx = zeros((self.M,self.L),dtype=int)
        LastCell = [[0],[1]]
        GrayMtx[0:2,-1:] = LastCell
        for j in range(1,self.L) :
            GrayMtx[2**j:2**(j+1),-j:] = flipud(LastCell)
            GrayMtx[2**j:2**(j+1),-j-1] = 1
            LastCell = GrayMtx[0:2**(j+1),-j-1:]
        return GrayMtx


    """
    " Function for retrieving the PSK bits-to-constellation-symbols
    "  mapping according to Gray encoding.
    """
    def GetPskTable( self ) :
        GrayMtx = self.GetGray()
        Table = dict([('Bi',zeros(self.M,dtype=int)),('Sy',zeros(self.M,dtype=complex))])
        for j in range(self.M) :
            Table['Bi'][j] = self.bin2dec(GrayMtx[j,:])
            Table['Sy'][j] = exp(1j*(self.PhOfs+2*pi*j/self.M))
        return Table


    """
    " Function for mapping an input bit stream into the constellation
    " symbols specified by Table.
    """
    def Mapper( self, InBits ) :
        InLen = len(InBits)
        OutLen = int(InLen/self.L)
        OutSymbs = zeros(OutLen,dtype=complex)
        for j in range(OutLen) :
            CurBits = self.bin2dec(InBits[j*self.L:(j+1)*self.L])
            for i in range(self.M) :
                if self.PskTable['Bi'][i] == CurBits :
                    OutSymbs[j] = self.PskTable['Sy'][i]
                    break
        return OutSymbs


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

    def mapper_handler(self, msg_in):
        blob_in = pmt.cdr(msg_in)
        len_in = pmt.blob_length(blob_in)                                                                   # get the input message data length [B]
        data_in = pmt.to_python(blob_in)                                                                    # retrieve message data array
        data_bin = self.Byte2BitConv(data_in)
        len_out = int(8*len_in/self.L)                                                                      # Number of output symbols [S]
        data_out = self.Mapper(data_bin)
        msg_out = pmt.make_c32vector(len_out,0+0j)                                                          # create an all-null complex data message of the specified length
        for j in range(len_out) :
            pmt.c32vector_set(msg_out,j,data_out[j])                                                        # copy the content of data_out into msg_out     
        self.message_port_pub(pmt.intern('port_out'),pmt.cons(pmt.PMT_NIL,msg_out)) 


    def forecast(self, noutput_items, ninput_items_required):
        for i in range(len(ninput_items_required)):
            ninput_items_required[i] = noutput_items


    def general_work(self, input_items, output_items):
        output_items[0][:] = input_items[0]
        consume(0, len(input_items[0]))
        #self.consume_each(len(input_items[0]))
        return len(output_items[0])
