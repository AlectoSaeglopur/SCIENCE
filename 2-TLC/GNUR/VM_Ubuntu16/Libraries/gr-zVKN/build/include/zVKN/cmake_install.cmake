# Install script for directory: /home/vkn/Documents/GNUR/Libraries/gr-zVKN/include/zVKN

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/zVKN" TYPE FILE FILES
    "/home/vkn/Documents/GNUR/Libraries/gr-zVKN/include/zVKN/api.h"
    "/home/vkn/Documents/GNUR/Libraries/gr-zVKN/include/zVKN/flag_appender_c_mm.h"
    "/home/vkn/Documents/GNUR/Libraries/gr-zVKN/include/zVKN/preamble_adder_c_bb.h"
    "/home/vkn/Documents/GNUR/Libraries/gr-zVKN/include/zVKN/preamble_adder_tag_c_bb.h"
    "/home/vkn/Documents/GNUR/Libraries/gr-zVKN/include/zVKN/psk_mapper_c_bc.h"
    "/home/vkn/Documents/GNUR/Libraries/gr-zVKN/include/zVKN/srrc_filter_tx_c_cc.h"
    "/home/vkn/Documents/GNUR/Libraries/gr-zVKN/include/zVKN/srrc_filter_rx_c_cc.h"
    )
endif()

