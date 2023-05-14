INCLUDE(FindPkgConfig)
PKG_CHECK_MODULES(PC_ZVKN zVKN)

FIND_PATH(
    ZVKN_INCLUDE_DIRS
    NAMES zVKN/api.h
    HINTS $ENV{ZVKN_DIR}/include
        ${PC_ZVKN_INCLUDEDIR}
    PATHS ${CMAKE_INSTALL_PREFIX}/include
          /usr/local/include
          /usr/include
)

FIND_LIBRARY(
    ZVKN_LIBRARIES
    NAMES gnuradio-zVKN
    HINTS $ENV{ZVKN_DIR}/lib
        ${PC_ZVKN_LIBDIR}
    PATHS ${CMAKE_INSTALL_PREFIX}/lib
          ${CMAKE_INSTALL_PREFIX}/lib64
          /usr/local/lib
          /usr/local/lib64
          /usr/lib
          /usr/lib64
)

INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(ZVKN DEFAULT_MSG ZVKN_LIBRARIES ZVKN_INCLUDE_DIRS)
MARK_AS_ADVANCED(ZVKN_LIBRARIES ZVKN_INCLUDE_DIRS)

