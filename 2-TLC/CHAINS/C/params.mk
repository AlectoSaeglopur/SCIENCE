
###################
##### GENERAL #####
###################

# retrieve build type invoked via shell as Make command argument
TMP_NAM = $(MAKECMDGOALS)



##################
##### COMMON #####
##################

# Relative path to main build folder
BLD_FPT = build

# Relative path to target/utest build folder
BLD_FLD = $(addprefix $(BLD_FPT)\,$(TMP_NAM))

# Compiler flags
# -Werror >> to consider each warning as an error
# -D >> to set a macro for all project files (e.g "-D DEBUG_TERMINAL")
# -g >> to enable GDB debugging
CMP_FLG = -Wall -g -O0

# Compiler version
CMP_VRS = gcc

# Common source files used by both build types

COM_FIL	= channel.c      	 	\
          convolutional.c   \
          crc.c             \
          debug.c           \
          error.c           \
          interleaving.c    \
          memory.c          \
          modulation.c      \
          reed_solomon.c    \
          scrambling.c



##################
##### TARGET #####
##################

# target build name
TRG_NAM = target

# relative path to source folder
TRG_SFD = src

# target build linker flags
LNK_FLG = -lm -Xlinker -Map=$(BLD_FLD)\lis\$(TRG_NAM).map

# target build conversion tool
CNV_TOL = objcopy

# target build conversion formats/extensions
CNV_EXT = srec

# target build info tool
INF_TOL = objdump

# source files list for target-build (.c only)
SRC_FIL = main.c            	\
          $(COM_FIL)



################
##### TEST #####
################

# test build name
TST_NAM = utest

# relative path to test folder
TST_SFD = test

# test build linker flags
TST_LKF = -lm

# source files list for utest-build (.c only)
TST_FIL = test_extra.c           	\
          test_convolutional.c    \
          test_modulation.c       \
          umain.c                 \
          $(COM_FIL)

# unity files list
UNT_FIL =  unity.c
