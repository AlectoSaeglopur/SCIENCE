
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
BFL = bin

# Compiler flags
CFLG = -Wall -Werror -g -O0 -D VERBOSE

# Linker flags
LFLG = -lm -Xlinker -Map=$(BFL)\$(TARGET).map

# Compiler version
CCV = gcc

# Source files list
SRCF =	convolutional.c		\
		extra.c 			\
		main.c				\
		modulation.c
