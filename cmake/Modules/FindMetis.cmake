# CMake script for finding Metis

# If libraries are already defined, do nothing 
# TODO: disabled for debugging purposes
# IF(METIS_LIBRARIES AND METIS_INCLUDE)
#   RETURN()
# ENDIF()

SET(METIS_FOUND FALSE)

# Try to find Metis
SET(METISINCLUDE 
  "${METISROOT}/include"
  "$ENV{METISROOT}/include"
  "$ENV{METIS_ROOT}/include"
  "$ENV{PARMETISROOT}/include"
  "$ENV{PARMETIS_ROOT}/include"
  "${CMAKE_SOURCE_DIR}/metis/include"
  INTERNAL)

SET(METIS_INCLUDENAME "metis.h" "parmetis.h" INTERNAL)
FIND_PATH(METIS_INCLUDE_DIR
  NAMES
  ${METIS_INCLUDENAME} 
  HINTS 
  ${METISINCLUDE}
  )

SET(METISLIB
  "${METISROOT}/lib"
  "$ENV{METISROOT}/lib"
  "$ENV{METIS_ROOT}/lib"
  "$ENV{PARMETISROOT}/lib"
  "$ENV{PARMETIS_ROOT}/lib"
  "${CMAKE_SOURCE_DIR}/metis/lib"
  INTERNAL)

FIND_LIBRARY(METIS_LIBRARIES 
  metis
  HINTS
  ${METISLIB})

IF (METIS_LIBRARIES AND METIS_INCLUDE_DIR)
  SET(METIS_FOUND TRUE)
ENDIF()

IF (METIS_FOUND) 
  IF (NOT Metis_FIND_QUIETLY)
    MESSAGE(STATUS "A library with Metis API found.")
    MESSAGE(STATUS "Metis include dir: ${METIS_INCLUDE_DIR}")
    MESSAGE(STATUS "Metis libraries: ${METIS_LIBRARIES}")
  ENDIF()
ELSE()
  IF (Metis_FIND_REQUIRED)
    MESSAGE(FATAL_ERROR "Metis libraries not found.")
  ENDIF()
ENDIF()

MARK_AS_ADVANCED(
  METISINCLUDE
  METISLIB
  METIS_INCLUDENAME
  METIS_INCLUDE_DIR 
  METIS_LIBRARIES 
  )