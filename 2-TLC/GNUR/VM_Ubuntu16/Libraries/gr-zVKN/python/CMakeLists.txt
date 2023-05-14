# Copyright 2011 Free Software Foundation, Inc.
#
# This file is part of GNU Radio
#
# GNU Radio is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 3, or (at your option)
# any later version.
#
# GNU Radio is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with GNU Radio; see the file COPYING.  If not, write to
# the Free Software Foundation, Inc., 51 Franklin Street,
# Boston, MA 02110-1301, USA.

########################################################################
# Include python install macros
########################################################################
include(GrPython)
if(NOT PYTHONINTERP_FOUND)
    return()
endif()

########################################################################
# Install python sources
########################################################################
GR_PYTHON_INSTALL(
    FILES
    __init__.py
    flag_appender_p_mm.py
    fsk_modulator.py
    gfsk_modulator.py
    agc_p_cc.py
    add_scrambler_p_mm.py
    psk_mapper_p_mm.py
    awgn_p_cc.py
    squelch_agc_p_cc.py
    psk_decoder.py
    srrc_filter_rx_p_cc.py
    prot_header_tx_p_mm.py
    check_rx_pkt_p_mx.py DESTINATION ${GR_PYTHON_DIR}/zVKN
)

########################################################################
# Handle the unit tests
########################################################################
include(GrTest)

set(GR_TEST_TARGET_DEPS gnuradio-zVKN)
set(GR_TEST_PYTHON_DIRS ${CMAKE_BINARY_DIR}/swig)
