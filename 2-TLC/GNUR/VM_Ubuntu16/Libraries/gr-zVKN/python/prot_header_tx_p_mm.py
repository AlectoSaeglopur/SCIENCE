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
from numpy import zeros, log2, flipud
import pmt

class prot_header_tx_p_mm(gr.basic_block):
    """
    * INPUT : message (body)
    * OUTPUT : message (header+body+tail)
    * PARAMETERS :
      - PrbSz = Preamble size (head) [B]
      - LenSz = Length-field size (head) [B]
      - Dummy = Dummy bytes value (tail)
      - SwVal = Sync Word value (head)
      - Order = Modulation order
    """
    def __init__(self, PrbSz, LenSz, Dummy, SwVal, Order):
        gr.basic_block.__init__(self,
            name="prot_header_tx_p_mm",
            in_sig=None,
            out_sig=None)
        self.message_port_register_in(pmt.intern('port_in'))
        self.message_port_register_out(pmt.intern('port_out'))
        self.set_msg_handler(pmt.intern('port_in'),self.protocol_handler)
        self.PrbSz = PrbSz
        self.LenSz = LenSz
        self.Dummy = Dummy
        self.SwVal = SwVal
        self.M = Order
        self.L = int(log2(Order))


    def GetPrbSeq( self ) :
        if ( self.M == 2 ) :
            PrbSeq = [170]                      # 0x AA
        elif( self.M == 4 ) :
            PrbSeq = [204]                      # 0x CC
        elif( self.M == 8 ) :
            PrbSeq = [227,142,56]               # 0x E3 8E 38 (i.e. 11100011 10001110 00111000)
        elif( self.M == 16 ) :
            PrbSeq = [240]                      # 0x F0
        elif( self.M == 32 ) :
            PrbSeq = [248,62,15,131,224]        # 0x F8 3E 0F 83 E0
        elif( self.M == 64 ) :
            PrbSeq = [252,15,192]               # 0x FC 0F C0
        else :
            print(" >> ERROR : Invalid modulation order!")
            exit()
        return PrbSeq
            

    def protocol_handler(self, InMsg):
        InBlob = pmt.cdr(InMsg)
        InLen = pmt.blob_length(InBlob)                                                                     # get length of input message [B]
        InData = pmt.to_python(InBlob)
        OutLen = InLen+self.PrbSz+self.LenSz+len(self.Dummy)+len(self.SwVal)
        OutMsg = pmt.make_u8vector(OutLen,0)
        Cnt = 0
        # APPEND PREAMBLE (HEAD) #
        PrbSeq = self.GetPrbSeq()
        if self.PrbSz % len(PrbSeq) != 0 :
            print(" >> ERROR : Invalid preamble size!")
            exit()  
        for i in range(self.PrbSz) :
            pmt.u8vector_set(OutMsg,Cnt,PrbSeq[i%len(PrbSeq)])
            Cnt += 1
        # APPEND SYNC WORD (HEAD) #
        for i in range(len(self.SwVal)) :
            pmt.u8vector_set(OutMsg,Cnt,self.SwVal[i])
            Cnt += 1
        # APPEND LENGTH-FIELD (HEAD) #
        for i in range(self.LenSz) :
            pmt.u8vector_set(OutMsg,Cnt,InLen>>8*(self.LenSz-i-1))
            Cnt += 1
        # COPY PACKET INFO CONTENT (BODY) #
        for i in range(InLen) :
            pmt.u8vector_set(OutMsg,Cnt,int(InData[i]))
            Cnt += 1
        # APPEND DUMMY BYTES (TAIL) #
        for i in range(len(self.Dummy)) :
            pmt.u8vector_set(OutMsg,Cnt,self.Dummy[i])
            Cnt += 1
        self.message_port_pub(pmt.intern('port_out'),pmt.cons(pmt.PMT_NIL,OutMsg))


    def forecast(self, noutput_items, ninput_items_required):
        for i in range(len(ninput_items_required)):
            ninput_items_required[i] = noutput_items


    def general_work(self, input_items, output_items):
        output_items[0][:] = input_items[0]
        consume(0, len(input_items[0]))
        #self.consume_each(len(input_items[0]))
        return len(output_items[0])
