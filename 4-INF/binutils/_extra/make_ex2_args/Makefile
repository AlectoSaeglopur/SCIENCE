
###
# EXAMPLE #2 - ARGUMENTS
###


## DEFINES ##

# custom define of printf function for flag value
define FLAG_PRINT
$(info >> Flag '${1}' set as '${2}'.)
endef

# custom define of printf function for optimization value
define OPTIMIZ_PRINT
$(info >> Optimization level: ${1}.)
endef



## VARIABLES ##
 
# optimization level (0 by deafult)
OLV = 0

# optimization flag (disabled by deafult)
OFG = false



## INITIALIZATION ##

# print OFG value (can be overrridden from shell)
$(call FLAG_PRINT,OFG,$(OFG))

# if OFG has been overridden to true from shell increase OLV
ifeq ($(OFG),true)
	OLV = 3
endif



## RULES ##

all:
	$(call OPTIMIZ_PRINT,$(OLV))
	@echo Completed!



## NOTES ##

# 0. Run by executing "cls && make all" or "cls && make all OFG=true".
