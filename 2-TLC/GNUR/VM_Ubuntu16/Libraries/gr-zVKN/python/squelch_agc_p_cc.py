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

from numpy import zeros, sqrt, complex64, conj
from gnuradio import gr

class squelch_agc_p_cc(gr.basic_block):
    """
    * INPUT : Complex stream
    * OUTPUT : Squelched and AGC compensated complex samples 
    * PARAMETERS :
      - WinSz = AGC window size [Sa]
      - SqEnab = Squelch enable/disable
      - SqLev = Squelch power level [W]
      - AgcMode = AGC mode (Amp&Ofs or Power)
      - OfsRef = DC-offset reference [V] (Amp&Ofs AGC mode only)
      - AmpRef = Amplitude reference [V] (Amp&Ofs AGC mode only)
      - PwrRef = Amplitude reference [W]  (Power AGC mode only)
      - OfsGain = DC-offset loop gain [0-1] (Amp&Ofs AGC mode only)
      - AmpGain = Amplitude loop gain [0-1] (Amp&Ofs AGC mode only)
      - PwrGain = Power loop gain [0-1] (Power AGC mode only)
      - VoutMax = Maximum output level [V]
    """
    def __init__(self, WinSz, SqEnab, SqLev, AgcMode, OfsRef, AmpRef, PwrRef, OfsGain, AmpGain, PwrGain, VoutMax ):
        gr.basic_block.__init__(self,
            name="squelch_agc_p_cc",
            in_sig=[complex64],
            out_sig=[complex64])
        self.WinSz = WinSz
        self.SqEnab = SqEnab
        self.SqLev = SqLev
        self.AgcMode = AgcMode                                              # True = Amp&Ofs mode, False = Power mode
        self.OfsRef = OfsRef
        self.AmpRef = AmpRef
        self.PwrRef = PwrRef
        self.OfsGain = OfsGain
        self.AmpGain = AmpGain
        self.PwrGain = PwrGain
        self.VoutMax = VoutMax
        self.OfsX = 0+0j                                                    # Starting values of DC offset compensation factor (I+Q) (Amp&Ofs AGC mode only)
        self.AmpX = 1+1j                                                    # Starting values of amplitude compensation factor (I+Q)
        self.set_output_multiple(self.WinSz)                                # force "noutput_items" to be a multiple of WinSz


    """
    " Function to calculate the mean value of input complex stream.
    """
    def GetMean( self, InSgn ) :
        Mean = (sum(InSgn.real)+1j*sum(InSgn.imag))/len(InSgn)
        return Mean


    """
    " Function implementing Squelch and AGC DC-offset and amplitude compensations.
    """
    def SquelchAgc( self, InSgn ) :
        OutSgn = zeros(self.WinSz,dtype=complex)
        ## 1. AGC Amp&Ofs mode [see NOTE#1] ##
        if self.AgcMode == True :
            # OFFSET CALCULATION #
            MeanWin = self.GetMean(InSgn)
            OfsErr = MeanWin-self.OfsX-self.OfsRef                              # Estimate DC-offset error
            self.OfsX += OfsErr*self.OfsGain                                    # Update DC-offset compensation factor
            # AMPLITUDE CALCULATION #
            PwrWin = (sum((InSgn.real-MeanWin.real)**2)+ \
                1j*sum((InSgn.imag-MeanWin.imag)**2))/self.WinSz                # Estimate AC power within current window
            AmpErr = self.AmpRef.real/sqrt(2*PwrWin.real)/self.AmpX.real+ \
                1j*self.AmpRef.imag/sqrt(2*PwrWin.imag)/self.AmpX.imag          # Estimate amplitude error -> NB: "sqrt(2*PwrWin))" represents the corresponding signal amplitude within current window
            self.AmpX = self.AmpX.real*(1+(AmpErr.real-1)*self.AmpGain)+ \
                1j*self.AmpX.imag*(1+(AmpErr.imag-1)*self.AmpGain)              # Update amplitude compensation factor
            # CHECK SQUELCH CONDITION #
            OvPwr = PwrWin.real+PwrWin.imag+ MeanWin*conj(MeanWin)              # Overall signal power within window (DC+AC & I+Q)
            if (self.SqEnab == True) and (OvPwr < self.SqLev) :
                SqGate = 0
            else :
                SqGate = 1
            # OUTPUT COMPENSATION #
            OutSgn = SqGate*(MeanWin-self.OfsX+self.AmpX.real*(InSgn.real-MeanWin.real)+ \
                1j*self.AmpX.imag*(InSgn.imag-MeanWin.imag))
        ## 2. AGC Power mode (see NOTE#1)  ##
        else :
            # POWER CALCULATION #
            RePwrWin = (sum((InSgn.real)**2))/self.WinSz                        # Estimate total I-power within current window (AC+DC)
            ImPwrWin = (sum((InSgn.imag)**2))/self.WinSz                        # Estimate total Q-power within current window (AC+DC)
            AmpErr = sqrt(self.PwrRef.real/RePwrWin)/self.AmpX.real+ \
                1j*sqrt(self.PwrRef.imag/ImPwrWin)/self.AmpX.imag
            self.AmpX = self.AmpX.real*(1+(AmpErr.real-1)*self.PwrGain)+ \
                    1j*self.AmpX.imag*(1+(AmpErr.imag-1)*self.PwrGain)
            # CHECK SQUELCH AND CLIPPING CONDITIONS #
            if (self.SqEnab == True) and (RePwrWin < self.SqLev) :
                SqGate = 0
            else :
                Vout = sqrt(2*RePwrWin)*self.AmpX.real
                if Vout > self.VoutMax :
                    SqGate = self.VoutMax/Vout                                  # attenuate output signal if its amplitude is above "VoutMax" threshold (to avoid signal overshooting at the beginning of packet which would create issues to the following Sync Word correlator)
                else :
                    SqGate = 1

            if (self.SqEnab == True) and (ImPwrWin < self.SqLev) :
                SqGate += 0j
            else :
                Vout = sqrt(2*ImPwrWin)*self.AmpX.imag
                if Vout > self.VoutMax :
                    SqGate += 1j*self.VoutMax/Vout                              # attenuate output signal if its amplitude is above "VoutMax" threshold (to avoid signal overshooting at the beginning of packet which would create issues to the following Sync Word correlator)
                else :
                    SqGate += 1j            
            # OUTPUT COMPENSATION #
            OutSgn = SqGate.real*InSgn.real*self.AmpX.real+SqGate.imag*1j*InSgn.imag*self.AmpX.imag
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
            out_vect[Nout:Nout+self.WinSz] = self.SquelchAgc(in_vect[Nin:Nin+self.WinSz])
            Nin += self.WinSz
            Nout += self.WinSz
        self.consume_each(Nin)                                              # tell the runtime system how many input items to consume in this cycle
        return Nout                                                         # tell the runtime system how many output items to produce in this cycle


    ### NOTES ###

    # 1. In the AGC "Amp&Ofs" mode the DC-offset and AC-amplitude requirement are treated and compensated separately.
    #    This is ideal for attenuated pure sinusoidal signals with undesidered DC offsets.
    #
    #    In the AGC "Power" mode the AC and DC signal components are treated together and the compensation performed
    #    only in terms of overall power. This is more suitable for modulated signals, where the presence of a short-
    #    term DC component is possible (depending on the Tx bit stream) and should not be avoided or removed. However,
    #    note this assumes the input signal does not have undesired strong DC offsets, otherwise the algorithm output
    #    is not reliable. To assure this, use hardware or software DC blocker before.