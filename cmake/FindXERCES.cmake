# - Find XERCES
# Find the native XERCES includes and library
# This module defines
#  XERCES_INCLUDE_DIR, where to find acml.h, etc.
#  XERCES_LIBRARIES, the libraries needed to use XERCES.
#  XERCES_FOUND, If false, do not try to use XERCES.
# also defined, but not for general use are
#  XERCES_LIBRARY, where to find the XERCES library.

find_path(XERCES_INCLUDE_DIR /xercesc/util/XercesVersion.hpp
            PATHS   "${XERCES_DIR}"
                    "C:/Program Files (x86)/CodeSynthesis XSD 3.3"
                    "C:/Program Files (x86)/CodeSynthesis XSD 4.0"
                    $ENV{XERCES_ROOT}
            PATH_SUFFIXES include)

if (NOT XERCES_FIND_QUIETLY)
    message(STATUS "XERCES Include Dir ${XERCES_INCLUDE_DIR}")
endif()

if(CMAKE_SIZEOF_VOID_P EQUAL 8) #64bit compilation
    find_library(XERCES_LIBRARY
  NAMES
      xerces-c
      xerces-c_2
      xerces-c_3
      xerces-c_3_1
      xerces-c_3_1_vc100

  PATHS
    "${XERCES_DIR}\\lib"
   $ENV{XERCES_ROOT}/lib
    /usr/local/lib
    /usr/lib
    /usr/lib/x86_64-linux-gnu/
    "C:/Program\ Files\ (x86)/CodeSynthesis\ XSD\ 3.3/bin64"
    "C:/Program\ Files\ (x86)/CodeSynthesis\ XSD\ 3.3/lib64/vc-10.0"
  )

  find_library(XERCES_LIBRARY_DEBUG
  NAMES
      xerces-cD
      xerces-c_2D
      xerces-c_3D
      xerces-c_3_1D
      xerces-c_3_1_vc100D
  PATHS
    "${XERCES_DIR}\\lib"
    /usr/local/lib
    /usr/lib
    /usr/lib/x86_64-linux-gnu/
    "C:/Program\ Files\ (x86)/CodeSynthesis\ XSD\ 3.3/bin64"
    "C:/Program\ Files\ (x86)/CodeSynthesis\ XSD\ 3.3/lib64/vc-10.0"
  )
else()
    find_library(XERCES_LIBRARY
  NAMES
      xerces-c
      xerces-c_2
      xerces-c_3
      xerces-c_3_1
      xerces-c_3_1_vc100
  PATHS
    "${XERCES_DIR}\\lib"
    /usr/local/lib
    /usr/lib
    /usr/lib/x86_64-linux-gnu/
    "C:/Program\ Files\ (x86)/CodeSynthesis\ XSD\ 3.3/bin"
    "C:/Program\ Files\ (x86)/CodeSynthesis\ XSD\ 3.3/lib/vc-10.0"
  )

  find_library(XERCES_LIBRARY_DEBUG
  NAMES
      xerces-cD
      xerces-c_2D
      xerces-c_3D
      xerces-c_3_1D
      xerces-c_3_1_vc100D
  PATHS
    "${XERCES_DIR}\\lib"
    /usr/local/lib
    /usr/lib
    /usr/lib/x86_64-linux-gnu/
    "C:/Program\ Files\ (x86)/CodeSynthesis\ XSD\ 3.3/bin"
    "C:/Program\ Files\ (x86)/CodeSynthesis\ XSD\ 3.3/lib/vc-10.0"
  )
endif()

if (NOT XERCES_FIND_QUIETLY)
  message(STATUS "XERCES Lib Dir ${XERCES_LIBRARY}")
endif()

if (XERCES_LIBRARY AND XERCES_INCLUDE_DIR)
    set(XERCES_LIBRARIES ${XERCES_LIBRARY})
    if(XERCES_LIBRARY_DEBUG)
      set(XERCES_LIBRARIES optimized ${XERCES_LIBRARY} debug ${XERCES_LIBRARY_DEBUG})
    endif()
    set(XERCES_FOUND "YES")
else (XERCES_LIBRARY AND XERCES_INCLUDE_DIR)
  set(XERCES_FOUND "NO")
endif (XERCES_LIBRARY AND XERCES_INCLUDE_DIR)

if (XERCES_FOUND)
   if (NOT XERCES_FIND_QUIETLY)
      message(STATUS "Found XERCES: ${XERCES_LIBRARIES}")
   endif (NOT XERCES_FIND_QUIETLY)
else (XERCES_FOUND)
   if (XERCES_FIND_REQUIRED)
      message(FATAL_ERROR "Could not find XERCES library")
   endif (XERCES_FIND_REQUIRED)
endif (XERCES_FOUND)

# Deprecated declarations.
get_filename_component (NATIVE_XERCES_LIB_PATH ${XERCES_LIBRARY} PATH)

mark_as_advanced(
  XERCES_LIBRARY
  XERCES_LIBRARY_DEBUG
  XERCES_INCLUDE_DIR
  )
