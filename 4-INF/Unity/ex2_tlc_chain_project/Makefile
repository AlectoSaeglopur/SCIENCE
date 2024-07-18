
##############
## INCLUDES ##
##############

# Load file with all configurations. 
include params.mk



################
## PROCESSING ##
################

# Get current directory.
cdir = $(shell cd)









# Tell "make" through the keyword PHONY that "all/clean" rules are not file-related.
.PHONY : all
.PHONY : clean

# Define the "all"-rule (executing in sequence "clear" and "TRG_NAM" sub-rules).
all : clean $(TRG_NAM) conv



## Define the "clean"-rule for flushing the build folder. ##
clean :
# print message on screen
	@echo Cleaning build directory : $(cdir)\$(BLD_FPT)
# remove build folder recursively and in quiet mode (if existing)
	if exist $(BLD_FPT) rmdir $(BLD_FPT) /s /q
# re-create build folder (if not existing)
	if not exist $(BLD_FPT) mkdir $(BLD_FPT)
	if not exist $(BLD_FPT)\asm mkdir $(BLD_FPT)\asm
	if not exist $(BLD_FPT)\bin mkdir $(BLD_FPT)\bin
	if not exist $(BLD_FPT)\lis mkdir $(BLD_FPT)\lis
	if not exist $(BLD_FPT)\obj mkdir $(BLD_FPT)\obj
	if not exist $(BLD_FPT)\prp mkdir $(BLD_FPT)\prp
	@echo #1. Project cleaned successfully!
	@echo ------------------------------------------------


##################
##### COMMON #####
##################

# Rule to print the start-of-compilation message for any build type
$(MAKECMDGOALS)_cprint :
	@echo Starting "$(MAKECMDGOALS)"-build compilation...

# Rule to run compilation output .exe for any build type
$(MAKECMDGOALS)_run :
	@echo Launching "$(MAKECMDGOALS)"-build output...
	$(BLD_FPT)\$(MAKECMDGOALS)\bin\$(MAKECMDGOALS).exe



##################
##### TARGET #####
##################

# Create an object file for each source file (with the same name).
OBJ_SFIL = $(SRC_FIL:.c=.o)

# Create an assembly file for each source file (with the same name) [NOT ESSENTIAL].
ASM_SFIL = $(SRC_FIL:.c=.s)

# Create a preprocessor file for each source file (with the same name) [NOT ESSENTIAL].
PRP_SFIL = $(SRC_FIL:.c=.i)

# Recursive rule for compiling each source file into the corresponding object file
%.o : $(TRG_SFD)\%.c
	$(CMP_VRS) -c $< $(CMP_FLG) -o $(addprefix $(BLD_FPT)\,$(MAKECMDGOALS))\obj\$@

# Recursive rule for compiling each source file into the corresponding assembly file.
%.s : $(TRG_SFD)\%.c
	$(CMP_VRS) -S $< $(CMP_FLG) -o $(TRG_BFD)\asm\$@

# Recursive rule for compiling each source file into the corresponding preprocessor output file.
%.i : $(TRG_SFD)\%.c
	$(CMP_VRS) -E $< $(CMP_FLG) -o $(TRG_BFD)\prp\$@

## Rule #0: TARGET ##
$(TRG_NAM) : $(TRG_NAM)_clean $(TRG_NAM)_build $(TRG_NAM)_conv $(TRG_NAM)_run

## Rule #1: TARGET_CLEAN ##
$(TRG_NAM)_clean :
	@echo Cleaning "$(TRG_NAM)" build directory...
# create main build folder if not existing
	if not exist $(BLD_FPT) mkdir $(BLD_FPT)
# delete and recreate target build folder
	if exist $(TRG_BFD) rmdir $(TRG_BFD) /s /q
	if not exist $(TRG_BFD) mkdir $(TRG_BFD)
# recreate target build subfolders
	if not exist $(TRG_BFD)\asm mkdir $(TRG_BFD)\asm
	if not exist $(TRG_BFD)\bin mkdir $(TRG_BFD)\bin
	if not exist $(TRG_BFD)\lis mkdir $(TRG_BFD)\lis
	if not exist $(TRG_BFD)\obj mkdir $(TRG_BFD)\obj
	if not exist $(TRG_BFD)\prp mkdir $(TRG_BFD)\prp
	@echo ------------------------------------------------
	@echo #1. "$(TRG_NAM)"-build folder cleaned successfully!
	@echo ------------------------------------------------

