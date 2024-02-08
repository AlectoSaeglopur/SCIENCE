
#-------------------------------------
# Makefile v.2
# (parameters list)
#-------------------------------------


################
## PARAMETERS ##
################

# Output-target name
TARGET = vkn

# Source-folder relative path
SFL = ..

# Build-folder relative path
BFL = build

# Compiler flags
CFLG = -Wall -Werror -g -O0 -D VERBOSE

# Linker flags
LFLG = -lm -Xlinker -Map=$(BFL)\lis\$(TARGET).map

# Compiler version
CCV = gcc

# Conversion tool
CNV = objcopy

# Conversion formats/extensions
CFE = srec \
      binary

# Source files list
SRCF = convolutional.c   \
       extra.c           \
       main.c            \
       modulation.c
