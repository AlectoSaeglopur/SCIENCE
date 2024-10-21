
################
### INCLUDES ###
################

include params.mk



#################
#### GENERAL ####
#################

# Get current directory.
CUR_DIR = $(shell cd)

# Retrieve build type invoked via shell as Make command argument
ARG_NAME = $(MAKECMDGOALS)

# Adjust compiler flags according to build type
ifeq ($(ARG_NAME),$(TRG_NAME))
  ARG_CMP_FLAG = TRG_CMP_FLG
else ifeq ($(ARG_NAME),$(UTS_NAME))
  ARG_CMP_FLAG = UTS_CMP_FLG
endif

# Tell "make" through the keyword PHONY that ALL and CLEAN rules are not file-related.
.PHONY : clean
.PHONY : all

## General rule #1: CLEAN ##
clean :
# print message on screen
	@echo Cleaning main build directory : $(CUR_DIR)\$(BLD_PATH)
# remove main build folder recursively and in quiet mode
	if exist $(BLD_PATH) rmdir $(BLD_PATH) /s /q
	@echo ------------------------------------------------
	@echo ^>^> Main build directory cleaned successfully.
	@echo ------------------------------------------------

## General rule #2: ALL ##
all : error_msg

error_msg:
	@echo ERROR: "all"-build not supported, each build shall be launched as standalone.



################
#### TARGET ####
################

# Create list of source files names without extension.
NAM_SFIL = $(TRG_FIL:.c=)

# Create object files list based on source files list.
OBJ_SFIL = $(TRG_FIL:.c=.o)

# Create assembly files list based on source files list.
ASM_SFIL = $(TRG_FIL:.c=.s)

# Create preprocessor files list based on source files list.
PRP_SFIL = $(TRG_FIL:.c=.i)

# Recursive rule for compiling each source file into the corresponding object file
%.o : $(SRC_FOLDER)\%.c
	$(CMP_VERS) -c $< $($(ARG_CMP_FLAG)) -o $(addprefix $(BLD_PATH)\,$(ARG_NAME))\obj\$@

# Recursive rule for compiling each source file into the corresponding assembly file.
%.s : $(SRC_FOLDER)\%.c
	$(CMP_VERS) -S $< $(TRG_CMP_FLG) -o $(BLD_FOLDER)\asm\$@

# Recursive rule for compiling each source file into the corresponding preprocessor output file.
%.i : $(SRC_FOLDER)\%.c
	$(CMP_VERS) -E $< $(TRG_CMP_FLG) -o $(BLD_FOLDER)\prp\$@

## Rule #0: TARGET ##
$(TRG_NAME) : $(TRG_NAME)_clean $(TRG_NAME)_build $(TRG_NAME)_conv $(TRG_NAME)_extr run_exe

## Rule #1: TARGET_CLEAN ##
$(TRG_NAME)_clean :
	@echo ^>^> Cleaning "$(TRG_NAME)" build directory...
	@echo $(ARG_NAME)
# create main build folder if not existing
	if not exist $(BLD_PATH) mkdir $(BLD_PATH)
# delete and recreate target build folder
	if exist $(BLD_FOLDER) rmdir $(BLD_FOLDER) /s /q
	if not exist $(BLD_FOLDER) mkdir $(BLD_FOLDER)
# recreate target build subfolders
	if not exist $(BLD_FOLDER)\asm mkdir $(BLD_FOLDER)\asm
	if not exist $(BLD_FOLDER)\bin mkdir $(BLD_FOLDER)\bin
	if not exist $(BLD_FOLDER)\lis mkdir $(BLD_FOLDER)\lis
	if not exist $(BLD_FOLDER)\obj mkdir $(BLD_FOLDER)\obj
	if not exist $(BLD_FOLDER)\prp mkdir $(BLD_FOLDER)\prp
	if not exist $(BLD_FOLDER)\obj\$(INF_TOL) mkdir $(BLD_FOLDER)\obj\$(INF_TOL)
	if not exist $(BLD_FOLDER)\lis\$(INF_TOL) mkdir $(BLD_FOLDER)\lis\$(INF_TOL)
	@echo ------------------------------------------------
	@echo ^>^> "$(TRG_NAME)"-build folder cleaned successfully!
	@echo ------------------------------------------------

## Rule #2: TARGET_BUILD ##
$(TRG_NAME)_build : cmp_print $(OBJ_SFIL) $(ASM_SFIL) $(PRP_SFIL)
	@echo Starting "$(TRG_NAME)"-build linking...
	$(CMP_VERS) $(addprefix $(BLD_FOLDER)\obj\,$(OBJ_SFIL)) $(TRG_CMP_FLG) $(TRG_LNK_FLG) -o $(BLD_FOLDER)\bin\$(TRG_NAME)
	@echo ------------------------------------------------
	@echo ^>^> "$(TRG_NAME)"-build compiled and linked successfully!
	@echo ------------------------------------------------

