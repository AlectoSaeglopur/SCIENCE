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



### PARAMETERS ###

Nbits = 1200                                            # Number of bits to be simulated
Rb = 12e3                                               # Bit rate [b/s]
Fc = 1e6                                                # Carrier frequency [Hz]
M = 4                                                   # Modulation order
dev = 6e3                                               # Inner frequency deviation [Hz]
osf = 32                                                # Baseband oversampling factor
span = 16                                               # Span for Gaussian filter representation [S] (only GFSK)
sps = 16                                                # Number of samples per symbol for Gaussian filter representation [Sa/S] (only GFSK)
BT = 0.5                                                # 3dB bandwidth - symbol time product (only GFSK)
FsSdr = 250e3                                           # Target baseband sample rate [Sa/s] (e.g. to match SDR requirements)
ModSdr = 'GFSK'                                         # Modulation for GNUR file input

Rs = Rb/log2(M)                                         # Symbol rate [S/s]
h = 2*(M-1)*dev/Rs                                      # Modulation index
FsBB = osf*Rs                                           # Baseband sample rate [Sa/s]
TsBB = 1/FsBB                                           # Baseband sample period [s]
FsRF = 12*Fc                                            # RF sample rate [Sa/s]
InterpMeth = 'LIN'                                      # Interpolating method (LIN or CUB) to pass from BB to RF signal

ScFct = 1e3                                             # Baseband scaling factor (e.g. 1e3 means ms/kHz)
WaveBBxlim = 1e-3*ScFct                                 # Limit on X-axis for BB time plot [ms]
SpectBBxlim = FsBB/2e3                                  # Limit on X-axis for BB spectrum plot [kHz]
SpectBBylim = -120                                      # Limit on Y-axis for BB spectrum plot [dBW]
SpanRFxlim = 10*Rs                                      # Span on X-axis for RF spectrum plot [Hz]
SpectRFylim = -110                                      # Limit on Y-axis for RF spectrum plot [dBW]



### FUNCTIONS ###

