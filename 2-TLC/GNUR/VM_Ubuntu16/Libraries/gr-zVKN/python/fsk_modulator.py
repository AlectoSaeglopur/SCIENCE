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

"""@package fsk_modulator.py
"""

from numpy import zeros, log2, flipud, multiply, \
    pi, sin, cos, repeat, uint8, complex64
from gnuradio import gr


class fsk_modulator(gr.basic_block):
    """
    * INPUT : byte stream
    * OUTPUT : FSK modulated complex samples
    * PARAMETERS :
      - M = Modulation order (up to 64)
      - h = Modulation index
      - osf = Oversampling factor [Sa/S]
      - Rb = Input bit-rate [b/s]
    """
    def __init__(self, M, h, osf, Rb):
        gr.basic_block.__init__(self,
            name="fsk_modulator",
            in_sig=[uint8],
            out_sig=[complex64])
        self.M = M                                                          # save modulation order into class variable
        self.h = h                                                          # save modulation index into class variable
        self.osf = osf                                                      # save oversampling factor into class variable [Sa/S]
        self.Rb = Rb                                                        # save bit-rate index into class variable [b/s]
        if ( M == 2 ) :
          self.Nfcast = 1                                                   # minimum number of input items (i.e. bytes) required per work cycle
          self.Nsom = 8                                                     # minimum number of output items (i.e. complex samples) produced per work cycle
        elif ( M == 4 ) :
          self.Nfcast = 1
          self.Nsom = 4
        elif ( M == 8 ) :
          self.Nfcast = 3
          self.Nsom = 8
        elif ( M == 16 ) :
          self.Nfcast = 1
          self.Nsom = 2
        elif ( M == 32 ) :
          self.Nfcast = 5
          self.Nsom = 8
        elif ( M == 64 ) :
          self.Nfcast = 3
          self.Nsom = 4
        else :
          self.M = 4;                                                       # if the input modulation order is not valid, set it to 4 by default
          self.Nfcast = 1
          self.Nsom = 4
        self.set_output_multiple(self.Nsom)                                 # force "noutput_items" to be a multiple of Nsom (complex symbols in this case) during each work cycle -> what is the minimum integer number of output symbols needed to map an integer number of input bytes?
        self.L = int(log2(M))                                               # number of bits per symbol [b/S]
        self.Rs = self.Rb/log2(self.M)                                      # symbol rate [S/s]
        self.dev = self.h*self.Rs/2                                         # inner frequency deviation [Hz]
        self.Ts = 1/(self.osf*self.Rs)                                      # sample period (inverse of Fs) [s]
        self.OvSaCnt = 0                                                    # overall sample counter over all work cycles (see NOTE#1)
        self.GrayMap = self.GetGrayTable()


    """
    " Function for converting an input binary array into the corresponding decimal
    " value.
    """
    def bi2de( self, InBin ) :
        OutDe = str(InBin).replace(' ','').replace(',','')
        OutDe = OutDe.replace(']','').replace('[','')
        return int(OutDe,2)


    """
    " Function for retrieving Gray mapping table according to modulation order.
    """
    def GetGrayTable( self ) :
        GrayMtx = zeros((self.M,self.L),dtype=int)
        LastCell = [[0],[1]]
        GrayMtx[0:2,-1:] = LastCell
        for j in range(1,self.L) :
            GrayMtx[2**j:2**(j+1),-j:] = flipud(LastCell)
            GrayMtx[2**j:2**(j+1),-j-1] = 1
            LastCell = GrayMtx[0:2**(j+1),-j-1:]
        GrayMap = zeros(self.M,dtype=int)
        for i in range(self.M) :
            j = 0
            while j < self.M :
                if j == self.bi2de(GrayMtx[i,:]) :
                    GrayMap[i] = j
                    break
                else :
                    j += 1
        return GrayMap


    """
    " Function for generating random bits and mapping them into frequency symbols
    " as a function of the selected modulation order and according to Gray coding.
    """
    def MapSymbs( self, InBytes ) :
        Nbits = 8*len(InBytes)
        TxBits = zeros(Nbits,dtype=uint8)
        for j in range(Nbits) :
            ByteIdx = int(j/8)
            BitIdx = j%8
            TxBits[j] = ((uint8(InBytes[ByteIdx])) >> 7-BitIdx) & 0x01
        SymbLen = int(Nbits/self.L)
        OutSymbs = zeros(SymbLen,dtype=int)
        MinVal = 1-2**self.L
        for i in range(SymbLen) :
            OutSymbs[i] = MinVal+2*self.GrayMap[self.bi2de(TxBits[i*self.L:(i+1)*self.L])]
        return OutSymbs


    def forecast(self, noutput_items, ninput_items_required):
        for i in range(len(ninput_items_required)):
            ninput_items_required[i] = 0                                    # NB: the exact value would be "Nfcast", but keeping it to 0 allows the work cycle to be executed even when no input items are present (so to generate nullsamples to always feed the USRP)


    def general_work(self, input_items, output_items):
        len_in = len(input_items[0])                                        # number of input items (bytes)
        len_out = len(output_items[0])                                      # output buffer size (complex samples)
        in_vect = input_items[0]                                            # input items vector (named "input_items[0][:]" by GNUR default, thus it's a matrix)
        out_vect = output_items[0]                                          # output items vector (named "output_items[0][:]" by GNUR default, thus it's a matrix)
        Nin = 0                                                             # number of input items (bytes) to consumed in the current work cycle
        Nout = 0                                                            # number of output items (complex symbols) to be produced in the current work cycle
        if( len_in > 0 ) :                                                  # if there are input items available...    
            while ( ((len_in-Nin) >= self.Nfcast) and ((len_out-Nout) >= self.Nsom*self.osf) ) :
                Symbs = self.MapSymbs(in_vect[Nin:Nin+self.Nfcast])         # convert input bytes into symbols according to Gray mapping scheme                
                # self.consume_each(Nfcast)                                 # NB: consume Nfcast input items per while loop cycle just after using them -> this is an alternative to the usual overall "consume" call at the end of the work cycle (see NOTE#2)
                Nin = Nin+self.Nfcast                                       # update the number of input items to be consumed
                FskSamps = [i*self.dev for i in list(repeat(Symbs,self.osf))]       # multiply all symbols by the inner deviation and then oversample
                TimeBB = [(i+self.OvSaCnt+Nout)*self.Ts for i in range(len(Symbs)*self.osf)]        # time axis for the baseband waveform
                out_vect[Nout:Nout+self.Nsom*self.osf] = cos([i*2*pi for i in multiply(FskSamps,TimeBB)])       # estimate in-phase part of the FSK baseband waveform
                out_vect[Nout:Nout+self.Nsom*self.osf] += 1j*sin([i*2*pi for i in multiply(FskSamps,TimeBB)])   # add quadrature part of the FSK baseband waveform
                Nout = Nout+self.Nsom*self.osf                              # update the number of output items to be produced         
            self.OvSaCnt = self.OvSaCnt+Nout                                # update overall sample counter
        else :
            DummySz = 2                                                     # dummy vector length (don't care exact value)
            out_vect[0:DummySz] = 0+0*1j                                    # set output vector to dummy value
            Nout += DummySz                                                 # update the number of output items to be produced  
            self.OvSaCnt = 0                                                # reset overall sample counter
        #print(len_in,len_out,Nin,Nout)
        self.consume(0, Nin)                                                # tell the runtime system how many input items to consume in this cycle (on port #0) -> NB: this is equivalent to "self.consume_each(Nin)"
        return Nout                                                         # tell the runtime system how many output items to produce in this cycle



# NOTE#1: "OvSaCnt" is needed only in case "h" is not integer to assure time axis continuity. For integer "h" values (which means that
#         dev_j and Rs arerelated through an intiger constant), it could be removed or simply kept always to 0. This might create issues
#         for transmissions of 10^6 consecutive bytes (since OvSaCnt might overflow), but so long transmissions do not exist in practical:
#         the overall stream can be simply divided into packets (each of them with an Tx index in the header) and applying some delay (e.g.
#         1 ms) between one packet and the next (so to reset OvSaCnt during each delay).

# NOTE#2: The "consume_each" call should be invoked after any read on the input buffer (if the read items are no more needed). This helps
#         optimizing the operation: since GNUR is a multi-threaded system, this can avoid scenarios where the samples you want to read have
#         been already overwritten by the system (however, this can happen only for very critical and demanding high sample rate applications).
