/* -*- c++ -*- */

#define ZVKN_API

%include "gnuradio.i"			// the common stuff

//load generated python docstrings
%include "zVKN_swig_doc.i"

%{
#include "zVKN/flag_appender_c_mm.h"
#include "zVKN/preamble_adder_c_bb.h"
#include "zVKN/preamble_adder_tag_c_bb.h"
#include "zVKN/psk_mapper_c_bc.h"
#include "zVKN/srrc_filter_tx_c_cc.h"
#include "zVKN/srrc_filter_rx_c_cc.h"
%}


%include "zVKN/flag_appender_c_mm.h"
GR_SWIG_BLOCK_MAGIC2(zVKN, flag_appender_c_mm);
%include "zVKN/preamble_adder_c_bb.h"
GR_SWIG_BLOCK_MAGIC2(zVKN, preamble_adder_c_bb);
%include "zVKN/preamble_adder_tag_c_bb.h"
GR_SWIG_BLOCK_MAGIC2(zVKN, preamble_adder_tag_c_bb);
%include "zVKN/psk_mapper_c_bc.h"
GR_SWIG_BLOCK_MAGIC2(zVKN, psk_mapper_c_bc);
%include "zVKN/srrc_filter_tx_c_cc.h"
GR_SWIG_BLOCK_MAGIC2(zVKN, srrc_filter_tx_c_cc);
%include "zVKN/srrc_filter_rx_c_cc.h"
GR_SWIG_BLOCK_MAGIC2(zVKN, srrc_filter_rx_c_cc);
