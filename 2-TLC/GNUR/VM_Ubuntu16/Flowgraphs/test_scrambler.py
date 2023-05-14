#!/usr/bin/env python2
# -*- coding: utf-8 -*-
##################################################
# GNU Radio Python Flow Graph
# Title: Test Scrambler
# Generated: Fri Aug 26 08:53:14 2022
##################################################

from gnuradio import blocks
from gnuradio import eng_notation
from gnuradio import gr
from gnuradio.eng_option import eng_option
from gnuradio.filter import firdes
from optparse import OptionParser
import zVKN


class test_scrambler(gr.top_block):

    def __init__(self):
        gr.top_block.__init__(self, "Test Scrambler")

        ##################################################
        # Blocks
        ##################################################
        self.zVKN_add_scrambler_p_mm_0_0 = zVKN.add_scrambler_p_mm(15, 3, 19072)
        self.zVKN_add_scrambler_p_mm_0 = zVKN.add_scrambler_p_mm(15, 3, 19072)
        self.blocks_socket_pdu_0 = blocks.socket_pdu("TCP_SERVER", "127.0.0.1", "52001", 10000, False)
        self.blocks_message_debug_0_0_0 = blocks.message_debug()
        self.blocks_message_debug_0_0 = blocks.message_debug()
        self.blocks_message_debug_0 = blocks.message_debug()

        ##################################################
        # Connections
        ##################################################
        self.msg_connect((self.blocks_socket_pdu_0, 'pdus'), (self.blocks_message_debug_0, 'print_pdu'))    
        self.msg_connect((self.blocks_socket_pdu_0, 'pdus'), (self.zVKN_add_scrambler_p_mm_0, 'port_in'))    
        self.msg_connect((self.zVKN_add_scrambler_p_mm_0, 'port_out'), (self.blocks_message_debug_0_0, 'print_pdu'))    
        self.msg_connect((self.zVKN_add_scrambler_p_mm_0, 'port_out'), (self.zVKN_add_scrambler_p_mm_0_0, 'port_in'))    
        self.msg_connect((self.zVKN_add_scrambler_p_mm_0_0, 'port_out'), (self.blocks_message_debug_0_0_0, 'print_pdu'))    


def main(top_block_cls=test_scrambler, options=None):

    tb = top_block_cls()
    tb.start()
    tb.wait()


if __name__ == '__main__':
    main()