## Rule #3: TARGET_CONV ##
$(TRG_NAME)_conv :
	@echo Converting output to additional formats ($(addprefix .,$(CNV_EXT)))...
	for %%j in ($(CNV_EXT)) do $(CNV_TOL) $(BLD_FOLDER)\bin\$(TRG_NAME).exe -O %%j $(BLD_FOLDER)\bin\$(TRG_NAME).%%j
	@echo ------------------------------------------------
	@echo ^>^> "$(TRG_NAME)"-build converted successfully!
	@echo ------------------------------------------------

## Rule #4: EXTRACT_INFO ##
$(TRG_NAME)_extr : $(OBJ_SFIL)
	@echo Extracting info from "$(TRG_NAME)"-build executable...
	$(INF_TOL) -D $(BLD_FOLDER)\bin\$(TRG_NAME).exe > $(BLD_FOLDER)\lis\$(INF_TOL)\$(TRG_NAME).txt
	@echo Extracting info from "$(TRG_NAME)"-build objects...
	for %%j in ($(NAM_SFIL)) do $(INF_TOL) -d -S $(BLD_FOLDER)\obj\%%j.o > $(BLD_FOLDER)\obj\$(INF_TOL)\%%j.txt
	@echo ------------------------------------------------
	@echo ^>^> "$(TRG_NAME)"-build info extracted successfully!
	@echo ------------------------------------------------



###############
#### UTEST ####
###############

# Create an object file for each test file (with the same name).
OBJ_TFIL = $(UTS_FILES:.c=.o)

# Create an object file for each unity file (with the same name).
OBJ_UFIL = $(UNY_FILES:.c=.o)

# Recursive rule for compiling each test file into the corresponding object file
%.o : $(UTS_NAME)\%.c
	$(CMP_VERS) -c $< $(UTS_CMP_FLG) -o $(addprefix $(BLD_PATH)\,$(ARG_NAME))\obj\$@

# Recursive rule for compiling each unity file into the corresponding object file
%.o : $(UTS_NAME)\unity\%.c
	$(CMP_VERS) -c $< $(UTS_CMP_FLG) -o $(addprefix $(BLD_PATH)\,$(ARG_NAME))\obj\$@

## Rule #0: TEST ##
$(UTS_NAME) : $(UTS_NAME)_clean $(UTS_NAME)_build run_exe

## Rule #1: TEST_CLEAN ##
$(UTS_NAME)_clean :
	@echo Cleaning "$(UTS_NAME)" build directory...
# create main build folder if not existing
	if not exist $(BLD_PATH) mkdir $(BLD_PATH)
# delete and recreate test build folder
	if exist $(BLD_FOLDER) rmdir $(BLD_FOLDER) /s /q
	if not exist $(BLD_FOLDER) mkdir $(BLD_FOLDER)
# recreate test build subfolders
	if not exist $(BLD_FOLDER)\bin mkdir $(BLD_FOLDER)\bin
	if not exist $(BLD_FOLDER)\obj mkdir $(BLD_FOLDER)\obj
	@echo ------------------------------------------------
	@echo ^>^> "$(UTS_NAME)"-build folder cleaned successfully!
	@echo ------------------------------------------------

## Rule #2: TEST_BUILD ##
$(UTS_NAME)_build : cmp_print $(OBJ_TFIL) $(OBJ_UFIL)
	@echo Starting "$(UTS_NAME)"-build linking...
	$(CMP_VERS) $(addprefix $(BLD_FOLDER)\obj\,$(OBJ_TFIL)) $(addprefix $(BLD_FOLDER)\obj\,$(OBJ_UFIL)) $(UTS_CMP_FLG) $(UTS_LNK_FLG) -o $(BLD_FOLDER)\bin\$(UTS_NAME).exe
	@echo ------------------------------------------------
	@echo ^>^> "$(UTS_NAME)"-build compiled and linked successfully!
	@echo ------------------------------------------------



################
#### COMMON ####
################

# Rule to print the start-of-compilation message for any build type
cmp_print :
	@echo Starting "$(ARG_NAME)"-build compilation...

# Rule to run compilation output .exe for any build type
run_exe :
	@echo Launching "$(ARG_NAME)"-build output...
	$(BLD_PATH)\$(ARG_NAME)\bin\$(ARG_NAME).exe
	@echo ------------------------------------------------
	@echo ^>^> "$(ARG_NAME)"-build executed successfully!
	@echo ------------------------------------------------



#############
### NOTES ###
#############

# 1. Make builds available (assuming names matching with those within "params.mk"):
#    - type "make target" to compile and run the main project;
#    - type "make utest" to compile and run unit tests;
#    - type "clean" to completely remove the main build folder;
#    - NB: "make all" is not supported.

# 2. Various Make tips and tricks:
#    - use the "-d" flag to debug Makefile execution (e.g. "make target -d");
#    - to delete a file within Makefile with Windows OS use "if exist $(PATH\XYZ) del $(PATH\XYZ)" [NB: "rm" is only for Linux/UNIX platforms];
#    - the symbols "$<" and "$@" represent respectively the current requisite and target output;
#    - to redirect printed output from shell to log file use the ">" character (e.g. "cls && make target > build.log"), otherwise to have both print and log use the CoreUtils "tee" function (e.g. "cls && make target | tee build.log").
