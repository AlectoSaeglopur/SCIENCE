# Install script for directory: /home/vkn/Documents/GNUR/Libraries/gr-zVKN/python

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages/zVKN" TYPE FILE FILES
    "/home/vkn/Documents/GNUR/Libraries/gr-zVKN/python/__init__.py"
    "/home/vkn/Documents/GNUR/Libraries/gr-zVKN/python/flag_appender_p_mm.py"
    "/home/vkn/Documents/GNUR/Libraries/gr-zVKN/python/fsk_modulator.py"
    "/home/vkn/Documents/GNUR/Libraries/gr-zVKN/python/gfsk_modulator.py"
    "/home/vkn/Documents/GNUR/Libraries/gr-zVKN/python/agc_p_cc.py"
    "/home/vkn/Documents/GNUR/Libraries/gr-zVKN/python/add_scrambler_p_mm.py"
    "/home/vkn/Documents/GNUR/Libraries/gr-zVKN/python/psk_mapper_p_mm.py"
    "/home/vkn/Documents/GNUR/Libraries/gr-zVKN/python/awgn_p_cc.py"
    "/home/vkn/Documents/GNUR/Libraries/gr-zVKN/python/squelch_agc_p_cc.py"
    "/home/vkn/Documents/GNUR/Libraries/gr-zVKN/python/psk_decoder.py"
    "/home/vkn/Documents/GNUR/Libraries/gr-zVKN/python/srrc_filter_rx_p_cc.py"
    "/home/vkn/Documents/GNUR/Libraries/gr-zVKN/python/prot_header_tx_p_mm.py"
    "/home/vkn/Documents/GNUR/Libraries/gr-zVKN/python/check_rx_pkt_p_mx.py"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages/zVKN" TYPE FILE FILES
    "/home/vkn/Documents/GNUR/Libraries/gr-zVKN/build/python/__init__.pyc"
    "/home/vkn/Documents/GNUR/Libraries/gr-zVKN/build/python/flag_appender_p_mm.pyc"
    "/home/vkn/Documents/GNUR/Libraries/gr-zVKN/build/python/fsk_modulator.pyc"
    "/home/vkn/Documents/GNUR/Libraries/gr-zVKN/build/python/gfsk_modulator.pyc"
    "/home/vkn/Documents/GNUR/Libraries/gr-zVKN/build/python/agc_p_cc.pyc"
    "/home/vkn/Documents/GNUR/Libraries/gr-zVKN/build/python/add_scrambler_p_mm.pyc"
    "/home/vkn/Documents/GNUR/Libraries/gr-zVKN/build/python/psk_mapper_p_mm.pyc"
    "/home/vkn/Documents/GNUR/Libraries/gr-zVKN/build/python/awgn_p_cc.pyc"
    "/home/vkn/Documents/GNUR/Libraries/gr-zVKN/build/python/squelch_agc_p_cc.pyc"
    "/home/vkn/Documents/GNUR/Libraries/gr-zVKN/build/python/psk_decoder.pyc"
    "/home/vkn/Documents/GNUR/Libraries/gr-zVKN/build/python/srrc_filter_rx_p_cc.pyc"
    "/home/vkn/Documents/GNUR/Libraries/gr-zVKN/build/python/prot_header_tx_p_mm.pyc"
    "/home/vkn/Documents/GNUR/Libraries/gr-zVKN/build/python/check_rx_pkt_p_mx.pyc"
    "/home/vkn/Documents/GNUR/Libraries/gr-zVKN/build/python/__init__.pyo"
    "/home/vkn/Documents/GNUR/Libraries/gr-zVKN/build/python/flag_appender_p_mm.pyo"
    "/home/vkn/Documents/GNUR/Libraries/gr-zVKN/build/python/fsk_modulator.pyo"
    "/home/vkn/Documents/GNUR/Libraries/gr-zVKN/build/python/gfsk_modulator.pyo"
    "/home/vkn/Documents/GNUR/Libraries/gr-zVKN/build/python/agc_p_cc.pyo"
    "/home/vkn/Documents/GNUR/Libraries/gr-zVKN/build/python/add_scrambler_p_mm.pyo"
    "/home/vkn/Documents/GNUR/Libraries/gr-zVKN/build/python/psk_mapper_p_mm.pyo"
    "/home/vkn/Documents/GNUR/Libraries/gr-zVKN/build/python/awgn_p_cc.pyo"
    "/home/vkn/Documents/GNUR/Libraries/gr-zVKN/build/python/squelch_agc_p_cc.pyo"
    "/home/vkn/Documents/GNUR/Libraries/gr-zVKN/build/python/psk_decoder.pyo"
    "/home/vkn/Documents/GNUR/Libraries/gr-zVKN/build/python/srrc_filter_rx_p_cc.pyo"
    "/home/vkn/Documents/GNUR/Libraries/gr-zVKN/build/python/prot_header_tx_p_mm.pyo"
    "/home/vkn/Documents/GNUR/Libraries/gr-zVKN/build/python/check_rx_pkt_p_mx.pyo"
    )
endif()

