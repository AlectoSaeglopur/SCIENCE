"""
" Title: DIGITAL FREQUENCY MODULATORS (FSK, CPFSK AND GFSK)
" Author: Filippo Valmori
" Date: 14/06/2020
" Reference: [1] https://en.wikipedia.org/wiki/Frequency-shift_keying
"""

### LIBRARIES ###

from numpy import zeros, log2, flipud, linspace, multiply, \
    pi, sin, cos, repeat, float32
from numpy.fft import fft, fftshift
from random import randint
from math import floor, log, log10, exp, sqrt
from scipy.interpolate import interp1d
from time import time
import matplotlib.pyplot as mpl


### EXTRA FUNCTIONS ###

"""
" Function for checking the input parameters correctness.
"""
def CheckParam( M, Nbits, osf ) :
    if log2(M) != round(log2(M)) :
        raise Exception('Invalid modulation order')
    elif Nbits % log2(M) != 0 :
        raise Exception('Invalid number of bits')
    elif osf < 2 or osf != round(osf) :
        raise Exception('Invalid oversampling factor')


"""
" Function for converting an input binary array into the corresponding decimal
" value.
"""
def bi2de( InBin ) :
    OutDe = str(InBin).replace(' ','').replace(',','')                          # Convert array into a string
    OutDe = OutDe.replace(']','').replace('[','')                               # Remove useless characters from string
    return int(OutDe,2)                                                         # Convert binary string into decimal value


"""
" Function for generating random bits and mapping them into frequency symbols
" as a function of the selected modulation order and according to Gray coding.
"""
def GetSymbs( Nbits, M ) :
    # rnd.seed(76)                                                              # Set specific random seed
    TxBits = [randint(0,1) for j in range(Nbits)]                               # Random source bits generation
    L = int(log2(M))                                                            # Number of bits per symbol
    GrayMtx = zeros((M,L),dtype=int)
    LastCell = [[0],[1]]
    GrayMtx[0:2,-1:] = LastCell                                                 # Gray matrix
    for j in range(1,L) :
        GrayMtx[2**j:2**(j+1),-j:] = flipud(LastCell)
        GrayMtx[2**j:2**(j+1),-j-1] = 1
        LastCell = GrayMtx[0:2**(j+1),-j-1:]
    GrayMap = zeros(M,dtype=int)                                                # Gray map
    for i in range(M) :
        j = 0
        while j < M :
            if j == bi2de(GrayMtx[i,:]) :
                GrayMap[i] = j
                break
            else :
                j += 1
    SymbLen = int(Nbits/L)                                                      # Symbol length [S]
    OutSymbs = zeros(SymbLen,dtype=int)                                         # Symbol stream
    MinVal = 1-2**L
    for i in range(SymbLen) :
        OutSymbs[i] = MinVal+2*GrayMap[bi2de(TxBits[i*L:(i+1)*L])]
    return OutSymbs, SymbLen


"""
" Function for estimating the power spectrum of the input waveform.
"""
def GetFrSamps( dev, Symbs, osf, TsBB ) :
    Nsymbs = len(Symbs)
    FrSamps = [i*dev for i in list(repeat(Symbs,osf))]                             # Multiply symbols for inner deviation and oversample
    TimeBB = [i*TsBB for i in range(Nsymbs*osf)]
    return TimeBB, FrSamps

"""
" Function for implementing an FSK modulator.
"""
def FskModulator( FrSamps, TimeBB ) :
    FskWaveI = cos([i*2*pi for i in multiply(FrSamps,TimeBB)])                     # In-phase part of the FSK baseband waveform
    FskWaveQ = sin([i*2*pi for i in multiply(FrSamps,TimeBB)])                     # Quadrature part of the FSK baseband waveform
    return FskWaveI, FskWaveQ

"""
" Function for implementing an CPFSK modulator.
"""
def CpfskModulator( FrSamps, TsBB ) :
    CpfskPcmPh = [j*2*pi for j in Integrator(FrSamps,TsBB)]    
    CpfskWaveI = cos(CpfskPcmPh)                                                    # In-phase part of the CPFSK baseband waveform
    CpfskWaveQ = sin(CpfskPcmPh)                                                    # Quadrature part of the CPFSK baseband waveform
    return CpfskPcmPh, CpfskWaveI, CpfskWaveQ

"""
" Function for implementing an GFSK modulator.
"""
def GfskModulator( FrSamps, TsBB ) :
    GfskPcmPh = [j*2*pi for j in Integrator(FrSamps,TsBB)]                      # Filtering by means of integrator
    GfskWaveI = cos(GfskPcmPh)                                                      # In-phase part of the GFSK baseband waveform
    GfskWaveQ = sin(GfskPcmPh)                                                      # Quadrature part of the GFSK baseband waveform
    return GfskPcmPh, GfskWaveI, GfskWaveQ   


