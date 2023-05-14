
"""
" Title: DVB-S CHAIN
" Author: Filippo Valmori
" Date: 27/05/2022
" References: [1] Digital Communications - B.Sklar & P.K.Ray
"             [2] DVB standard (EN 300 421, v.1.1.2)
"""

### LIBRARIES ###

from random import randbytes
from numpy.random import randint

from scrambler import AddScramb




### PARAMETERS ###

Len = 100                                                               # info array length [B]

ConVectA = (0,0,0,0,0,0,0,0,0,0,0,0,0,1,1)                              # Connection vector of additive de/scrambler [i.e. (1+)z^-14+z^-15]
InitStA = [1,0,0,1,0,1,0,1,0,0,0,0,0,0,0]					            # Initial state of additive de/scrambler

I = 5                                                                   # number of delay lines for convolutional interleaving
M = 13                                                                  # number of delay cells per block for convolutional interleaving [2]



### PROCESSING ###


TxBy = randint(0,256,Len)                                               # TX info bytes (generated as integer between 0 and 255)
ScrBy = AddScramb(TxBy,ConVectA,InitStA)                                # TX bytes after additive scrabler

RxBy = AddScramb(ScrBy,ConVectA,InitStA)                                # RX info bytes after additive descrambler
Check = (TxBy==RxBy).all()                                              # check initial TX info bytes with final RX ones [all.() returns TRUE if all elements of the two arrays match, FALSE otherwise)

print('\n >> DVB-S CHAIN <<\n')

print(' * TXINF :'," ".join(str(hex(x)[2:].upper()) for x in TxBy),'\n')
print(' * SCRAM :'," ".join(str(hex(x)[2:].upper()) for x in ScrBy),'\n')

print(' * RXINF :'," ".join(str(hex(x)[2:].upper()) for x in RxBy),'\n')
print(' * CHECK :',str(Check))




#SrcBy = randbytes(Len)                  # generated as bytes
#print(SrcBy.hex())