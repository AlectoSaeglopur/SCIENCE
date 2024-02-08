
#-------------------------------------
# Makefile v.2
# (more automated, but less readable)
#-------------------------------------

##############
## INCLUDES ##
##############

# Load file with all configurations. 
include params.mk



################
## PROCESSING ##
################

# Get current directory [NOT ESSENTIAL].
cdir = $(shell cd)

# Create an object file for each source file (with the same name).
OBJF = $(SRCF:.c=.o)

# Create an assembly file for each source file (with the same name) [NOT ESSENTIAL].
ASBF = $(SRCF:.c=.s)

# Create a preprocessor file for each source file (with the same name) [NOT ESSENTIAL].
PPOF = $(SRCF:.c=.i)

# Create automatic/recursive rule for compiling each source file into the corresponding object file.
# [check prerequisites/dependencies (source files listed in SRCF shall exist)]
%.o:$(SFL)\%.c
# [NB: "$<" and "$@" represent respectively the current requisite and target output]
	$(CCV) -c $< $(CFLG) -o $(BFL)\obj\$@

# Create automatic/recursive rule for compiling each source file into the corresponding assembly file.
%.s: $(SFL)\%.c
	$(CCV) -S $< $(CFLG) -o $(BFL)\asm\$@

# Create automatic/recursive rule for compiling each source file into the corresponding preprocessor output file.
%.i: $(SFL)\%.c
	$(CCV) -E $< $(CFLG) -o $(BFL)\prp\$@

# Tell "make" through the keyword PHONY that "all/clean" rules are not file-related.
.PHONY : all
.PHONY : clean

# Define the "all"-rule (executing in sequence "clear" and "TARGET" sub-rules).
all : clean $(TARGET) conv

## Define the "clean"-rule for flushing the build folder. ##
clean :
# print message on screen
	@echo Cleaning build directory : $(cdir)\$(BFL)
# remove build folder recursively and in quiet mode (if existing)
	if exist $(BFL) rmdir $(BFL) /s /q
# re-create build folder (if not existing)
	if not exist $(BFL) mkdir $(BFL)
	if not exist $(BFL)\asm mkdir $(BFL)\asm
	if not exist $(BFL)\bin mkdir $(BFL)\bin
	if not exist $(BFL)\lis mkdir $(BFL)\lis
	if not exist $(BFL)\obj mkdir $(BFL)\obj
	if not exist $(BFL)\prp mkdir $(BFL)\prp
	@echo #1. Project cleaned successfully! [v.2]
	@echo ----------------

## Define the 'TARGET' rule for compiling and linking the project. ##
$(TARGET) : $(OBJF) $(ASBF) $(PPOF)
	$(CCV) $(addprefix $(BFL)\obj\,$(OBJF)) $(CFLG) $(LFLG) -o $(BFL)\bin\$@
	@echo #2. Project compiled successfully! [v.2]
	@echo ----------------

## Define the "conv"-rule for converting output to additional formats. ##
conv:
	for %%j in ($(CFE)) do $(CNV) $(BFL)\bin\$(TARGET).exe -O %%j $(BFL)\bin\$(TARGET).%%j
	@echo #3. Project converted successfully! [v.2]
	@echo ----------------



###########
## NOTES ##
###########

# 0. Getting the "missing separator"-error means a tab after a rule declaration is missing.

# 1. The project can be compiled and launched by "cls && make all && build\bin\vkn.exe" (assuming "BFL=build" and "TARGET=vkn")
#    or "cls && mingw32-make all && build\bin\vkn.exe" (to use the build-in MingGW make application, see "C:\MinGW\bin\").

# 2. This makefile is equivalent to the other one, but more efficient/automatized, since to add a new source
#    file to the compiling process you just need to add into SRCF.

# 3. For further details, see Module#2/Lesson#8 of Coursera training.

# 4. Remember to rename the makefile you want to use exactly as "Makefile".