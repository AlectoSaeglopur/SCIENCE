# Install script for directory: /home/vkn/Documents/GNUR/Libraries/gr-zVKN/grc

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gnuradio/grc/blocks" TYPE FILE FILES
    "/home/vkn/Documents/GNUR/Libraries/gr-zVKN/grc/zVKN_flag_appender_p_mm.xml"
    "/home/vkn/Documents/GNUR/Libraries/gr-zVKN/grc/zVKN_flag_appender_c_mm.xml"
    "/home/vkn/Documents/GNUR/Libraries/gr-zVKN/grc/zVKN_preamble_adder_c_bb.xml"
    "/home/vkn/Documents/GNUR/Libraries/gr-zVKN/grc/zVKN_preamble_adder_tag_c_bb.xml"
    "/home/vkn/Documents/GNUR/Libraries/gr-zVKN/grc/zVKN_psk_mapper_c_bc.xml"
    "/home/vkn/Documents/GNUR/Libraries/gr-zVKN/grc/zVKN_srrc_filter_tx_c_cc.xml"
    "/home/vkn/Documents/GNUR/Libraries/gr-zVKN/grc/zVKN_fsk_modulator.xml"
    "/home/vkn/Documents/GNUR/Libraries/gr-zVKN/grc/zVKN_gfsk_modulator.xml"
    "/home/vkn/Documents/GNUR/Libraries/gr-zVKN/grc/zVKN_agc_p_cc.xml"
    "/home/vkn/Documents/GNUR/Libraries/gr-zVKN/grc/zVKN_add_scrambler_p_mm.xml"
    "/home/vkn/Documents/GNUR/Libraries/gr-zVKN/grc/zVKN_psk_mapper_p_mm.xml"
    "/home/vkn/Documents/GNUR/Libraries/gr-zVKN/grc/zVKN_awgn_p_cc.xml"
    "/home/vkn/Documents/GNUR/Libraries/gr-zVKN/grc/zVKN_srrc_filter_rx_c_cc.xml"
    "/home/vkn/Documents/GNUR/Libraries/gr-zVKN/grc/zVKN_squelch_agc_p_cc.xml"
    "/home/vkn/Documents/GNUR/Libraries/gr-zVKN/grc/zVKN_psk_decoder.xml"
    "/home/vkn/Documents/GNUR/Libraries/gr-zVKN/grc/zVKN_srrc_filter_rx_p_cc.xml"
    "/home/vkn/Documents/GNUR/Libraries/gr-zVKN/grc/zVKN_prot_header_tx_p_mm.xml"
    "/home/vkn/Documents/GNUR/Libraries/gr-zVKN/grc/zVKN_check_rx_pkt_p_mx.xml"
    )
endif()

