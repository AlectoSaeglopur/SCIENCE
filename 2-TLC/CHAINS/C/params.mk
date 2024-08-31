
###################
##### GENERAL #####
###################

# retrieve build type invoked via shell as Make command argument
TMP_NAM = $(MAKECMDGOALS)



##################
##### COMMON #####
##################

# relative path to main build folder
BLD_FPT = build

# relative path to target/utest build folder
BLD_FLD = $(addprefix $(BLD_FPT)\,$(TMP_NAM))

# compiler flags
#CMP_FLG = -Wall -Werror -g -O0 -D VERBOSE
CMP_FLG = -Wall -g -O0 -D VERBOSE

# compiler version
CMP_VRS = gcc

# common source files used by both build types
COM_FIL = channel.c					\
					convolutional.c		\
       		debug.c           \
					error.c           \
       		modulation.c



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
CNV_EXT = srec 	\
      		binary

# target-build source files list
SRC_FIL = main.c   					\
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

# test files list
TST_FIL = test_extra.c           	\
       		test_convolutional.c   	\
       		test_modulation.c				\
					umain.c									\
					$(COM_FIL)

# unity files list
UNT_FIL =	unity.c