"""
" Function for estimating the power spectrum of the input waveform.
"""
def GetSpect( Sgn, Fs ) :
    Ns = len(Sgn)                                                               # Length (in samples) of the input waveform
    dF = Fs/Ns                                                                  # Discretization step for frequency axis                  
    FreqAx = linspace(-Fs/2,Fs/2,floor(Fs/dF))                                  # Frequency axis for spectrum plot
    CpxSpect = [i/Ns for i in fftshift(fft(Sgn))]                               # Complex spectrum
    PwrSpect = [20*log10(abs(i)) for i in CpxSpect]                             # Power spectrum (in dBW)
    return FreqAx, PwrSpect


"""
" Function for interpolating (with linear or cubic method) the baseband signal
" to get the bandpass equivalent.
"""
def InterpRF( TimeBB, SgnBB, FsRF, Mth, Fc ) :
    if Mth == 'LIN' :
        Freal = interp1d(TimeBB,SgnBB.real,kind='linear')                       # In-phase part interpolating function
        Fimag = interp1d(TimeBB,SgnBB.imag,kind='linear')                       # Quadrature part interpolating function
        TimeRF = linspace(0,TimeBB[-1],floor(TimeBB[-1]*FsRF))                  # Time axis for RF waveform 
        SgnRF = [x-y for x,y in zip(multiply(Freal(TimeRF),                     # Radio-frequency signal
            cos([i*2*pi*Fc for i in TimeRF])), multiply(
            Fimag(TimeRF),sin([i*2*pi*Fc for i in TimeRF])))]
    elif Mth == 'CUB' :
        Freal = interp1d(TimeBB,SgnBB.real,kind='cubic')
        Fimag = interp1d(TimeBB,SgnBB.imag,kind='cubic')
        TimeRF = linspace(0,TimeBB[-1],floor(TimeBB[-1]*FsRF))                  # Time axis for RF waveform 
        SgnRF = [x-y for x,y in zip(multiply(Freal(TimeRF),                     # Radio-frequency signal
            cos([i*2*pi*Fc for i in TimeRF])),multiply(
            Fimag(TimeRF),sin([i*2*pi*Fc for i in TimeRF])))]
    elif Mth == 'NUL' :
        TimeRF = [0,1]
        SgnRF = [0,1]
    return TimeRF, SgnRF


"""
" Function for integrating the input signal, providing as input also its
" sample period (Ts).
"""
def Integrator( InSamps, Ts ) :
    Len = len(InSamps)
    OutSamps = zeros(Len)
    LastOut = 0
    for j in range(Len) :
        LastOut += Ts*InSamps[j]
        OutSamps[j] = LastOut
    return OutSamps


"""
" Function for estimating the Gaussian filter taps as a function of parameters
" sps, span and BT product (aka beta).
"""
def GetGaussTaps( beta, span, sps ) :
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
" Function for performing finite impulse response (FIR) filtering according
" to the specified taps on the input sample stream.
"""
def FirFilter( InSamps, Taps ) :
    Ntaps = len(Taps)
    FirDelay = int((Ntaps-1)/2)
    StateReg = zeros(Ntaps-1)
    Len = len(InSamps)
    OutSamps = zeros(Len)
    for i in range(Len+FirDelay) :
        if i < Len :
            InValue = InSamps[i]
        else :
            InValue = 0
        if i >= FirDelay :
            OutValue = Taps[0]*InValue
            for j in range(1,Ntaps) :
                OutValue += Taps[j]*StateReg[j-1]
            OutSamps[i-FirDelay] = OutValue
        for j in range(Ntaps-2,0,-1) :
            StateReg[j] =  StateReg[j-1]
        StateReg[0] = InValue
    return OutSamps


"""
" Function for linearly interpolating the baseband signal to get the bandpass
" equivalent at the SDR sample rate.
"""
def InterpSdr( TimeBB, SgnBB, FsSDR ) :
    TimeSDR = linspace(0,TimeBB[-1],floor(TimeBB[-1]*FsSDR))                    # Time axis for BB waveform at SDR sample rate
    Freal = interp1d(TimeBB,SgnBB.real,kind='linear')                           # In-phase part interpolating function
    Fimag = interp1d(TimeBB,SgnBB.imag,kind='linear')                           # Quadrature part interpolating function
    SdrWaveI = Freal(TimeSDR)
    SdrWaveQ = Fimag(TimeSDR)
    return SdrWaveI, SdrWaveQ

"""
" Function for IQ samples into binary file.
"""
def StoreIntoBin( SdrWaveI, SdrWaveQ, Label ) :
    CpxLen = len(SdrWaveI)
    StreamIQ = float32(zeros(2*CpxLen))                                         # Stream of I-Q samples represented as float32
    for i in range(2*CpxLen) :
        if i%2 == 0 :
            StreamIQ[i] = float32(SdrWaveI[int(i/2)])
        else :
            StreamIQ[i] = float32(-SdrWaveQ[int((i-1)/2)])
    fid = open('Samples-IQ_'+Label+'.bin',"wb")                                  # Write samples into binary file
    fid.write(StreamIQ)
    fid.close()