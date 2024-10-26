
##############
### COMMON ###
##############

# Relative path to source folder
SRC_FOLDER = src

# Relative path to main build folder
BLD_PATH = build

# Relative path to specific build folder
BLD_FOLDER = $(addprefix $(BLD_PATH)\,$(ARG_NAME))

# Compiler version
CMP_VERS = gcc

# Common source files list (.c only)
COM_FILES = channel.c         \
            convolutional.c   \
            crc.c             \
            debug.c           \
            error.c           \
            interleaving.c    \
            memory.c          \
            modulation.c      \
            reed_solomon.c    \
            scrambling.c



##############
### TARGET ###
##############

# Target-build name
TRG_NAME = target

# Target source files list (.c only)
TRG_FIL = main.c          \
          $(COM_FILES)

# Compiler flags
TRG_CMP_FLG = -Wall -g -O0

# Linker flags
TRG_LNK_FLG = -lm -Xlinker -Map=$(BLD_FOLDER)\lis\$(TRG_NAME).map

# Conversion tool
CNV_TOL = objcopy

# Conversion formats/extensions
CNV_EXT = srec            \
          ihex            \
          elf32-little

# Info tool
INF_TOL = objdump



#############
### UTEST ###
#############

# Unit-test build name
UTS_NAME = utest

# Unit-test source files list (.c only)
UTS_FILES = utest_channel.c          \
            utest_convolutional.c    \
            utest_debug.c            \
            utest_main.c             \
            utest_modulation.c       \
            $(COM_FILES)

# Unity files list
UNY_FILES = unity.c

# Compiler flags
UTS_CMP_FLG = -Wall -g -O0 -D UTEST

# Linker flags
UTS_LNK_FLG = -lm



#############
### NOTES ###
#############

# 1. Legend:
#   § BLD = build
#   § CMP = compiler
#   § COM = common
#   § FLG = flag
#   § LNK = linker
#   § SRC = source
#   § TRG = target
#   § UTS = unit-test

# 2. Compiler flags:
#   § -Werror >> to consider each warning as an error
#   § -D >> to set a macro for all project files (e.g "-D VERBOSE")
#   § -g >> to enable GDB debugging
#   § --verbose >> to display extra info while compiling

# 3. Linker flags:
#   § -nostartfiles >> to skip lnking startup code
#   § -nostdlib >> not to  use the standard system libraries
#   § -T xyz.ld >> to use custom linker script
#   § --verbose >> to display extra info while linking
