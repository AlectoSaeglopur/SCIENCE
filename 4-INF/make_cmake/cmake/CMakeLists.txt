
## Check minimum Cmake version required
cmake_minimum_required(VERSION 3.20.0)

## Print custom message on shell
message(" >> Launching CmakeLists.txt...")
message(" >> Cmake version = " ${CMAKE_VERSION})

## Set project name, language and version (just an example here)
project(vkn LANGUAGES C VERSION 17.5.33)

## Set compiler and linker options (NB: "-save-temps" option allows to save the *.i and *.s files as well)
add_compile_options(-Wall -Wextra -D VERBOSE -save-temps)
add_link_options(-Xlinker -Map=${PROJECT_NAME}.map)

## Add source files, compile and link
if (1)
# [v1: source files added automatically]
message(" >> Source files added automatically...")
file(GLOB ${PROJECT_NAME}_lib
    "../*.c"
    "../*.h"
)
add_executable(${PROJECT_NAME} ${${PROJECT_NAME}_lib})

else()
# [v2: source files added manually]
message(" >> Source files added manually...")
add_library(extra_lib ../extra.c ../extra.h)
add_library(convolutional_lib ../convolutional.c ../convolutional.h)
add_library(modulation_lib ../modulation.c ../modulation.h)
add_executable(${PROJECT_NAME} ../main.c)
target_link_libraries(${PROJECT_NAME} extra_lib convolutional_lib modulation_lib)
endif()


