#!/usr/bin/env python2
# -*- coding: utf-8 -*-
##################################################
# GNU Radio Python Flow Graph
# Title: Test Flag Appender
# Generated: Thu Mar 17 20:09:03 2022
##################################################

from gnuradio import blocks
from gnuradio import eng_notation
from gnuradio import gr
from gnuradio.eng_option import eng_option
from gnuradio.filter import firdes
from optparse import OptionParser
import zVKN


class test_flag_appender(gr.top_block):

    def __init__(self):
        gr.top_block.__init__(self, "Test Flag Appender")

        ##################################################
        # Variables
        ##################################################
        self.samp_rate = samp_rate = 32000

        ##################################################
        # Blocks
        ##################################################
        self.zVKN_flag_appender_p_mm_0 = zVKN.flag_appender_p_mm(False, ((0xAB,0xCD,0xEF)))
        self.zVKN_flag_appender_c_mm_0 = zVKN.flag_appender_c_mm(True, 0xD391)
        self.blocks_throttle_0 = blocks.throttle(gr.sizeof_char*1, samp_rate,True)
        self.blocks_socket_pdu_0 = blocks.socket_pdu("TCP_SERVER", "127.0.0.1", "52001", 10000, False)
        self.blocks_pdu_to_tagged_stream_0 = blocks.pdu_to_tagged_stream(blocks.byte_t, "packet_len")
        self.blocks_message_debug_0 = blocks.message_debug()
        self.blocks_file_sink_0 = blocks.file_sink(gr.sizeof_char*1, "/home/vkn/Documents/GNUR/Flowgraphs/Logs/flag_appender.bin", False)
        self.blocks_file_sink_0.set_unbuffered(True)

        ##################################################
        # Connections
        ##################################################
        self.msg_connect((self.blocks_socket_pdu_0, 'pdus'), (self.zVKN_flag_appender_c_mm_0, 'port_in'))    
        self.msg_connect((self.zVKN_flag_appender_c_mm_0, 'port_out'), (self.zVKN_flag_appender_p_mm_0, 'port_in'))    
        self.msg_connect((self.zVKN_flag_appender_p_mm_0, 'port_out'), (self.blocks_message_debug_0, 'print_pdu'))    
        self.msg_connect((self.zVKN_flag_appender_p_mm_0, 'port_out'), (self.blocks_pdu_to_tagged_stream_0, 'pdus'))    
        self.connect((self.blocks_pdu_to_tagged_stream_0, 0), (self.blocks_throttle_0, 0))    
        self.connect((self.blocks_throttle_0, 0), (self.blocks_file_sink_0, 0))    

    def get_samp_rate(self):
        return self.samp_rate

    def set_samp_rate(self, samp_rate):
        self.samp_rate = samp_rate
        self.blocks_throttle_0.set_sample_rate(self.samp_rate)


def main(top_block_cls=test_flag_appender, options=None):

    tb = top_block_cls()
    tb.start()
    tb.wait()


if __name__ == '__main__':
    main()
