
###
# EXAMPLE #1 - ORIGIN
###


## DEFINES ##

# custom define of printf function
define DEBUG_PRINT
$(info >> Scanning '${1}' as '${2}'...)
endef



## VARIABLES ##

# variable under test
MEV = OS

# additional variable defined within Makefile
vknVar = 2

# Makefile override (used in case d.)
#$(MEV) = $(vknVar)



## INITIALIZATION ##

# MEV variable check [NB: shall be performed during initialization, i.e. outside any rule!]
$(call DEBUG_PRINT,MEV,$(MEV))
ifeq ($(origin $(MEV)), undefined)
$(info >> Variable undefined anywhere.)
else ifeq ($(origin $(MEV)), environment)
$(info >> Environment variable existing and equal to '$($(MEV))'.)
else ifeq ($(origin $(MEV)), file)
$(info >> variable defined within Makefile and equal to '$($(MEV))'.)
else
$(info $(info >> other type: '$(origin $(MEV))' (and value equal to '$($(MEV))').))
endif



## RULES ##

all: xxx

xxx:
	@echo Completed!



## NOTES ##

# 0. Run by executing "cls && make all".

# 1. To check the various scenarios:
#    a. set MEV to any known existing environment variable (e.g. "MEV = OS") and check that's recognized as an existing EV;
#    b. set MEV to any meaningless value (e.g. "MEV = xyz") and check that's recognized as undefined;
#    c. set MEV to any variable already defined within the Makefile (e.g. "vknVar") and check that's recognized as a file variable;
#    d. set MEV to any known existing environment variable (e.g. "MEV = OS"), uncomment the override line and check that's recognized as the value defined in Makefile when running "make all" and overriden froem environment space when running "make all -e".

# 2. Note you can set an environmnet variable via shell by running "export VARNAME=VARVALUE".

# 3. For further details see:
#    https://www.gnu.org/software/make/manual/html_node/Origin-Function.html
