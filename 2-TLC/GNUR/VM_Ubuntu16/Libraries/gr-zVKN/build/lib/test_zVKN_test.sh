#!/bin/sh
export VOLK_GENERIC=1
export GR_DONT_LOAD_PREFS=1
export srcdir=/home/vkn/Documents/GNUR/Libraries/gr-zVKN/lib
export GR_CONF_CONTROLPORT_ON=False
export PATH=/home/vkn/Documents/GNUR/Libraries/gr-zVKN/build/lib:$PATH
export LD_LIBRARY_PATH=/home/vkn/Documents/GNUR/Libraries/gr-zVKN/build/lib:$LD_LIBRARY_PATH
export PYTHONPATH=$PYTHONPATH
test-zVKN 