"""
" Function for checking the input parameters correctness.
"""
def CheckParam( M, Nbits, osf, ModSDR, InterpMeth ) :
    if log2(M) != round(log2(M)) :
        raise Exception('Invalid modulation order')
    elif Nbits % log2(M) != 0 :
        raise Exception('Invalid number of bits')
    elif osf < 2 or osf != round(osf) :
        raise Exception('Invalid oversampling factor')
    elif ModSDR != 'FSK' and ModSDR != 'CPFSK' and ModSDR != 'GFSK' :
        raise Exception('Invalid SDR modulation')
    elif InterpMeth != 'LIN' and InterpMeth != 'CUB' and InterpMeth != 'NUL' :
        raise Exception('Invalid RF interpolation method')


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
" Function for getting the power spectrum of the input waveform.
"""
def GetSpect( Sgn, Fs ) :
    Ns = len(Sgn)                                       # Length (in samples) of the input waveform
    dF = Fs/Ns                                          # Discretization step for frequency axis
    CpxSpect = [i/Ns for i in fftshift(fft(Sgn))]       # Complex spectrum
    PwrSpect = zeros(len(CpxSpect),dtype=float)
    for j in range(len(CpxSpect)) :
        if abs(CpxSpect[j]) == 0 :
            CpxSpect[j] = 1e-20
        PwrSpect[j] = 20*(log10(abs(CpxSpect[j]))).real                             # Power spectrum (in dBW)
    # OvPwrF = 10*log10(sum([(abs(CpxSpect[j]))**2 for j in range(len(CpxSpect))]))   # Overall signal power estimated in frequency [dBW] (NB: do NOT multiply by dF, that's wrong for this descrete representation!)                                         # Overall signal power [dBW]
    FreqAx = [(-Fs/2+i*dF) for i in range(len(CpxSpect))]                           # Frequency axis for spectrum plot
    # SumT = 0                                                                        
    # for i in range(len(Sgn)) :
    #     SumT += abs(Sgn[i])**2                                                      # use RMS formula to estimate Vrms (simplified since P = Vrms^2/R, with unitary-R assumed)
    # OvPwrT = (10*log10(SumT/len(Sgn))).real
    # print('>> OvPwrT = '+str(round(OvPwrT,2))+' dBW')                               # Overall power estimated in time [dBW] (NB: shall match "OvPwrF")
    return FreqAx, PwrSpect


"""
" Function for interpolating (with linear or cubic method) the baseband signal
" to get the bandpass equivalent.
"""
def InterpRF( TimeBB, SgnBB, FsRF, Mth ) :
    # t_init = time()
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
    # t_delta = time()-t_init
    # print(t_delta)                                                              # Estimate elapsed time [s] 
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
def InterpSdr( TimeBB, SgnBB, FsSdr ) :
    TimeSdr = linspace(0,TimeBB[-1],floor(TimeBB[-1]*FsSdr))                    # Time axis for BB waveform at SDR sample rate
    Freal = interp1d(TimeBB,SgnBB.real,kind='linear')                           # In-phase part interpolating function
    Fimag = interp1d(TimeBB,SgnBB.imag,kind='linear')                           # Quadrature part interpolating function
    SdrWaveI = Freal(TimeSdr)
    SdrWaveQ = Fimag(TimeSdr)
    return TimeSdr, SdrWaveI, SdrWaveQ



### PROCESSING ###

CheckParam(M,Nbits,osf,ModSdr,InterpMeth)                                       # Check the parameters correctness
[Symbs,Nsymbs] = GetSymbs(Nbits,M)                                              # Retrieve random symbols stream and its length
FskSamps = [i*dev for i in list(repeat(Symbs,osf))]                             # Multiply symbols for inner deviation and oversample
TimeBB = [i*TsBB for i in range(Nsymbs*osf)]                                    # Time axis for BB waveform
FskWaveI = cos([i*2*pi for i in multiply(FskSamps,TimeBB)])                     # In-phase part of the FSK baseband waveform
FskWaveQ = sin([i*2*pi for i in multiply(FskSamps,TimeBB)])                     # Quadrature part of the FSK baseband waveform
FskSgnBB = FskWaveI+1j*FskWaveQ                                                 # FSK complex baseband signal
[FskFreqBB,FskSpectBB] = GetSpect(FskSgnBB,FsBB)                                # FSK baseband signal power spectrum 
[TimeRF,FskSgnRF] = InterpRF(TimeBB,FskSgnBB,FsRF,InterpMeth)                   # FSK radio-frequency signal
[FskFreqRF,FskSpectRF] = GetSpect(FskSgnRF,FsRF)                                # FSK radio-frequency signal power spectrum

CpfskPcmPh = [j*2*pi for j in Integrator(FskSamps,TsBB)]                        # Filtering by means of integrator
CpfskWaveI = cos(CpfskPcmPh)                                                    # In-phase part of the CPFSK baseband waveform
CpfskWaveQ = sin(CpfskPcmPh)                                                    # Quadrature part of the CPFSK baseband waveform
CpfskSgnBB = CpfskWaveI+1j*CpfskWaveQ                                           # CPFSK complex baseband signal
[CpfskFreqBB,CpfskSpectBB] = GetSpect(CpfskSgnBB,FsBB)                          # CPFSK baseband power spectrum
[TimeRF,CpfskSgnRF] = InterpRF(TimeBB,CpfskSgnBB,FsRF,InterpMeth)               # CPFSK radio-frequency signal
[CpfskFreqRF,CpfskSpectRF] = GetSpect(CpfskSgnRF,FsRF)                          # CPFSK radio-frequency signal power spectrum

GaussTaps = GetGaussTaps(BT,span,sps)                                           # Retrieve Gaussian filter taps
GfskFrShift = FirFilter(FskSamps,GaussTaps)                                     # Apply FIR filtering
GfskPcmPh = [j*2*pi for j in Integrator(GfskFrShift,TsBB)]                      # Filtering by means of integrator
GfskWaveI = cos(GfskPcmPh)                                                      # In-phase part of the GFSK baseband waveform
GfskWaveQ = sin(GfskPcmPh)                                                      # Quadrature part of the GFSK baseband waveform
GfskSgnBB = GfskWaveI+1j*GfskWaveQ                                              # GFSK complex baseband signal
[GfskFreqBB,GfskSpectBB] = GetSpect(GfskSgnBB,FsBB)                             # GFSK baseband power spectrum
[TimeRF,GfskSgnRF] = InterpRF(TimeBB,GfskSgnBB,FsRF,InterpMeth)                 # GFSK radio-frequency signal
[GfskFreqRF,GfskSpectRF] = GetSpect(GfskSgnRF,FsRF)                             # GFSK radio-frequency signal power spectrum

if ModSdr == 'FSK' :
    [TimeSdr,SdrWaveI,SdrWaveQ] = InterpSdr(TimeBB,FskSgnBB,FsSdr)              # Baseband signal resampling at SDR sample rate
elif ModSdr == 'CPFSK' :
    [TimeSdr,SdrWaveI,SdrWaveQ] = InterpSdr(TimeBB,CpfskSgnBB,FsSdr)
elif ModSdr == 'GFSK' :
    [TimeSdr,SdrWaveI,SdrWaveQ] = InterpSdr(TimeBB,GfskSgnBB,FsSdr)
CpxLen = len(SdrWaveI)
StreamIQ = float32(zeros(2*CpxLen))                                             # Stream of I-Q samples represented as float32
for i in range(2*CpxLen) :
    if i%2 == 0 :
        StreamIQ[i] = float32(SdrWaveI[int(i/2)])
    else :
        StreamIQ[i] = float32(-SdrWaveQ[int((i-1)/2)])
fid = open('Samples-IQ'+ModSdr+'.bin',"wb")                                     # Write samples into binary file
fid.write(StreamIQ)
fid.close()



# MESSAGES

print('\n * Rb =',round(Rb/1e3,1),'kb/s')
print(' * M =',M)
print(' * Rs =',round(Rs/1e3,1),'kS/s')
print(' * h =',round(h,1))
print(' * dev =',round(dev/1e3,1),'kHz')
print(' * FsBB =',round(FsBB/1e3,1),' kSa/s')
print(' * FsSDR =',round(FsSdr/1e3,1),' kSa/s')
print(' * BW =',round(2*(Rs+dev*(M-1))/1e3,1),'kHz (Carson\'s rule)')
print(' * Set osf >',int(FsSdr/Rs),'for optimal SDR Fs matching')



### PLOTS ###

Fig_1 = mpl.figure(num='FSK')
Fig_1.subplots_adjust(wspace=.25, hspace=.4)
mpl.subplot(221)
mpl.stem(range(Nsymbs*osf), [i/ScFct for i in FskSamps],  linefmt='orange',
    markerfmt='orange', basefmt='orange', use_line_collection=True)
mpl.xlabel('Sample [#]') 
mpl.ylabel('Frequency Shift [kHz]')
mpl.title('PCM WAVEFORM')
mpl.xlim(-0.05*Nsymbs*osf, 1.05*Nsymbs*osf)
mpl.ylim((1-M)*dev*1.2/ScFct, (M-1)*dev*1.2/ScFct)
mpl.grid(color='silver', linestyle='--', linewidth=1)
mpl.subplot(222)
mpl.plot([i*ScFct for i in TimeBB], FskWaveI, color='red', linestyle='-', linewidth=1, 
    marker='o', markerfacecolor='r', markersize=2, label="In-phase")
mpl.plot([i*ScFct for i in TimeBB], FskWaveQ, color='blue', linestyle='--', linewidth=1, 
    marker='o', markerfacecolor='b', markersize=2, label="Quadrature")
mpl.xlabel('Time [ms]') 
mpl.ylabel('Amplitude [V]')
mpl.title('BASEBAND WAVEFORM')
mpl.xlim(0, WaveBBxlim)
mpl.ylim(-1.2, 1.2)
mpl.legend(loc='upper right')
mpl.grid(color='silver', linestyle='--', linewidth=1)
mpl.subplot(223)
mpl.plot([i/ScFct for i in FskFreqBB], FskSpectBB, color='limegreen', linestyle='-', linewidth=1)
mpl.xlabel('Frequency [kHz]')
mpl.ylabel('Power [dBW]')
mpl.title('BASEBAND SPECTRUM')
mpl.xlim(-SpectBBxlim, SpectBBxlim)
mpl.ylim(SpectBBylim, 0)
mpl.grid(color='silver', linestyle='--', linewidth=1)
mpl.subplot(224)
mpl.plot([i/1e6 for i in FskFreqRF], FskSpectRF, color='darkviolet', linestyle='-', linewidth=1)
mpl.xlabel('Frequency [MHz]')
mpl.ylabel('Power [dBW]')
mpl.title('BANDPASS SPECTRUM')
mpl.xlim((Fc-SpanRFxlim)/1e6, (Fc+SpanRFxlim)/1e6)
mpl.ylim(SpectRFylim, 0)
mpl.grid(color='silver', linestyle='--', linewidth=1)

Fig_2 = mpl.figure(num='CPFSK')
Fig_2.subplots_adjust(wspace=.25, hspace=.4)
mpl.subplot(221)
mpl.stem(range(Nsymbs*osf), CpfskPcmPh,  linefmt='orange',
    markerfmt='orange', basefmt='orange', use_line_collection=True)
mpl.xlabel('Sample [#]') 
mpl.ylabel('Phase Shift [rad]')
mpl.title('PCM WAVEFORM')
mpl.xlim(-0.05*Nsymbs*osf, 1.05*Nsymbs*osf)
mpl.ylim(min(CpfskPcmPh)-5, max(CpfskPcmPh)+5)
mpl.grid(color='silver', linestyle='--', linewidth=1)
mpl.subplot(222)
mpl.plot([(i+TsBB)*ScFct for i in TimeBB], CpfskWaveI, color='red', linestyle='-', linewidth=1, 
    marker='o', markerfacecolor='r', markersize=2, label="In-phase")
mpl.plot([(i+TsBB)*ScFct for i in TimeBB], CpfskWaveQ, color='blue', linestyle='--', linewidth=1, 
    marker='o', markerfacecolor='b', markersize=2, label="Quadrature")
mpl.xlabel('Time [ms]') 
mpl.ylabel('Amplitude [V]')
mpl.title('BASEBAND WAVEFORM')
mpl.xlim(0, WaveBBxlim)
mpl.ylim(-1.2, 1.2)
mpl.legend(loc='upper right')
mpl.grid(color='silver', linestyle='--', linewidth=1)
mpl.subplot(223)
mpl.plot([i/ScFct for i in CpfskFreqBB], CpfskSpectBB, color='limegreen', linestyle='-', linewidth=1)
mpl.xlabel('Frequency [kHz]')
mpl.ylabel('Power [dBW]')
mpl.title('BASEBAND SPECTRUM')
mpl.xlim(-SpectBBxlim, SpectBBxlim)
mpl.ylim(SpectBBylim, 0)
mpl.grid(color='silver', linestyle='--', linewidth=1)
mpl.subplot(224)
mpl.plot([i/1e6 for i in CpfskFreqRF], CpfskSpectRF, color='darkviolet', linestyle='-', linewidth=1)
mpl.xlabel('Frequency [MHz]')
mpl.ylabel('Power [dBW]')
mpl.title('BANDPASS SPECTRUM')
mpl.xlim((Fc-SpanRFxlim)/1e6, (Fc+SpanRFxlim)/1e6)
mpl.ylim(SpectRFylim, 0)
mpl.grid(color='silver', linestyle='--', linewidth=1)

Fig_3 = mpl.figure(num='GFSK')
Fig_3.subplots_adjust(wspace=.25, hspace=.4)
mpl.subplot(221)
mpl.stem(range(Nsymbs*osf), GfskPcmPh,  linefmt='orange',
    markerfmt='orange', basefmt='orange', use_line_collection=True)
mpl.xlabel('Sample [#]') 
mpl.ylabel('Phase Shift [rad]')
mpl.title('PCM WAVEFORM')
mpl.xlim(-0.05*Nsymbs*osf, 1.05*Nsymbs*osf)
mpl.ylim(min(GfskPcmPh)-5, max(GfskPcmPh)+5)
mpl.grid(color='silver', linestyle='--', linewidth=1)
mpl.subplot(222)
mpl.plot([(i+TsBB)*ScFct for i in TimeBB], GfskWaveI, color='red', linestyle='-', linewidth=1, 
    marker='o', markerfacecolor='r', markersize=2, label="In-phase")
mpl.plot([(i+TsBB)*ScFct for i in TimeBB], GfskWaveQ, color='blue', linestyle='--', linewidth=1, 
    marker='o', markerfacecolor='b', markersize=2, label="Quadrature")
mpl.xlabel('Time [ms]') 
mpl.ylabel('Amplitude [V]')
mpl.title('BASEBAND WAVEFORM')
mpl.xlim(0, WaveBBxlim)
mpl.ylim(-1.2, 1.2)
mpl.legend(loc='upper right')
mpl.grid(color='silver', linestyle='--', linewidth=1)
mpl.subplot(223)
mpl.plot([i/ScFct for i in GfskFreqBB], GfskSpectBB, color='limegreen', linestyle='-', linewidth=1)
mpl.xlabel('Frequency [kHz]')
mpl.ylabel('Power [dBW]')
mpl.title('BASEBAND SPECTRUM')
mpl.xlim(-SpectBBxlim, SpectBBxlim)
mpl.ylim(SpectBBylim, 0)
mpl.grid(color='silver', linestyle='--', linewidth=1)
mpl.subplot(224)
mpl.plot([i/1e6 for i in GfskFreqRF], GfskSpectRF, color='darkviolet', linestyle='-', linewidth=1)
mpl.xlabel('Frequency [MHz]')
mpl.ylabel('Power [dBW]')
mpl.title('BANDPASS SPECTRUM')
mpl.xlim((Fc-SpanRFxlim)/1e6, (Fc+SpanRFxlim)/1e6)
mpl.ylim(SpectRFylim, 0)
mpl.grid(color='silver', linestyle='--', linewidth=1)

Fig_5 = mpl.figure(num='SDR')
mpl.plot([i*ScFct for i in TimeSdr], SdrWaveI, color='red', linestyle='-', linewidth=1, 
    marker='o', markerfacecolor='r', markersize=2, label="In-phase")
mpl.plot([i*ScFct for i in TimeSdr], SdrWaveQ, color='blue', linestyle='--', linewidth=1, 
    marker='o', markerfacecolor='b', markersize=2, label="Quadrature")
mpl.xlabel('Time [ms]') 
mpl.ylabel('Amplitude [V]')
mpl.title('BASEBAND WAVEFORM')
mpl.xlim(0, WaveBBxlim)
mpl.ylim(-1.2, 1.2)
mpl.legend(loc='upper right')
mpl.grid(color='silver', linestyle='--', linewidth=1)

mpl.show(block=False)                                                           # Show plots
mpl.pause(0.001)                                                                # Pause execution for 1 ms
input("\nPress ENTER to exit")                                                  # Ask closing plots on terminal
mpl.close('all')                                                                # Close all plots