## Rule #2: TARGET_BUILD ##
$(TRG_NAM)_build : $(TRG_NAM)_cprint $(OBJ_SFIL) $(S) $(PRP_SFIL)
	@echo Starting "$(TRG_NAM)"-build linking...
	$(CMP_VRS) $(addprefix $(TRG_BFD)\obj\,$(OBJ_SFIL)) $(CMP_FLG) $(LNK_FLG) -o $(TRG_BFD)\bin\$(TRG_NAM)
	@echo ------------------------------------------------
	@echo #2. "$(TRG_NAM)" build compiled and linked successfully!
	@echo ------------------------------------------------

## Rule #3: TARGET_CONV ##
$(TRG_NAM)_conv :
	@echo Converting output to additional formats ($(addprefix .,$(CNV_EXT)))...
	for %%j in ($(CNV_EXT)) do $(CNV_TOL) $(TRG_BFD)\bin\$(TRG_NAM).exe -O %%j $(TRG_BFD)\bin\$(TRG_NAM).%%j
	@echo ------------------------------------------------
	@echo #3. "$(TRG_NAM)"-build converted successfully!
	@echo ------------------------------------------------



################
##### TEST #####
################

# Create an object file for each test file (with the same name).
OBJ_TFIL = $(TST_FIL:.c=.o)

# Create an object file for each unity file (with the same name).
OBJ_UFIL = $(UNT_FIL:.c=.o)

# Recursive rule for compiling each test file into the corresponding object file
%.o : $(TST_SFD)\%.c
	$(CMP_VRS) -c $< $(CMP_FLG) -o $(addprefix $(BLD_FPT)\,$(MAKECMDGOALS))\obj\$@

# Recursive rule for compiling each unity file into the corresponding object file
%.o : $(TST_SFD)\unity\%.c
	$(CMP_VRS) -c $< $(CMP_FLG) -o $(addprefix $(BLD_FPT)\,$(MAKECMDGOALS))\obj\$@

## Rule #0: TEST ##
$(TST_NAM) : $(TST_NAM)_clean $(TST_NAM)_build $(TST_NAM)_run

## Rule #1: TEST_CLEAN ##
$(TST_NAM)_clean :
	@echo Cleaning "$(TST_NAM)" build directory...
# create main build folder if not existing
	if not exist $(BLD_FPT) mkdir $(BLD_FPT)
# delete and recreate test build folder
	if exist $(TST_BFD) rmdir $(TST_BFD) /s /q
	if not exist $(TST_BFD) mkdir $(TST_BFD)
# recreate test build subfolders
	if not exist $(TST_BFD)\bin mkdir $(TST_BFD)\bin
	if not exist $(TST_BFD)\lis mkdir $(TST_BFD)\lis
	if not exist $(TST_BFD)\obj mkdir $(TST_BFD)\obj
	@echo ------------------------------------------------
	@echo #1. "$(TST_NAM)"-build folder cleaned successfully!
	@echo ------------------------------------------------

## Rule #2: TEST_BUILD ##
$(TST_NAM)_build : $(TST_NAM)_cprint $(OBJ_TFIL) $(OBJ_UFIL)
	@echo Starting "$(TST_NAM)"-build linking...
	$(CMP_VRS) $(addprefix $(TST_BFD)\obj\,$(OBJ_TFIL)) $(addprefix $(TST_BFD)\obj\,$(OBJ_UFIL)) $(CMP_FLG) $(LNK_FLG) -o $(TST_BFD)\bin\$(TST_NAM)
	@echo ------------------------------------------------
	@echo #2. "$(TST_NAM)"-build compiled and linked successfully!
	@echo ------------------------------------------------







###########
## NOTES ##
###########

# 1. Run by typing on shell "cls && make all && build\bin\vkn.exe" (assuming "BLD_FPT=build" and "TARGET=vkn").

# $(MAKECMDGOALS) return the rule invoked by shell, i.e. "XXX" if you launched "make XXX"

# make clean

# make test
# make all

# dire che in "%.o: $(TRG_SFD)\%.c" quello dopo ":" sono i prerequisiti! (checking also as prerequisites/dependencies that corresponding source files listed in TRG_SFD exist)

#for target:
# cls && make target_build && build\target\bin\target.exe


# to delete a file: if exist $(XXX) del $(XXX)   (for Win only! and if Linux/Unix use "rm" instead of "del")

# [NB: "$<" and "$@" represent respectively the current requisite and target output]