"""
" Title: FREQUENCY HOPPING
" Author: Filippo Valmori
" Date: 11/08/2022
" Reference: [1] Digital Communications - B.Sklar & P.K.Ray (Ch.12)
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
Rb = 10e3                                               # Bit rate [b/s]
Fc = 1e6                                                # Carrier frequency [Hz]
M = 4                                                   # Modulation order
dev = 5e3                                               # Inner frequency deviation [Hz]
osf = 64                                                # FSK original oversampling factor [Sa/S]
Xc = 3                                                  # Chip factor [C/S]
FhMax = 100e3                                           # Maximum frequency hopping value (absolute, i.e. +/-) [Hz]
FhStep = 2*dev                                          # Frequency hopping step [Hz] (NB: use multiples of "dev" to avoid wrong signal discontinuities!)



### CONSTANTS ###

FhLev = 2*FhMax/FhStep                                  # Overall number of frequency hopping levels
Rs = Rb/log2(M)                                         # Symbol rate [S/s]
h = 2*(M-1)*dev/Rs                                      # Modulation index [NB: (M-1)*dev represents the outer deviation]
osfc = Xc*osf                                           # FSK/FH-FSK actual oversampling factor [Sa/S]
Fs = osfc*Rs                                            # Baseband sample rate [Sa/s]
Ts = 1/Fs                                               # Baseband sample period [s]
Rc = Xc*Rs                                              # Chip rate [C/s]

ScFct = 1e3                                             # Baseband scaling factor (e.g. 1e3 means ms/kHz)
Wavexlim = 1e-3*ScFct                                   # Limit on X-axis for BB time plot [ms]
Spectxlim = Fs/2e3                                      # Limit on X-axis for BB spectrum plot [kHz]
Spectylim = -120                                        # Limit on Y-axis for BB spectrum plot [dBW]
SpanRFxlim = 10*Rs                                      # Span on X-axis for RF spectrum plot [Hz]
SpectRFylim = -110                                      # Limit on Y-axis for RF spectrum plot [dBW]



### FUNCTIONS ###

"""
" Function for checking the input parameters correctness.
"""
def CheckParam( M, Nbits, osf, Xc ) :
    if log2(M) != round(log2(M)) :
        raise Exception('Invalid modulation order')
    elif Nbits % log2(M) != 0 :
        raise Exception('Invalid number of bits')
    elif osf < 2 or osf != round(osf) :
        raise Exception('Invalid oversampling factor')
    elif Xc < 2 or Xc != round(Xc) :
        raise Exception('Invalid chip factor')


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
    Ns = len(Sgn)                                                               # Length (in samples) of the input waveform
    dF = Fs/Ns                                                                  # Discretization step for frequency axis
    CpxSpect = [i/Ns for i in fftshift(fft(Sgn))]                               # Complex spectrum
    PwrSpect = zeros(len(CpxSpect),dtype=float)
    for j in range(len(CpxSpect)) :
        if abs(CpxSpect[j]) == 0 :
            CpxSpect[j] = 1e-20
        PwrSpect[j] = 20*(log10(abs(CpxSpect[j]))).real                         # Power spectrum (in dBW)
    FreqAx = [(-Fs/2+i*dF) for i in range(len(CpxSpect))]                       # Frequency axis for spectrum plot
    # OvPwrF = 10*log10(sum([(abs(CpxSpect[j]))**2 for j in range(len(CpxSpect))]))   # Overall signal power estimated in frequency [dBW] (NB: do NOT multiply by dF, that's wrong for this descrete representation!)
    # SumT = 0                                                                        
    # for i in range(len(Sgn)) :
    #     SumT += abs(Sgn[i])**2                                                # use RMS formula to estimate Vrms (simplified since P = Vrms^2/R, with unitary-R assumed)
    # OvPwrT = (10*log10(SumT/len(Sgn))).real
    # print('>> OvPwrT = '+str(round(OvPwrT,2))+' dBW')                         # Overall power estimated in time [dBW] (NB: shall match "OvPwrF")
    return FreqAx, PwrSpect



### 1. PROCESSING WITH/WITHOUT FH (BASEBAND ONLY) ###

CheckParam(M,Nbits,osf,Xc)                                                      # Check the parameters correctness
[Symbs,Nsymbs] = GetSymbs(Nbits,M)                                              # Retrieve random symbols stream and its length
FskSamps = [i*dev for i in list(repeat(Symbs,osfc))]                            # Multiply symbols for inner deviation and oversample
TimeFsk = [i*Ts for i in range(Nsymbs*osfc)]                                    # Time axis for FSK waveform
FskWaveI = cos([i*2*pi for i in multiply(FskSamps,TimeFsk)])                    # In-phase part of the FSK baseband waveform
FskWaveQ = sin([i*2*pi for i in multiply(FskSamps,TimeFsk)])                    # Quadrature part of the FSK baseband waveform
FskSgn = FskWaveI+1j*FskWaveQ                                                   # FSK complex baseband signal
[FskFreq,FskSpect] = GetSpect(FskSgn,Fs)                                        # FSK baseband signal power spectrum 

FhSeq = [randint(-int(FhLev/2),int(FhLev/2)) for j in range(Nsymbs*Xc)]         # Generate pseudo-random FH sequence
FhChips = [i*dev for i in list(repeat(Symbs,Xc))]+multiply(FhSeq,FhStep)        # Multiply symbols for inner deviation and apply Fast Frequency Hopping (FFH)
FhFskSamps = [i for i in list(repeat(FhChips,osf))]                             # Chip-to-sample oversampling
TimeFhFsk = [i*Ts for i in range(len(FhFskSamps))]                              # Time axis for FH-FSK waveform
FhFskWaveI = cos([i*2*pi for i in multiply(FhFskSamps,TimeFhFsk)])              # In-phase part of the FH-FSK baseband waveform
FhFskWaveQ = sin([i*2*pi for i in multiply(FhFskSamps,TimeFhFsk)])              # Quadrature part of the FH-FSK baseband waveform
FhFskSgn = FhFskWaveI+1j*FhFskWaveQ                                             # FH-FSK complex baseband signal
[FhFskFreq,FhFskSpect] = GetSpect(FhFskSgn,Fs)                                  # FH-FSK baseband signal power spectrum 



# MESSAGES

print('\n * Rb =',round(Rb/1e3,1),'kb/s')
print(' * M =',M)
print(' * Rs =',round(Rs/1e3,1),'kS/s')
print(' * h =',round(h,1))
print(' * dev =',round(dev/1e3,1),'kHz')
print(' * Fs =',round(Fs/1e3,1),' kSa/s')
print(' * BW (FSK) = +/-',round(2*(Rs+dev*(M-1))/2/1e3,1),'kHz')                # Estimate FSK banwidth through Carson's rule
print(' * BW (FFH-FSK) = +/-',round((2*(Rc+dev*(M-1))+2*FhMax)/2/1e3,1),'kHz')  # This value matches with 4th subplot bandwidth between the first two notches



### PLOTS ###

Fig_1 = mpl.figure(num='BASEBAND FSK VS FFH-FSK')
Fig_1.subplots_adjust(wspace=.25, hspace=.4)
mpl.subplot(221)
mpl.plot([i*ScFct for i in TimeFsk], FskWaveI, color='red', linestyle='-', linewidth=1, 
    marker='o', markerfacecolor='r', markersize=2, label="In-phase")
mpl.plot([i*ScFct for i in TimeFsk], FskWaveQ, color='blue', linestyle='--', linewidth=1, 
    marker='o', markerfacecolor='b', markersize=2, label="Quadrature")
mpl.xlabel('Time [ms]') 
mpl.ylabel('Amplitude [V]')
mpl.title('FSK WAVEFORM')
mpl.xlim(0, Wavexlim)
mpl.ylim(-1.2, 1.2)
mpl.legend(loc='upper right')
mpl.grid(color='silver', linestyle='--', linewidth=1)
mpl.subplot(222)
mpl.plot([i/ScFct for i in FskFreq], FskSpect, color='limegreen', linestyle='-', linewidth=1)
mpl.xlabel('Frequency [kHz]')
mpl.ylabel('Power [dBW]')
mpl.title('FSK SPECTRUM')
mpl.xlim(-Spectxlim, Spectxlim)
mpl.ylim(Spectylim, 0)
mpl.grid(color='silver', linestyle='--', linewidth=1)

mpl.subplot(223)
mpl.plot([i*ScFct for i in TimeFhFsk], FhFskWaveI, color='red', linestyle='-', linewidth=1, 
    marker='o', markerfacecolor='r', markersize=2, label="In-phase")
mpl.plot([i*ScFct for i in TimeFhFsk], FhFskWaveQ, color='blue', linestyle='--', linewidth=1, 
    marker='o', markerfacecolor='b', markersize=2, label="Quadrature")
mpl.xlabel('Time [ms]') 
mpl.ylabel('Amplitude [V]')
mpl.title('FH-FSK WAVEFORM')
mpl.xlim(0, Wavexlim)
mpl.ylim(-1.2, 1.2)
mpl.legend(loc='upper right')
mpl.grid(color='silver', linestyle='--', linewidth=1)
mpl.subplot(224)
mpl.plot([i/ScFct for i in FhFskFreq], FhFskSpect, color='limegreen', linestyle='-', linewidth=1)
mpl.xlabel('Frequency [kHz]')
mpl.ylabel('Power [dBW]')
mpl.title('FH-FSK SPECTRUM')
mpl.xlim(-Spectxlim, Spectxlim)
mpl.ylim(Spectylim, 0)
mpl.grid(color='silver', linestyle='--', linewidth=1)

mpl.show(block=False)                                                           # Show plots
mpl.pause(0.001)                                                                # Pause execution for 1 ms
input("\nPress ENTER to exit")                                                  # Ask closing plots on terminal
mpl.close('all')                                                                # Close all plots