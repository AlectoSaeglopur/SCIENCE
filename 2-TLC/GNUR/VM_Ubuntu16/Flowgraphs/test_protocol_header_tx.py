#!/usr/bin/env python2
# -*- coding: utf-8 -*-
##################################################
# GNU Radio Python Flow Graph
# Title: Test Protocol Header Tx
# Generated: Sat Sep  3 13:31:34 2022
##################################################

from gnuradio import blocks
from gnuradio import eng_notation
from gnuradio import gr
from gnuradio.eng_option import eng_option
from gnuradio.filter import firdes
from optparse import OptionParser
import zVKN


class test_protocol_header_tx(gr.top_block):

    def __init__(self):
        gr.top_block.__init__(self, "Test Protocol Header Tx")

        ##################################################
        # Blocks
        ##################################################
        self.zVKN_prot_header_tx_p_mm_0 = zVKN.prot_header_tx_p_mm(6, 1, ((0xFF,0xFF)), ((0xD3,0x91)), 2)
        self.blocks_socket_pdu_0 = blocks.socket_pdu("TCP_SERVER", "127.0.0.1", "52001", 10000, False)
        self.blocks_message_debug_0 = blocks.message_debug()

        ##################################################
        # Connections
        ##################################################
        self.msg_connect((self.blocks_socket_pdu_0, 'pdus'), (self.zVKN_prot_header_tx_p_mm_0, 'port_in'))    
        self.msg_connect((self.zVKN_prot_header_tx_p_mm_0, 'port_out'), (self.blocks_message_debug_0, 'print_pdu'))    


def main(top_block_cls=test_protocol_header_tx, options=None):

    tb = top_block_cls()
    tb.start()
    tb.wait()


if __name__ == '__main__':
    main()
