# Copyright 2011,2012 Free Software Foundation, Inc.
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
# Setup library
########################################################################
include(GrPlatform) #define LIB_SUFFIX

include_directories(${Boost_INCLUDE_DIR})
link_directories(${Boost_LIBRARY_DIRS})

list(APPEND zVKN_sources
    flag_appender_c_mm_impl.cc
    preamble_adder_c_bb_impl.cc
    preamble_adder_tag_c_bb_impl.cc
    psk_mapper_c_bc_impl.cc
    srrc_filter_tx_c_cc_impl.cc
    srrc_filter_rx_c_cc_impl.cc
)

set(zVKN_sources "${zVKN_sources}" PARENT_SCOPE)
if(NOT zVKN_sources)
	MESSAGE(STATUS "No C++ sources... skipping lib/")
	return()
endif(NOT zVKN_sources)

add_library(gnuradio-zVKN SHARED ${zVKN_sources})
target_link_libraries(gnuradio-zVKN ${Boost_LIBRARIES} ${GNURADIO_ALL_LIBRARIES})
set_target_properties(gnuradio-zVKN PROPERTIES DEFINE_SYMBOL "gnuradio_zVKN_EXPORTS")

if(APPLE)
    set_target_properties(gnuradio-zVKN PROPERTIES
        INSTALL_NAME_DIR "${CMAKE_INSTALL_PREFIX}/lib"
    )
endif(APPLE)

########################################################################
# Install built library files
########################################################################
install(TARGETS gnuradio-zVKN
    LIBRARY DESTINATION lib${LIB_SUFFIX} # .so/.dylib file
    ARCHIVE DESTINATION lib${LIB_SUFFIX} # .lib file
    RUNTIME DESTINATION bin              # .dll file
)

########################################################################
# Build and register unit test
########################################################################
include(GrTest)

include_directories(${CPPUNIT_INCLUDE_DIRS})

list(APPEND test_zVKN_sources
    ${CMAKE_CURRENT_SOURCE_DIR}/test_zVKN.cc
    ${CMAKE_CURRENT_SOURCE_DIR}/qa_zVKN.cc
)

add_executable(test-zVKN ${test_zVKN_sources})

target_link_libraries(
  test-zVKN
  ${GNURADIO_RUNTIME_LIBRARIES}
  ${Boost_LIBRARIES}
  ${CPPUNIT_LIBRARIES}
  gnuradio-zVKN
)

GR_ADD_TEST(test_zVKN test-zVKN)
