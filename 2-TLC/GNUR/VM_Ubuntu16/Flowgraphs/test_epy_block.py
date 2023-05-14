#!/usr/bin/env python2
# -*- coding: utf-8 -*-
##################################################
# GNU Radio Python Flow Graph
# Title: Test Epy Block
# Generated: Sun Mar 20 12:21:53 2022
##################################################

from epy_byte_endianess_flipper import epy_byte_endianess_flipper
from gnuradio import blocks
from gnuradio import eng_notation
from gnuradio import gr
from gnuradio.eng_option import eng_option
from gnuradio.filter import firdes
from optparse import OptionParser


class test_epy_block(gr.top_block):

    def __init__(self):
        gr.top_block.__init__(self, "Test Epy Block")

        ##################################################
        # Variables
        ##################################################
        self.samp_rate = samp_rate = 32000

        ##################################################
        # Blocks
        ##################################################
        self.epy_byte_endianess_flipper = epy_byte_endianess_flipper()
        self.blocks_vector_source_x_0 = blocks.vector_source_b((0x01, 0x02, 0x06), False, 1, [])
        self.blocks_throttle_0 = blocks.throttle(gr.sizeof_char*1, samp_rate,True)
        self.blocks_file_sink_0 = blocks.file_sink(gr.sizeof_char*1, "/home/vkn/Documents/GNUR/Flowgraphs/Logs/byte_endianess_flip.bin", False)
        self.blocks_file_sink_0.set_unbuffered(False)

        ##################################################
        # Connections
        ##################################################
        self.connect((self.blocks_throttle_0, 0), (self.blocks_file_sink_0, 0))    
        self.connect((self.blocks_vector_source_x_0, 0), (self.epy_byte_endianess_flipper, 0))    
        self.connect((self.epy_byte_endianess_flipper, 0), (self.blocks_throttle_0, 0))    

    def get_samp_rate(self):
        return self.samp_rate

    def set_samp_rate(self, samp_rate):
        self.samp_rate = samp_rate
        self.blocks_throttle_0.set_sample_rate(self.samp_rate)


def main(top_block_cls=test_epy_block, options=None):

    tb = top_block_cls()
    tb.start()
    tb.wait()


if __name__ == '__main__':
    main()
