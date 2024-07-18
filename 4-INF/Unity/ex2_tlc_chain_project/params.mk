
################
## PARAMETERS ##
################

### 1. Target build  ###

# output file name
TRG_NAM = target

# relative path to source folder
TRG_SFD = src

# relative path to build folder
BLD_FPT = build

# @vkn: elimina!! (BLD_FLD is enough!)
TRG_BFD = $(addprefix $(BLD_FPT)\,$(TRG_NAM))

BLD_FLD = $(addprefix $(BLD_FPT)\,$(MAKECMDGOALS))

# compiler flags
CMP_FLG = -Wall -Werror -g -O0 -D VERBOSE

# linker flags
LNK_FLG = -lm -Xlinker -Map=$(BLD_FLD)\lis\$(MAKECMDGOALS).map

# compiler version
CMP_VRS = gcc

# conversion tool
CNV_TOL = objcopy

# conversion formats/extensions
CNV_EXT = srec 	\
      		binary


COM_FIL = convolutional.c		\
       		extra.c           \
       		modulation.c


# source files list
SRC_FIL = main.c   					\
					$(COM_FIL)

# unit test files list
TST_FIL = test_extra.c           	\
       		test_convolutional.c   	\
       		test_modulation.c				\
					umain.c									\
					$(COM_FIL)
					

# unity files list 
UNT_FIL =	unity.c


TST_NAM = utest

TST_SFD = test

# @vkn: elimina!! (BLD_FLD is enough!)
TST_BFD = $(addprefix $(BLD_FPT)\,$(TST_NAM))