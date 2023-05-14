"""
Embedded Python Blocks (aka EPY):

Each this file is saved, GRC will instantiate the first class it finds to get
ports and parameters of your block. The arguments to __init__  will be the
parameters. All of them are required to have default values!
"""
import numpy as np
from gnuradio import gr

class epy_byte_endianess_flipper(gr.sync_block):    # rename class here! (NB: remember this class name shall match with the EPY block ID in the .grc flowgraph)
    #def __init__(self, arg1=1.0):                  # declararion in case of block input parameter as well (here set to 1.0 by default)
    def __init__(self):
        gr.sync_block.__init__(
            self,
            name='Byte Endianess Flipper',          # rename block here!
            in_sig=[np.uint8],                      # define input type (e.g. uint8, complex64, etc.)
            out_sig=[np.uint8]                      # define output type (e.g. uint8, complex64, etc.)
        )
        #self.arg1 = arg1                           # store input parameter into class global variable
        #self.var1 = 0                              # initialize additional class global variable (to be used over work cycles, for example)


    def work(self, input_items, output_items):
        in_vect = input_items[0]                    # input items vector ("input_items[0]" by GNUR default)
        out_vect = output_items[0]                  # output items vector ("output_items[0]" by GNUR default)
        for i, X in enumerate(in_vect) :            # "i" represents the index over the input items buffer, "X" the i-th input items (see Python built-in "enumerate" function)
            OutByte = 0                             # new flipped output byte value
            for j in range(8) :                     # "j" represents the bit index over each single input byte
                RdBit = (X>>(7-j)) & 0x01           # read j-th bit from i-th input item/byte
                OutByte |= (RdBit<<j)               # sum bit value after position change
            out_vect[i] = OutByte                   # write flipped byte into output buffer
        return len(out_vect)                        # return the number of output items/bytes to produce

        
"""
 NOTE#1 : The "consume" function is implicit in these EPY blocks, meaning there's always a 1:1 relation between input and output items.
"""