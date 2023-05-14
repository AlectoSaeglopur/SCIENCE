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

from numpy import zeros, log2, flipud, linspace, multiply, \
    pi, sin, cos, repeat, uint8, complex64
from numpy.fft import fft, fftshift
from random import randint
from math import floor, log, log10, exp, sqrt


class gfsk_modulator(gr.basic_block):
    """
    * INPUT : byte stream
    * OUTPUT : GFSK modulated complex samples
    * PARAMETERS :
      - M = Modulation order (up to 64)
      - h = Modulation index
      - osf = Oversampling factor [Sa/S]
      - span = span for Gaussian filter representation [S]
      - sps = number of samples per symbol for Gaussian filter representation [Sa/S]
      - BT = 3dB bandwidth - symbol time product
      - Rb = Input bit-rate [b/s]
    """
    def __init__(self, M, h, osf, span, sps, BT, Rb):
        gr.basic_block.__init__(self,
            name="gfsk_modulator",
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
        self.GrayMap = self.GetGrayTable()                                  # retrieve Gray mapping table
        self.GaussTaps = self.GetGaussTaps(BT,span,sps)                     # retrieve Gaussian filter taps
        self.FirStReg = zeros(len(self.GaussTaps)-1)                        # FIR integrator state registers
        self.IntegrSum = 0                                                  # integrator sum value


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
    " Function for estimating the Gaussian filter taps as a function of parameters
    " sps, span and BT product (aka beta).
    """
    def GetGaussTaps( self, beta, span, sps ) :
        alpha = sqrt(log(2)/2)/beta
        Ntaps = span*sps+1
        Taps = zeros(Ntaps)
        for j in range(Ntaps) :
            Time = (j-sps*span/2)/sps
            Taps[j] = sqrt(pi)/alpha*exp(-1*((pi*Time/alpha)**2))
        Sum = sum(Taps)
        Taps = [i/Sum for i in Taps]
        return Taps


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


    """
    " Function for performing finite impulse response (FIR) filtering according
    " to the specified taps on the input sample stream.
    """
    def FirFilter( self, InSamps, Taps ) :
        Ntaps = len(Taps)
        Len = len(InSamps)
        OutSamps = zeros(Len)
        for i in range(Len) :
            OutValue = Taps[0]*InSamps[i]
            for j in range(1,Ntaps) :
                OutValue += Taps[j]*self.FirStReg[j-1]
            OutSamps[i] = OutValue
            for j in range(Ntaps-2,0,-1) :
                self.FirStReg[j] =  self.FirStReg[j-1]
            self.FirStReg[0] = InSamps[i]
        return OutSamps


    """
    " Function for integrating the input signal, providing as input also its
    " sample period (Ts).
    """
    def Integrator( self, InSamps, Ts ) :
        Len = len(InSamps)
        OutSamps = zeros(Len)
        for j in range(Len) :
            self.IntegrSum += Ts*InSamps[j]
            OutSamps[j] = self.IntegrSum
        return OutSamps


    def forecast(self, noutput_items, ninput_items_required):
        for i in range(len(ninput_items_required)):
            ninput_items_required[i] = 0                                    # (see fsk_modular.py for explanation)


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
                GfskFrShift = self.FirFilter(FskSamps,self.GaussTaps)               # filter frequency sample through Gaussian filter
                GfskPcmPh = [j*2*pi for j in self.Integrator(GfskFrShift,self.Ts)]  # calculate modulated phase samples
                out_vect[Nout:Nout+self.Nsom*self.osf] = cos(GfskPcmPh)             # estimate in-phase part of the GFSK baseband waveform
                out_vect[Nout:Nout+self.Nsom*self.osf] += 1j*sin(GfskPcmPh)         # add quadrature part of the GFSK baseband waveform
                Nout = Nout+self.Nsom*self.osf                              # update the number of output items to be produced         
        elif len_out > self.osf :                                           # if no input items are present and output buffer as at lesat "osf" free items       
            DummySz = 1                                                     # dummy vector length
            FskSamps = zeros(DummySz*self.osf)                              # set frequency sample to zero (to empty Gaussian FIR filter)                                   
            GfskFrShift = self.FirFilter(FskSamps,self.GaussTaps)           
            GfskPcmPh = [j*2*pi for j in self.Integrator(GfskFrShift,self.Ts)]
            out_vect[Nout:Nout+DummySz*self.osf] = cos(GfskPcmPh)
            out_vect[Nout:Nout+DummySz*self.osf] += 1j*sin(GfskPcmPh)
            Nout += DummySz*self.osf                                        # update the number of output items to be produced
            if all(x == 0 for x in self.FirStReg) :                         # see NOTE#1
                self.IntegrSum = 0                                          # reset integrator value when Gaussian FIR filter is completely empty
        self.consume(0, Nin)                                                # tell the runtime system how many input items to consume in this cycle (on port #0) -> NB: this is equivalent to "self.consume_each(Nin)"
        return Nout                                                         # tell the runtime system how many output items to produce in this cycle



# NOTE#1: When input items are no more available dummy null-frequency samples are produced in order to empty the Gaussian FIR filter and assure a
#         continuous/smooth tail of the GFSK wave (i.e. handle the FIR delay of span*sps/2 Sa).
#         The integrator value (aka IntegrSum) can be reset to zero (to avoid its overflow upon consecutive packets) after the Gaussian FIR filter
#         cells have been emptied (i.e. all FirStReg[j] = 0) because emptying this Gaussian FIR filter tail assures the final integration sum (namely
#         when each single packet ends) is always an integer value (and thus "GfskPcmPh" an exact multiple of 2*pi). That's why when all input items
#         of a single packet are finished the GFK waveform naturally goes and then stays constant at 1+0j (and moreover, this is optimal since it
#         allows to automatically feed the Tx USRP and following power amplifier with a constant signal which in turn generates a pure carrier).
#         However, note that this "reset continuity" property is valid only for integer value of "h" (e.g. 1.0, 2.0, etc).