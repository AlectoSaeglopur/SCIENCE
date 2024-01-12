
#-------------------------------------
# Makefile v.1
# (less automated, but more readable)
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
CFLG = -Wall -Werror

# Linker flags
LFLG = -Xlinker -Map=$(BFL)\$(TARGET).map

# Compiler version
CCV = gcc



################
## PROCESSING ##
################

# Get current directory [NOT ESSENTIAL].
cdir = $(shell cd)

# Tell "make" through the keyword PHONY that "all/clean" rules are not file-related.
.PHONY : all
.PHONY : clean

# Define the "all"-rule (executing in sequence "clear" and all the compiling sub-rules defined below).
all : clean extra convolutional modulation main $(TARGET)

# Define the "clean"-rule.
clean :
# print message on screen
	@echo Cleaning build directory : $(cdir)\$(BFL)
# remove build folder recursively and in quiet mode (if existing)
	if exist $(BFL) rmdir $(BFL) /s /q
# re-create build folder (if not existing)
	if not exist $(BFL) mkdir $(BFL)

# Define the "extra"-rule to create the related assembly and object files.
# [as prerequisite check that extra.h and extra.c exist]
extra : $(SFL)\extra.c $(SFL)\extra.h
	$(CCV) -c $(CFLG) $(SFL)\extra.c -o $(BFL)\extra.o
	$(CCV) -S $(CFLG) $(SFL)\extra.c -o $(BFL)\extra.s
	$(CCV) -E $(CFLG) $(SFL)\extra.c -o $(BFL)\extra.i

# Define the "convolutional"-rule to create the related assembly and object files.
# [as prerequisite check that convolutional.h and convolutional.c exist]
convolutional : $(SFL)\convolutional.c $(SFL)\convolutional.h
	$(CCV) -c $(CFLG) $(SFL)\convolutional.c -o $(BFL)\convolutional.o
	$(CCV) -S $(CFLG) $(SFL)\convolutional.c -o $(BFL)\convolutional.s
	$(CCV) -E $(CFLG) $(SFL)\convolutional.c -o $(BFL)\convolutional.i

# Define the "modulation"-rule to create the related assembly and object files.
# [as prerequisite check that modulation.h and modulation.c exist]
modulation : $(SFL)\modulation.c $(SFL)\modulation.h
	$(CCV) -c $(CFLG) $(SFL)\modulation.c -o $(BFL)\modulation.o
	$(CCV) -S $(CFLG) $(SFL)\modulation.c -o $(BFL)\modulation.s
	$(CCV) -E $(CFLG) $(SFL)\modulation.c -o $(BFL)\modulation.i

# Define the "main"-rule to create the related assembly and object files.
# [as prerequisite check that main.c exists]
main : $(SFL)\main.c
	$(CCV) -c $(CFLG) $(SFL)\main.c -o $(BFL)\main.o
	$(CCV) -S $(CFLG) $(SFL)\main.c -o $(BFL)\main.s
	$(CCV) -E $(CFLG) $(SFL)\main.c -o $(BFL)\main.i

# Main Target Executable
$(TARGET) :
	$(CCV) $(BFL)\extra.o $(BFL)\convolutional.o $(BFL)\modulation.o $(BFL)\main.o $(CFLG) $(LFLG) -o $(BFL)\$(TARGET)
	@echo Compiled successfully! [v.1]
	@echo ----------------



###########
## NOTES ##
###########

# 0. See notes in "..\make_v2\Makefile".