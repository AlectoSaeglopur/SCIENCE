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
from numpy import complex64, zeros, log2, pi, flipud, sin, cos, sqrt, \
    concatenate, conj, argmax, argmin
from cmath import exp
from scipy.signal import correlate
import pmt

import matplotlib.pyplot as mpl


class psk_decoder(gr.basic_block):
    """
    * INPUT : complex sample stream
    * OUTPUT : packet content message
    * PARAMETERS :
      - Order = PSK modulation order
      - PhOfs = PSK constellation phase offset [deg]
      - Rotat = PSK constellation rotation
      - SwVal = Expected SyncWord value
      - SwCorTlr = SyncWord correlation tolernce [%]
      - WinSp = Integration window moving step [as a multiple of "osf"]
      - LenSz = Length-field size [B]
      - beta = SRRC filter roll-off factor
      - span = SRRC filter span [Sy]
      - osf = SRRC filter sps [Sa/Sy]
    """
    def __init__(self, Order, PhOfs, Rotat, SwVal, SwCorTlr, WinSp, LenSz, beta, span, osf):
        gr.basic_block.__init__(self,
            name="psk_decoder",
            in_sig=[complex64],
            out_sig=None)
            #out_sig=[complex64])
        self.message_port_register_out(pmt.intern('port_out'))
        self.M = Order
        self.L = int(log2(Order))                                                   # PSK number of bits per symbol [Sy/b]
        self.PhOfs = pi*PhOfs/180.0                                                 # PSK constellation phase offset (converted from deg) [rad]
        self.Rotat = Rotat
        self.osf = osf                                                              # Oversampling factor [Sa/Sy]
        self.LenSz = int(8*LenSz/self.L*self.osf)                                   # Expected packets LENGTH field size (converted from B) [Sa]
        self.WinSp = WinSp*self.osf                                                 # Integration window moving step [Sa]
        self.PskTable = self.GetPskTable()                                          # Retrieve PSK mapping table
        self.RccTaps = self.GetSrrcTaps(beta,float(span),float(osf))                # Retrieve SRRC filter taps
        [self.SwSgn, self.CorThr] = self.GetSwReplica(SwVal,SwCorTlr)               # Calculate expected SyncWord signal replica
        self.WinSz = len(self.SwSgn)                                                # Integration window size [Sa] (NB: DO NOT CHANGE, best configuration)
        self.SyncSt = 'SEARCHING'
        self.MaxIdx = 0                                                             # Initialize max-correlation index to dummy value
        self.MaxCor = 0                                                             # Initialize max-correlation value to dummy value
        self.NskipLF = 0
        self.RdCycSz = 4*self.osf
        self.PktLen = 0


    """
    " Function for converting an input binary array into the corresponding decimal
    " value.
    """
    def bin2dec( self, InBin ) :
        OutDe = str(InBin).replace(' ','').replace(',','')
        OutDe = OutDe.replace(']','').replace('[','') 
        return int(OutDe,2)


    """
    " Function for converting an input decimal value into the corresponding binary array
    " (specifying also the number of bits for the representation).
    """
    def dec2bin( self, Val, Ndig) :
        OutMtx = zeros(Ndig,dtype=int)
        for j in range(Ndig) :
            OutMtx[Ndig-j-1] = Val%2
            Val = int(Val/2)
        return OutMtx


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


    """
    " Function for hard-demapping the input symbols into bits according to Table
    """
    def Demapper( self, InSymbs ) :
        InLen = len(InSymbs)
        OutBits = zeros(InLen*self.L,dtype=int)
        for k in range(InLen) :
            Dist = abs(InSymbs[k].real-self.PskTable['Sy'].real)+ \
                abs(InSymbs[k].imag-self.PskTable['Sy'].imag)
            MinIdx = argmin(Dist)
            OutBits[k*self.L:(k+1)*self.L] = self.dec2bin(self.PskTable['Bi'][MinIdx],self.L)
        return OutBits


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
        return Taps


    """
    " Function to upsample input complex stream by a specific factor (with all-zero filling).
    """
    def Upsample( self, InVect ):
        LenIn = len(InVect)
        OutVect = zeros(self.osf*LenIn,dtype=complex)
        for i, val in enumerate(InVect) :
            OutVect[i*self.osf] = val
        return OutVect


    """
    " Function to downsample input complex stream by a specific factor.
    """
    def Downsample( self, InVect, sps ):
        OutVect = InVect[::sps]
        return OutVect


    """
    " Function for performing finite impulse response (FIR) filtering according
    " to the specified taps on the input sample stream.
    """
    def FirFilter( self, InSamps ) :
        Ntaps = len(self.RccTaps)
        FirDelay = int((Ntaps-1)/2)
        SyncStReg = zeros(Ntaps-1,dtype=complex)
        Len = len(InSamps)
        OutSamps = zeros(Len+FirDelay,dtype=complex)
        for i in range(Len+FirDelay) :
            if i < Len :
                InValue = InSamps[i]
            else :
                InValue = 0
            if i >= FirDelay :
                OutValue = self.RccTaps[0]*InValue
                for j in range(1,Ntaps) :
                    OutValue += self.RccTaps[j]*SyncStReg[j-1]
                OutSamps[i-FirDelay] = OutValue
            for j in range(Ntaps-2,0,-1) :
                SyncStReg[j] =  SyncStReg[j-1]
            SyncStReg[0] = InValue
        return OutSamps[:-FirDelay]


    """
    " Function for filtering the input signal by means of SRRC taps and
    " adding/removing proper delay samples.
    """
    def RccFilter( self, InVect, rtx ) :
        if rtx == 'TX' :
            TmpVect = self.Upsample(InVect)                                         # Upsample input vector
            OutVect = self.FirFilter(TmpVect)
        else :                                                                      # 'RX' case
            OutVect = self.FirFilter(InVect)                                        # do not apply upsampling in RX
        return OutVect


    """
    " Function for estimating the replica of the Sync Word (at waveform/sample level).
    """
    def GetSwReplica( self, SwVal, SwCorTlr ) :
        ## 1. Estimate local replica of Sync Word signal ##
        SwBits = self.dec2bin(SwVal[0],8)
        for i in range(len(SwVal)-1) :
            SwBits = concatenate((SwBits,self.dec2bin(SwVal[i+1],8)))               # Convert SW stream from bytes to bits
        SwSy = self.Mapper(SwBits)                                                  # Apply bit-to-symbol mapping
        SwSgn = self.RccFilter(SwSy,'TX')                                           # Apply SRRC filtering (as on TX side)
        SwSgn = self.RccFilter(SwSgn,'RX')                                          # Apply SRRC filtering (as on RX side)
        """
        TimeSa = range(len(SwSgn))
        Fig_2 = mpl.figure(num='2')
        mpl.plot([i for i in TimeSa], SwSgn.real, color='blue', linestyle='-', linewidth=1,
            marker='o', markerfacecolor='r', markersize=2, label=" I-Rep")
        mpl.plot([i for i in TimeSa], SwSgn.imag, color='red', linestyle='-', linewidth=1,
            marker='o', markerfacecolor='r', markersize=2, label=" Q-Rep")
        mpl.xlabel('Time [ms]')
        mpl.ylabel('Amplitude [V]')
        mpl.title('TX WAVEFORMS')
        mpl.legend(loc='upper right')
        mpl.grid(color='silver', linestyle='--', linewidth=1)
        mpl.show(block=False)
        mpl.pause(5)
        mpl.close('all')
        """
        #Ncut = 1                                                                    # Number of symbols to be removed (beginning+end)
        #SwSgn = SwSgn[Ncut*self.osf:-Ncut*self.osf]                                 # [see NOTE#1]
        ## 2. Estimate expected SW correlation peak (Y-axis) ##
        SwCorPeak = 0
        for i in range(len(SwSgn)) :
            SwCorPeak += (SwSgn[i]*conj(SwSgn[i])).real                             # Estimate expected correlation peak by executing the standard correlation formula (imag part is always null due to "conj" operator)
        CorThr = SwCorPeak*(100-SwCorTlr)/100                                       # Calculate correlation threshold for synchronization
        #print('CorPek = '+str(SwCorPeak))
        #print('CorThr = '+str(CorThr))
        return SwSgn, CorThr


    """
    " Function for synchronizing the PSK received signal by correlating the
    " latter with a replica of the Sync Word (at waveform/sample level).
    """
    def SearchSw( self, RxSgn ) : 
        CorWin = correlate(RxSgn,self.SwSgn,mode='full').real                       # Correlate input samples with reference/replica signal
        if self.SyncSt == 'SEARCHING' and max(CorWin) > self.CorThr :               # Check if the peak within the current window is above the threshold (Y-axis)
            self.SyncSt = 'LOCKING'
            self.MaxIdx = argmax(CorWin)                                            # Retrieve sample index of peak within j-th window (X-axis)
            self.MaxCor = max(CorWin)                                               # Save correlation peak so far (Y-axis)
        elif self.SyncSt == 'LOCKING' :
            """
            TimeSa = range(len(RxSgn))
            Fig_1 = mpl.figure(num='1')
            mpl.plot([i for i in TimeSa], RxSgn.imag, color='blue', linestyle='-', linewidth=1,
                marker='o', markerfacecolor='r', markersize=2, label=" I-Rx")
            mpl.plot([i for i in TimeSa], self.SwSgn.imag, color='red', linestyle='-', linewidth=1,
                marker='o', markerfacecolor='r', markersize=2, label=" I-Rep")
            mpl.xlabel('Time [ms]')
            mpl.ylabel('Amplitude [V]')
            mpl.title('TX WAVEFORMS')
            mpl.legend(loc='upper right')
            mpl.grid(color='silver', linestyle='--', linewidth=1)
            mpl.show(block=False)
            mpl.pause(2)
            mpl.close('all')
            """
            if max(CorWin) > self.MaxCor :                                          # Check if correlation peak keeps increasing...
                self.MaxIdx = argmax(CorWin)                                        # Update sample index of peak within j-th window (X-axis)
                self.MaxCor = max(CorWin)                                           # Update correlation peak so far (Y-axis)
            else :                                                                  # When peak starts decreasing stop searching
                self.SyncSt = 'LOCKED'
                self.NskipLF = self.MaxIdx-2*self.WinSp+1                           # Update the number of samples to be skipped during next cycle before reading the length-field
                #print('MaxCor = '+str(self.MaxCor))


    def forecast(self, noutput_items, ninput_items_required):
        for i in range(len(ninput_items_required)):
            ninput_items_required[i] = self.WinSz


    def general_work(self, input_items, output_items):
        len_in = len(input_items[0])
        #len_out = len(output_items[0])
        in_vect = input_items[0]
        #out_vect = output_items[0]
        Nin = 0
        Nout = 0
        ## 1. SEARCHING/LOOKING TO SYNC WORD ##
        while (self.SyncSt == 'SEARCHING' or self.SyncSt == 'LOCKING') and ((len_in-Nin) >= self.WinSz) :
            self.SearchSw(in_vect[Nin:Nin+self.WinSz])
            Nin += self.WinSp
            #Nout += self.WinSp
        ## 2. ALIGN TO PACKET HEAD AFTER SYNC WORD DETECTION ##
        if (self.SyncSt == 'LOCKED') and (len_in-Nin) >= self.NskipLF :
            Nin += self.NskipLF
            #Nout += self.NskipLF
            self.SyncSt = 'READ_LEN_FIELD'
        ## 3. READ PACKET LENGTH-FIELD ##
        if (self.SyncSt == 'READ_LEN_FIELD') and (len_in-Nin) >= self.LenSz :
            self.PktLen = self.bin2dec(self.Demapper(self.Downsample(in_vect[Nin:
                Nin+self.LenSz],self.osf)))                                         # Retrieve packet length [B]
            #print( 'RLF'+str(self.PktLen))
            self.PktLen = 8*self.PktLen/self.L*self.osf                             # Convert packet length from [B] to [Sa]
            #out_vect[Nout:Nout+self.LenSz] = in_vect[Nin:Nin+self.LenSz]
            Nin += self.LenSz
            #Nout += self.LenSz
            self.SyncSt = 'READ_DATA'
        ## 4. READ PACKET DATA CONTENT ##
        if (self.SyncSt == 'READ_DATA') and (len_in-Nin) >= self.PktLen :
            RxData = self.Demapper(self.Downsample(in_vect[Nin:Nin+self.PktLen],self.osf))
            PktBy = int(self.PktLen/self.osf*self.L/8)
            msg_out = pmt.make_u8vector(PktBy,0)                                    # Create an all-0 uint8 data message of the specified length
            for j in range(PktBy) :
                pmt.u8vector_set(msg_out,j,self.bin2dec(RxData[8*j:8*(j+1)]))     
            self.message_port_pub(pmt.intern('port_out'),pmt.cons(pmt.PMT_NIL,msg_out))
            Nin += self.PktLen
            #Nout += self.PktLen
            self.SyncSt = 'SEARCHING'
        self.consume_each(Nin)                                                      # Tell the runtime system how many input items to consume in this cycle
        return Nout                                                                 # Tell the runtime system how many output items to produce in this cycle



### NOTES ###

# 1. This section can be enabled to cut the first and last Ncut symbols (thus Ncut*osf samples) of the SW replica. This avoids mismatches
#    between the replica (where the SRRC filtering assumes 0-input at the beginning and end of the stream) and the actual RX signal (where
#    non-null symbols are present before and after the SW). However, the correlation proves to be reliable in any case, thus that's optional.

# 2. It's important to notice this decoder works assuming previous carrier synchronization (needed after RF down-conversion).
#    Thi blocks can be actually seen as a symbol synchronizer!
