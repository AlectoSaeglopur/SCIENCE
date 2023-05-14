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

"""@package agc.py
"""

from numpy import zeros, sqrt, complex64
from gnuradio import gr

class agc_p_cc(gr.basic_block):
    """
    * INPUT : complex stream
    * OUTPUT : DC offset and amplitude compensated complex samples 
    * PARAMETERS :
      - OfsRef = DC-offset reference [V]
      - AmpRef = Amplitude reference [V]
      - WinSz = AGC window size [Sa]
      - OfsGain = DC-offset loop gain [0-1]
      - AmpGain = Amplitude loop gain [0-1]
    """
    def __init__(self, OfsRef, AmpRef, WinSz, OfsGain, AmpGain):
        gr.basic_block.__init__(self,
            name="agc_p_cc",
            in_sig=[complex64],
            out_sig=[complex64])
        self.OfsRef = OfsRef
        self.AmpRef = AmpRef
        self.WinSz = WinSz
        self.OfsGain = OfsGain
        self.AmpGain = AmpGain
        self.OfsX = 0+0j                                                    # Starting values of DC offset compensation factor (I+Q)
        self.AmpX = 1+1j                                                    # Starting values of amplitude compensation factor (I+Q)
        self.set_output_multiple(self.WinSz)                                # force "noutput_items" to be a multiple of WinSz


    """
    " Function to calculate the mean value of input complex stream.
    """
    def GetMean( self, InSgn ) :
        Mean = (sum(InSgn.real)+1j*sum(InSgn.imag))/len(InSgn)
        return Mean


    """
    " Function implementing AGC DC-offset and amplitude compensations.
    """
    def Agc( self, InSgn ) :
        OutSgn = zeros(self.WinSz,dtype=complex)
        # OFFSET CALCULATION #
        MeanWin = self.GetMean(InSgn)
        OfsErr = MeanWin-self.OfsX-self.OfsRef                              # Estimate DC-offset error
        self.OfsX += OfsErr*self.OfsGain                                    # Update DC-offset compensation factor
        # AMPLITUDE CALCULATION #
        PwrWin = (sum((InSgn.real-MeanWin.real)**2)+ \
            1j*sum((InSgn.imag-MeanWin.imag)**2))/self.WinSz                # Estimate mean AC power within current window
        AmpErr = self.AmpRef.real/sqrt(2*PwrWin.real)/self.AmpX.real+ \
            1j*self.AmpRef.imag/sqrt(2*PwrWin.imag)/self.AmpX.imag          # Estimate amplitude error -> NB: "sqrt(2*PwrWin))" represents the corresponding signal amplitude within current window
        self.AmpX = self.AmpX.real*(1+(AmpErr.real-1)*self.AmpGain)+ \
            1j*self.AmpX.imag*(1+(AmpErr.imag-1)*self.AmpGain)              # Update amplitude compensation factor
        # OUTPUT COMPENSATION #
        OutSgn = MeanWin-self.OfsX+self.AmpX.real*(InSgn.real-MeanWin.real)+ \
            1j*self.AmpX.imag*(InSgn.imag-MeanWin.imag)
        return OutSgn


    def forecast(self, noutput_items, ninput_items_required):
        for i in range(len(ninput_items_required)):
            ninput_items_required[i] = self.WinSz                           # run the block when at least WinSz new input samples are available


    def general_work(self, input_items, output_items):
        len_in = len(input_items[0])                                        # number of input items (complex samples)
        len_out = len(output_items[0])                                      # output buffer size (complex samples)
        in_vect = input_items[0]                                            # input items vector (named "input_items[0][:]" by GNUR default, thus it's a matrix)
        out_vect = output_items[0]                                          # output items vector (named "output_items[0][:]" by GNUR default, thus it's a matrix)
        Nin = 0                                                             # number of input items (bytes) to consumed in the current work cycle
        Nout = 0                                                            # number of output items (complex samples) to be produced in the current work cycle
        while ( ((len_in-Nin) >= self.WinSz) and ((len_out-Nout) >= self.WinSz) ) :
            out_vect[Nout:Nout+self.WinSz] = self.Agc(in_vect[Nin:Nin+self.WinSz])
            Nin += self.WinSz
            Nout += self.WinSz
        self.consume_each(Nin)                                              # tell the runtime system how many input items to consume in this cycle
        return Nout                                                         # tell the runtime system how many output items to produce in this cycle