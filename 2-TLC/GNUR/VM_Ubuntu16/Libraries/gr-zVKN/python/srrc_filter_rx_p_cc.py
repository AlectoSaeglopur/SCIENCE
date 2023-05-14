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
from numpy import zeros, complex64, sqrt, pi, sin, cos

class srrc_filter_rx_p_cc(gr.basic_block):
    """
    docstring for block srrc_filter_rx_p_cc
    """
    def __init__(self, sps, span, beta):
        gr.basic_block.__init__(self,
            name="srrc_filter_rx_p_cc",
            in_sig=[complex64],
            out_sig=[complex64])
        self.sps = sps
        self.Taps = self.GetSrrcTaps(beta,float(span),float(sps))
        self.Ntaps = len(self.Taps)
        self.WinSz = 8*sps
        self.FirRegs = zeros(self.Ntaps-1,dtype=complex)


    """
    " Function to retrieve SRRC filter taps specifying design parameters.
    """
    def GetSrrcTaps( self, beta, span, sps ) :
        Ntaps = int(sps*span+1)
        Taps = zeros(Ntaps,dtype=float)
        epsilon = 1e-30
        ZeroVal = 1/(2*pi*sps)*(pi*(beta+1)*sin(pi*(beta+1)/(4*beta))-4*beta*sin(pi*(beta-1)/(4*beta))+pi*(beta-1)*cos(pi*(beta-1)/(4*beta)))
        for j in range(Ntaps) :
            if j == int(sps*span/2) :
                Taps[j] = -1/(pi*sps)*(pi*(beta-1)-4*beta)
            else :
                Time = (j-sps*span/2)/sps
                if abs(abs(4*beta*Time)-1) < epsilon :
                    Taps[j] = ZeroVal
                else :
                    Taps[j] = -4*beta/sps*(cos((1+beta)*pi*Time)+sin((1-beta)*pi*Time)/(4*beta*Time))/(pi*((4*beta*Time)**2-1))
        Energy = 0
        for j in range(Ntaps) :
            Energy = Energy+Taps[j]**2
        Energy = sqrt(Energy)
        for j in range(Ntaps) :
            Taps[j] = Taps[j]/Energy
        
        for j in range(Ntaps) :
            print(str(j+1)+' | '+str(round(Taps[j],5)))
        #exit()
        return Taps


    """
    " Function for performing finite impulse response (FIR) filtering according
    " to the specified taps on the input sample stream.
    """
    def FirFilter( self, InSamps ) :
        Len = len(InSamps)
        OutSamps = zeros(Len,dtype=complex)
        for i in range(Len) :
            InValue = InSamps[i]
            OutValue = self.Taps[0]*InValue
            for j in range(1,self.Ntaps) :
                OutValue += self.Taps[j]*self.FirRegs[j-1]
            OutSamps[i] = OutValue

            for j in range(self.Ntaps-2,0,-1) :
                self.FirRegs[j] =  self.FirRegs[j-1]
            self.FirRegs[0] = InValue
        return OutSamps


    def forecast(self, noutput_items, ninput_items_required):
        for i in range(len(ninput_items_required)):
            ninput_items_required[i] = self.WinSz


    def general_work(self, input_items, output_items):
        len_in = len(input_items[0])                                        # number of input items (complex samples)
        len_out = len(output_items[0])                                      # output buffer size (complex samples)
        in_vect = input_items[0]                                            # input items vector (named "input_items[0][:]" by GNUR default, thus it's a matrix)
        out_vect = output_items[0]                                          # output items vector (named "output_items[0][:]" by GNUR default, thus it's a matrix)
        Nin = 0                                                             # number of input items (bytes) to consumed in the current work cycle
        Nout = 0                                                            # number of output items (complex samples) to be produced in the current work cycle
        while ( ((len_in-Nin) >= self.WinSz) and ((len_out-Nout) >= self.WinSz) ) :
            out_vect[Nout:Nout+self.WinSz] = self.FirFilter(in_vect[Nin:Nin+self.WinSz])
            Nin += self.WinSz
            Nout += self.WinSz
        self.consume_each(Nin)                                              # tell the runtime system how many input items to consume in this cycle
        return Nout
