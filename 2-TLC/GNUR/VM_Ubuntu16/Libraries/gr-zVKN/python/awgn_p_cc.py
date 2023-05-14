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
from numpy import complex64, sqrt, multiply, zeros
from numpy.random import normal

class awgn_p_cc(gr.basic_block):
    """
    * INPUT : complex stream
    * OUTPUT : complex noisy stream
    * PARAMETERS :
      - Gain = Gain (or attenuation) factor [dB]
      - N0 = Noise power [dBW]
      - Dly = Delay [Sa]
    """
    def __init__(self, Gain, N0, Dly):
        gr.basic_block.__init__(self,
            name="awgn_p_cc",
            in_sig=[complex64],
            out_sig=[complex64])
        self.Gain = 10**(Gain/10.0)
        self.N0 = 10**(N0/10.0)
        self.WinSz = 256                                                                # Internal window size [Sa]
        self.Dly = Dly                                                                  # Channel delay [Sa]


    def AwgnChan( self, InVect ) :
        IoLen = len(InVect)
        Noise = normal(0,sqrt(self.N0),IoLen)+ \
            1j*normal(0,sqrt(self.N0),IoLen)                                            # Add noise (assuming 0-mean)
        OutVect = multiply(self.Gain,InVect)+Noise
        return OutVect


    def forecast(self, noutput_items, ninput_items_required):
        for i in range(len(ninput_items_required)):
            ninput_items_required[i] = self.WinSz                                       # run the block when at least WinSz new input samples are available (assuming contnuous input, see test_dvbs.grc)


    def general_work(self, input_items, output_items):
        len_in = len(input_items[0])
        len_out = len(output_items[0])
        in_vect = input_items[0]
        out_vect = output_items[0]
        Nin = 0
        Nout = 0
        if self.Dly > 0 :
            if (len_out-Nout) > self.Dly :
                out_vect[Nout:Nout+self.Dly] = self.AwgnChan(zeros(self.Dly,dtype= complex))
                Nout += self.Dly
                self.Dly = 0
            else :
                out_vect[Nout:Nout+len_out-Nout] = self.AwgnChan(zeros(len_out-Nout),dtype= complex)
                Nout += len_out-Nout
                self.Dly -= len_out-Nout

        else :
            while ( (len_in-Nin) > self.WinSz) and ((len_out-Nout) > self.WinSz ) :
                out_vect[Nout:Nout+self.WinSz] = self.AwgnChan(in_vect[Nin:Nin+self.WinSz])
                Nin += self.WinSz
                Nout += self.WinSz
        self.consume_each(Nin)
        return Nout
