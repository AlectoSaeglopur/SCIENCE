
"""
" Title: INTERLEAVERS (BLOCK & CONVOLUTIONAL)
" Author: Filippo Valmori
" Date: 10/05/2022
" References: [1] Digital Communications - B.Sklar & P.K.Ray
"             [2] DVB standard (EN 300 421, v.1.1.2)
"""

### LIBRARIES ###

from numpy import arange, zeros, nan
from math import floor, isnan



### PARAMETERS ###

Len = 100                                                               # source array length
R = 3                                                                   # number of matrix rows for block interleaving
C = 5                                                                   # number of matrix columns for block interleaving
I = 5                                                                   # number of delay lines for convolutional interleaving
M = 13                                                                  # number of delay cells per block for convolutional interleaving [2]



### FUNCTIONS ###

"""
 " Function for implementing a block interleaver where the matrix is filled
 " column-wise and then emptied row-wise. It requires as input the data vector 
 " and the number of rows (R) and columns (C) of the matrix. If the length of
 " the input vector is bigger than R*C, the algorithm is executed in multiple
 " cycles filling and emptying the matrix completely each time.
"""
def Blk_Intrlv( InData, R, C ) :
    OvLen = len(InData)                                                 # overall I/O buffers length
    OutData = zeros(OvLen,dtype=InData.dtype)
    Ncyc = floor((OvLen-1)/(R*C))+1                                     # number of cycles needed to process the input array
    for k in range(Ncyc) :
        j = 0
        CurRow = 0
        if k == Ncyc-1 :
            CycLen = OvLen-k*R*C                                        # number of input elements to be processed during last cycle
        else :
            CycLen = R*C
        for i in range(CycLen) :
            OutData[i+k*R*C] = InData[j+k*R*C]
            j += R
            if j >= CycLen :
                CurRow += 1
                j = CurRow
    return OutData


"""
 " Function for implementing a block deinterleaver where the matrix is filled
 " row-wise and then emptied column-wise. It requires as input the data vector 
 " and the number of rows (R) and columns (C) of the matrix. [NB: If the length
 " of the input vector is bigger than R*C, the algorithm is executed in multiple
 " cycles filling and emptying the matrix completely each time.]
"""
def Blk_Deintrlv( InData, R, C ) :
    OvLen = len(InData)                                                 # overall I/O buffers length
    OutData = zeros(OvLen,dtype=InData.dtype)
    Ncyc = floor((OvLen-1)/(R*C))+1                                     # number of cycles needed to process the input array
    X = Ncyc*R*C-OvLen                                                  # number of missing elements to completely fill the matrix in final cycle
    Skip = zeros(R,dtype=int)                                           # number of elements to be skipped for each row
    CurRow = R-1
    for k in range(X) :
        Skip[CurRow] += 1
        if CurRow == 0 :
            CurRow = R-1
        else :
            CurRow -= 1
    for k in range(Ncyc) :
        j = 0
        CurRow = 0
        CurCol = 0
        if k == Ncyc-1 :
            CycLen = OvLen-k*R*C                                        # number of input elements to be processed during last cycle
        else :
            CycLen = R*C
        for i in range(CycLen) :
            OutData[i+k*R*C] = InData[j+k*R*C]
            j += C
            if k == Ncyc-1 :
                 j -= Skip[CurRow]                                      # update counter in case of missing elements during final cycle
                 CurRow += 1
            if j >= CycLen :
                CurCol +=1
                j = CurCol
                CurRow = 0
    return OutData


"""
 " Function for implementing a convolutional interleaver. It requires as input
 " the data vector and the number of delay lines (I) and the number of delay
 " cells per block (M). 
"""
def Cnv_Intrlv( InData, I, M ) :
    Len = len(InData)                                                   # overall I/O buffers length
    OutData = zeros(Len,dtype=InData.dtype)
    ShReg = zeros((I-1,M*(I-1)))                                        # shift register matrix
    ShReg[:] = nan                                                      # initialize shift-registers matrix with Nan-elements (Nan means the cell is empty)
    InIdx = 0                                                           # index over input array
    OutIdx = 0                                                          # index over output array
    RwIdx = -1                                                          # row index ("-1" represents the line with no delay)
    while InIdx < Len :                                                 # loop until all input elements are consumed...
        if RwIdx == -1 :
            OutData[OutIdx] = InData[InIdx]                             # output from no-delay line
            OutIdx += 1
        else :
            if not(isnan(ShReg[RwIdx,M*(RwIdx+1)-1])) :
                OutData[OutIdx] = ShReg[RwIdx,M*(RwIdx+1)-1]            # output from shift-registers
                OutIdx += 1
            for j in range(M*(RwIdx+1)-1,0,-1) :
                ShReg[RwIdx,j] = ShReg[RwIdx,j-1]                       # update shift-registers (by right-shifting)
            ShReg[RwIdx,0] = InData[InIdx]
        InIdx += 1
        if RwIdx == I-2 :
            RwIdx = -1
        else :
            RwIdx += 1
        # print(OutData)
        # print(ShReg)
        # print("----")
    if RwIdx == -1 :
        RwIdx = 0
    while OutIdx < Len :                                                # loop until all elements still stored in the shift-register has been completely consumed...
        if not(isnan(ShReg[RwIdx,M*(RwIdx+1)-1])) :
            OutData[OutIdx] = ShReg[RwIdx,M*(RwIdx+1)-1]
            OutIdx += 1
        for j in range(M*(RwIdx+1)-1,0,-1) :
            ShReg[RwIdx,j] = ShReg[RwIdx,j-1]
        ShReg[RwIdx,0] = nan
        if RwIdx == I-2 :
            RwIdx = 0
        else :
            RwIdx += 1
        # print(OutData)
        # print(ShReg)
        # print("----")
    return OutData


