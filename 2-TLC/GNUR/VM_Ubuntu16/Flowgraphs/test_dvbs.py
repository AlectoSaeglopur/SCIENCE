#!/usr/bin/env python2
# -*- coding: utf-8 -*-
##################################################
# GNU Radio Python Flow Graph
# Title: Test Dvbs
# Generated: Thu Sep  8 08:52:55 2022
##################################################

if __name__ == '__main__':
    import ctypes
    import sys
    if sys.platform.startswith('linux'):
        try:
            x11 = ctypes.cdll.LoadLibrary('libX11.so')
            x11.XInitThreads()
        except:
            print "Warning: failed to XInitThreads()"

from PyQt4 import Qt
from gnuradio import blocks
from gnuradio import eng_notation
from gnuradio import gr
from gnuradio import qtgui
from gnuradio.eng_option import eng_option
from gnuradio.filter import firdes
from numpy import log2, sqrt
from optparse import OptionParser
import sip
import sys
import zVKN


class test_dvbs(gr.top_block, Qt.QWidget):

    def __init__(self):
        gr.top_block.__init__(self, "Test Dvbs")
        Qt.QWidget.__init__(self)
        self.setWindowTitle("Test Dvbs")
        try:
            self.setWindowIcon(Qt.QIcon.fromTheme('gnuradio-grc'))
        except:
            pass
        self.top_scroll_layout = Qt.QVBoxLayout()
        self.setLayout(self.top_scroll_layout)
        self.top_scroll = Qt.QScrollArea()
        self.top_scroll.setFrameStyle(Qt.QFrame.NoFrame)
        self.top_scroll_layout.addWidget(self.top_scroll)
        self.top_scroll.setWidgetResizable(True)
        self.top_widget = Qt.QWidget()
        self.top_scroll.setWidget(self.top_widget)
        self.top_layout = Qt.QVBoxLayout(self.top_widget)
        self.top_grid_layout = Qt.QGridLayout()
        self.top_layout.addLayout(self.top_grid_layout)

        self.settings = Qt.QSettings("GNU Radio", "test_dvbs")
        self.restoreGeometry(self.settings.value("geometry").toByteArray())

        ##################################################
        # Variables
        ##################################################
        self.Rb = Rb = 12000
        self.M = M = 4
        self.osf = osf = 8
        self.Rs = Rs = Rb/log2(M)
        self.span = span = 8
        self.beta = beta = 0.5
        self.SyncWord = SyncWord = (0xD3,0x91,0xFF)
        self.SwCorTol = SwCorTol = 10
        self.PhOfs = PhOfs = 180.0/M
        self.LenSz = LenSz = 3
        self.Fs = Fs = osf*Rs
        self.ChDly = ChDly = 13
        self.AgcLev = AgcLev = 1

        ##################################################
        # Blocks
        ##################################################
        self.zVKN_srrc_filter_tx_c_cc_0 = zVKN.srrc_filter_tx_c_cc(osf, span, beta)
        self.zVKN_srrc_filter_rx_c_cc_1 = zVKN.srrc_filter_rx_c_cc(osf, span, beta)
        self.zVKN_squelch_agc_p_cc_0 = zVKN.squelch_agc_p_cc(16*osf, True, 1e-3, False, 0, 0, (AgcLev**2)*(1+1j)/2, 0, 0, 0.75, AgcLev*1.5)
        self.zVKN_psk_mapper_p_mm_0 = zVKN.psk_mapper_p_mm(M, PhOfs, True)
        self.zVKN_psk_decoder_0 = zVKN.psk_decoder(M, PhOfs, True, (SyncWord), SwCorTol, 1, LenSz, beta, span, osf)
        self.zVKN_prot_header_tx_p_mm_0 = zVKN.prot_header_tx_p_mm(9, LenSz, ((0xFF,0xFF)), (SyncWord), M)
        self.zVKN_check_rx_pkt_p_mx_0 = zVKN.check_rx_pkt_p_mx()
        self.zVKN_awgn_p_cc_0 = zVKN.awgn_p_cc(-7, -40, ChDly)
        self.qtgui_time_sink_x_0 = qtgui.time_sink_c(
        	1024, #size
        	Fs, #samp_rate
        	"TIME", #name
        	4 #number of inputs
        )
        self.qtgui_time_sink_x_0.set_update_time(0.10)
        self.qtgui_time_sink_x_0.set_y_axis(-2, 2)
        
        self.qtgui_time_sink_x_0.set_y_label("Amplitude", "")
        
        self.qtgui_time_sink_x_0.enable_tags(-1, True)
        self.qtgui_time_sink_x_0.set_trigger_mode(qtgui.TRIG_MODE_NORM, qtgui.TRIG_SLOPE_POS, 0.1, 2e-3, 1, "")
        self.qtgui_time_sink_x_0.enable_autoscale(False)
        self.qtgui_time_sink_x_0.enable_grid(True)
        self.qtgui_time_sink_x_0.enable_control_panel(True)
        
        if not True:
          self.qtgui_time_sink_x_0.disable_legend()
        
        labels = ["TX (I)", "TX (Q)", "CHAN (I)", "CHAN (Q)", "SRRC (I)",
                  "SRRC (Q)", "AGC (I)", "AGC (Q)", "", ""]
        widths = [1, 1, 1, 1, 1,
                  1, 1, 1, 1, 1]
        colors = ["blue", "blue", "green", "green", "cyan",
                  "cyan", "red", "red", "dark green", "blue"]
        styles = [1, 2, 1, 2, 1,
                  2, 1, 2, 1, 1]
        markers = [0, 8, 0, 8, 0,
                   8, 0, 8, -1, -1]
        alphas = [1.0, 1.0, 1.0, 1.0, 1.0,
                  1.0, 1.0, 1.0, 1.0, 1.0]
        
        for i in xrange(2*4):
            if len(labels[i]) == 0:
                if(i % 2 == 0):
                    self.qtgui_time_sink_x_0.set_line_label(i, "Re{{Data {0}}}".format(i/2))
                else:
                    self.qtgui_time_sink_x_0.set_line_label(i, "Im{{Data {0}}}".format(i/2))
            else:
                self.qtgui_time_sink_x_0.set_line_label(i, labels[i])
            self.qtgui_time_sink_x_0.set_line_width(i, widths[i])
            self.qtgui_time_sink_x_0.set_line_color(i, colors[i])
            self.qtgui_time_sink_x_0.set_line_style(i, styles[i])
            self.qtgui_time_sink_x_0.set_line_marker(i, markers[i])
            self.qtgui_time_sink_x_0.set_line_alpha(i, alphas[i])
        
        self._qtgui_time_sink_x_0_win = sip.wrapinstance(self.qtgui_time_sink_x_0.pyqwidget(), Qt.QWidget)
        self.top_layout.addWidget(self._qtgui_time_sink_x_0_win)
        self.blocks_throttle_0 = blocks.throttle(gr.sizeof_gr_complex*1, Fs,True)
        self.blocks_socket_pdu_0 = blocks.socket_pdu("TCP_SERVER", "127.0.0.1", "52001", 10000, False)
        self.blocks_skiphead_0_0 = blocks.skiphead(gr.sizeof_gr_complex*1, span*osf/2)
        self.blocks_skiphead_0 = blocks.skiphead(gr.sizeof_gr_complex*1, span*osf/2)
        self.blocks_pdu_to_tagged_stream_0 = blocks.pdu_to_tagged_stream(blocks.complex_t, "packet_len")
        self.blocks_delay_0 = blocks.delay(gr.sizeof_gr_complex*1, ChDly)

        ##################################################
        # Connections
        ##################################################
        self.msg_connect((self.blocks_socket_pdu_0, 'pdus'), (self.zVKN_prot_header_tx_p_mm_0, 'port_in'))    
        self.msg_connect((self.zVKN_prot_header_tx_p_mm_0, 'port_out'), (self.zVKN_psk_mapper_p_mm_0, 'port_in'))    
        self.msg_connect((self.zVKN_psk_decoder_0, 'port_out'), (self.zVKN_check_rx_pkt_p_mx_0, 'port_in'))    
        self.msg_connect((self.zVKN_psk_mapper_p_mm_0, 'port_out'), (self.blocks_pdu_to_tagged_stream_0, 'pdus'))    
        self.connect((self.blocks_delay_0, 0), (self.qtgui_time_sink_x_0, 0))    
        self.connect((self.blocks_pdu_to_tagged_stream_0, 0), (self.zVKN_srrc_filter_tx_c_cc_0, 0))    
        self.connect((self.blocks_skiphead_0, 0), (self.qtgui_time_sink_x_0, 2))    
        self.connect((self.blocks_skiphead_0_0, 0), (self.qtgui_time_sink_x_0, 3))    
        self.connect((self.blocks_throttle_0, 0), (self.zVKN_awgn_p_cc_0, 0))    
        self.connect((self.zVKN_awgn_p_cc_0, 0), (self.qtgui_time_sink_x_0, 1))    
        self.connect((self.zVKN_awgn_p_cc_0, 0), (self.zVKN_srrc_filter_rx_c_cc_1, 0))    
        self.connect((self.zVKN_squelch_agc_p_cc_0, 0), (self.blocks_skiphead_0_0, 0))    
        self.connect((self.zVKN_squelch_agc_p_cc_0, 0), (self.zVKN_psk_decoder_0, 0))    
        self.connect((self.zVKN_srrc_filter_rx_c_cc_1, 0), (self.blocks_skiphead_0, 0))    
        self.connect((self.zVKN_srrc_filter_rx_c_cc_1, 0), (self.zVKN_squelch_agc_p_cc_0, 0))    
        self.connect((self.zVKN_srrc_filter_tx_c_cc_0, 0), (self.blocks_delay_0, 0))    
        self.connect((self.zVKN_srrc_filter_tx_c_cc_0, 0), (self.blocks_throttle_0, 0))    

    def closeEvent(self, event):
        self.settings = Qt.QSettings("GNU Radio", "test_dvbs")
        self.settings.setValue("geometry", self.saveGeometry())
        event.accept()


    def get_Rb(self):
        return self.Rb

    def set_Rb(self, Rb):
        self.Rb = Rb
        self.set_Rs(self.Rb/log2(self.M))

    def get_M(self):
        return self.M

    def set_M(self, M):
        self.M = M
        self.set_PhOfs(180.0/self.M)
        self.set_Rs(self.Rb/log2(self.M))

    def get_osf(self):
        return self.osf

    def set_osf(self, osf):
        self.osf = osf
        self.set_Fs(self.osf*self.Rs)

    def get_Rs(self):
        return self.Rs

    def set_Rs(self, Rs):
        self.Rs = Rs
        self.set_Fs(self.osf*self.Rs)

    def get_span(self):
        return self.span

    def set_span(self, span):
        self.span = span

    def get_beta(self):
        return self.beta

    def set_beta(self, beta):
        self.beta = beta

    def get_SyncWord(self):
        return self.SyncWord

    def set_SyncWord(self, SyncWord):
        self.SyncWord = SyncWord

    def get_SwCorTol(self):
        return self.SwCorTol

    def set_SwCorTol(self, SwCorTol):
        self.SwCorTol = SwCorTol

    def get_PhOfs(self):
        return self.PhOfs

    def set_PhOfs(self, PhOfs):
        self.PhOfs = PhOfs

    def get_LenSz(self):
        return self.LenSz

    def set_LenSz(self, LenSz):
        self.LenSz = LenSz

    def get_Fs(self):
        return self.Fs

    def set_Fs(self, Fs):
        self.Fs = Fs
        self.blocks_throttle_0.set_sample_rate(self.Fs)
        self.qtgui_time_sink_x_0.set_samp_rate(self.Fs)

    def get_ChDly(self):
        return self.ChDly

    def set_ChDly(self, ChDly):
        self.ChDly = ChDly
        self.blocks_delay_0.set_dly(self.ChDly)

    def get_AgcLev(self):
        return self.AgcLev

    def set_AgcLev(self, AgcLev):
        self.AgcLev = AgcLev


def main(top_block_cls=test_dvbs, options=None):

    from distutils.version import StrictVersion
    if StrictVersion(Qt.qVersion()) >= StrictVersion("4.5.0"):
        style = gr.prefs().get_string('qtgui', 'style', 'raster')
        Qt.QApplication.setGraphicsSystem(style)
    qapp = Qt.QApplication(sys.argv)

    tb = top_block_cls()
    tb.start()
    tb.show()

    def quitting():
        tb.stop()
        tb.wait()
    qapp.connect(qapp, Qt.SIGNAL("aboutToQuit()"), quitting)
    qapp.exec_()


if __name__ == '__main__':
    main()
