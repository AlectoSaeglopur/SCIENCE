
##############
## INCLUDES ##
##############

include params.mk



###################
##### GENERAL #####
###################

# Get current directory.
CUR_DIR = $(shell cd)

# Tell "make" through the keyword PHONY that ALL and CLEAN rules are not file-related.
.PHONY : clean
.PHONY : all

## General rule #1: CLEAN ##
clean :
# print message on screen
	@echo Cleaning main build directory : $(CUR_DIR)\$(BLD_FPT)
# remove main build folder recursively and in quiet mode
	if exist $(BLD_FPT) rmdir $(BLD_FPT) /s /q
	@echo ------------------------------------------------
	@echo !!! Main build directory cleaned successfully.
	@echo ------------------------------------------------

## General rule #2: ALL ##
all : error_msg

error_msg:
	@echo ERROR: "all"-build not supported, each build shall be launched as standalone.



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
	$(CMP_VRS) -c $< $(CMP_FLG) -o $(addprefix $(BLD_FPT)\,$(TMP_NAM))\obj\$@

# Recursive rule for compiling each source file into the corresponding assembly file.
%.s : $(TRG_SFD)\%.c
	$(CMP_VRS) -S $< $(CMP_FLG) -o $(BLD_FLD)\asm\$@

# Recursive rule for compiling each source file into the corresponding preprocessor output file.
%.i : $(TRG_SFD)\%.c
	$(CMP_VRS) -E $< $(CMP_FLG) -o $(BLD_FLD)\prp\$@

## Rule #0: TARGET ##
$(TRG_NAM) : $(TRG_NAM)_clean $(TRG_NAM)_build $(TRG_NAM)_conv run_exe

## Rule #1: TARGET_CLEAN ##
$(TRG_NAM)_clean :
	@echo Cleaning "$(TRG_NAM)" build directory...
# create main build folder if not existing
	if not exist $(BLD_FPT) mkdir $(BLD_FPT)
# delete and recreate target build folder
	if exist $(BLD_FLD) rmdir $(BLD_FLD) /s /q
	if not exist $(BLD_FLD) mkdir $(BLD_FLD)
# recreate target build subfolders
	if not exist $(BLD_FLD)\asm mkdir $(BLD_FLD)\asm
	if not exist $(BLD_FLD)\bin mkdir $(BLD_FLD)\bin
	if not exist $(BLD_FLD)\lis mkdir $(BLD_FLD)\lis
	if not exist $(BLD_FLD)\obj mkdir $(BLD_FLD)\obj
	if not exist $(BLD_FLD)\prp mkdir $(BLD_FLD)\prp
	@echo ------------------------------------------------
	@echo !!! "$(TRG_NAM)"-build folder cleaned successfully!
	@echo ------------------------------------------------

## Rule #2: TARGET_BUILD ##
$(TRG_NAM)_build : cmp_print $(OBJ_SFIL) $(ASM_SFIL) $(PRP_SFIL)
	@echo Starting "$(TRG_NAM)"-build linking...
	$(CMP_VRS) $(addprefix $(BLD_FLD)\obj\,$(OBJ_SFIL)) $(CMP_FLG) $(LNK_FLG) -o $(BLD_FLD)\bin\$(TRG_NAM)
	@echo ------------------------------------------------
	@echo !!! "$(TRG_NAM)" build compiled and linked successfully!
	@echo ------------------------------------------------

## Rule #3: TARGET_CONV ##
$(TRG_NAM)_conv :
	@echo Converting output to additional formats ($(addprefix .,$(CNV_EXT)))...
	for %%j in ($(CNV_EXT)) do $(CNV_TOL) $(BLD_FLD)\bin\$(TRG_NAM).exe -O %%j $(BLD_FLD)\bin\$(TRG_NAM).%%j
	@echo ------------------------------------------------
	@echo !!! "$(TRG_NAM)"-build converted successfully!
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
	$(CMP_VRS) -c $< $(CMP_FLG) -o $(addprefix $(BLD_FPT)\,$(TMP_NAM))\obj\$@

# Recursive rule for compiling each unity file into the corresponding object file
%.o : $(TST_SFD)\unity\%.c
	$(CMP_VRS) -c $< $(CMP_FLG) -o $(addprefix $(BLD_FPT)\,$(TMP_NAM))\obj\$@

## Rule #0: TEST ##
$(TST_NAM) : $(TST_NAM)_clean $(TST_NAM)_build run_exe

## Rule #1: TEST_CLEAN ##
$(TST_NAM)_clean :
	@echo Cleaning "$(TST_NAM)" build directory...
# create main build folder if not existing
	if not exist $(BLD_FPT) mkdir $(BLD_FPT)
# delete and recreate test build folder
	if exist $(BLD_FLD) rmdir $(BLD_FLD) /s /q
	if not exist $(BLD_FLD) mkdir $(BLD_FLD)
# recreate test build subfolders
	if not exist $(BLD_FLD)\bin mkdir $(BLD_FLD)\bin
	if not exist $(BLD_FLD)\obj mkdir $(BLD_FLD)\obj
	@echo ------------------------------------------------
	@echo !!! "$(TST_NAM)"-build folder cleaned successfully!
	@echo ------------------------------------------------

## Rule #2: TEST_BUILD ##
$(TST_NAM)_build : cmp_print $(OBJ_TFIL) $(OBJ_UFIL)
	@echo Starting "$(TST_NAM)"-build linking...
	$(CMP_VRS) $(addprefix $(BLD_FLD)\obj\,$(OBJ_TFIL)) $(addprefix $(BLD_FLD)\obj\,$(OBJ_UFIL)) $(CMP_FLG) $(TST_LKF) -o $(BLD_FLD)\bin\$(TST_NAM).exe
	@echo ------------------------------------------------
	@echo !!! "$(TST_NAM)"-build compiled and linked successfully!
	@echo ------------------------------------------------



##################
##### COMMON #####
##################

# Rule to print the start-of-compilation message for any build type
cmp_print :
	@echo Starting "$(TMP_NAM)"-build compilation...

# Rule to run compilation output .exe for any build type
run_exe :
	@echo Launching "$(TMP_NAM)"-build output...
	$(BLD_FPT)\$(TMP_NAM)\bin\$(TMP_NAM).exe



###########
## NOTES ##
###########

# 1. Make builds available (assuming names matching with those within "params.mk"):
#    - type "make target" to compile and run the main project;
#    - type "make utest" to compile and run unit tests;
#    - type "clean" to completely remove the main build folder;
#    - NB: "make all" is not supported.

# 2. Various Make tips and tricks:
#    - use the "-d" flag to debug Makefile execution (e.g. "make target -d");
#    - to delete a file within Makefile with Windows OS use "if exist $(PATH\XYZ) del $(PATH\XYZ)" [NB: "rm" is only for Linux/UNIX platforms];
#    - The symbols "$<" and "$@" represent respectively the current requisite and target output;