"""
 " Function for implementing a convolutional deinterleaver. It requires as input
 " the data vector and the number of delay lines (I) and the number of delay
 " cells per block (M). 
"""
def Cnv_Deintrlv( InData, I, M ) :
    Len = len(InData)                                                   # overall I/O buffers length
    OutData = zeros(Len,dtype=InData.dtype)
    ShReg = zeros((I-1,M*(I-1)))                                        # shift register matrix
    ShReg[:] = nan                                                      # initialize shift-registers matrix with Nan-elements (Nan means the cell is empty)
    InIdx = 0                                                           # index over input array
    OutIdx = 0                                                          # index over output array
    RwIdx = 0                                                           # row index
    ClIdx = 0                                                           # column index
    while OutIdx < Len :
        if RwIdx == I-1 and RwIdx+I*(ClIdx-M*RwIdx) < Len :
            OutData[OutIdx] = InData[InIdx]                             # output from no-delay line
            OutIdx += 1
            InIdx += 1
        else :
            if not(isnan(ShReg[RwIdx,M*(I-RwIdx-1)-1])) :
                OutData[OutIdx] = ShReg[RwIdx,M*(I-RwIdx-1)-1]          # output from shift registers
                OutIdx += 1
            for j in range(M*(I-RwIdx-1)-1,0,-1) :
                ShReg[RwIdx,j] = ShReg[RwIdx,j-1]                       # update shift-registers (by right-shifting)
            if RwIdx+I*(ClIdx-M*RwIdx) < Len :
                ShReg[RwIdx,0] = InData[InIdx]
                InIdx += 1
            else :
                ShReg[RwIdx,0] = nan
        if ClIdx < M*(I-1) :                                            # case for 1st phase (initial transient)
            if RwIdx == (ClIdx//M) :                                    # "//" executes  the operation of integer division
                RwIdx = 0
                ClIdx += 1
            else :
                RwIdx += 1
        else :                                                          # case for 2nd phase (shift-registers filled)
            if RwIdx == I-1 :
                RwIdx = 0
                ClIdx += 1
            else :
                RwIdx += 1
        # print(OutData)
        # print(ShReg)
        # print('---')
    return OutData



### PROCESSING ###

SrcData = arange(1,Len+1,1)                                             # generate increasing source array [NB: starting value (included), final value (excluded), step]

BiData = Blk_Intrlv(SrcData,R,C)                                        # apply block interleaver
BdData = Blk_Deintrlv(BiData,R,C)                                       # apply block deinterleaver
CheckBlk = (SrcData==BdData).all()                                      # check block interleaving outcome [all.() returns TRUE if all elements of the two arrays match, FALSE otherwise)
print("\n >> BLOCK INTERLEAVING <<\n")
print(" * SRC :\n ", str(SrcData),'\n')
print(" * ITR : ", str(BiData),'\n')
print(" * DIT : ", str(BdData),'\n')
print(' * CHK = ',str(CheckBlk),'\n')

CiData = Cnv_Intrlv(SrcData,I,M)                                        # apply convolutional interleaver
CdData = Cnv_Deintrlv(CiData,I,M)                                       # apply convolutional deinterleaver
CheckCnv = (SrcData==CdData).all()                                      # check block interleaving outcome
print("\n >> CONVOLUTIONAL INTERLEAVING <<\n")
print(" * SRC :\n", str(SrcData),'\n')
print(" * ITR :\n", str(CiData),'\n')
print(" * DIT :\n", str(CdData),'\n')
print(' * CHK = ',str(CheckCnv))
