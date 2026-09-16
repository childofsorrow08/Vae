set(ARCH "i386" CACHE STRING "Target architecture (i386 or x86_64)")
set_property(CACHE ARCH PROPERTY STRINGS "i386" "x86_64")

message(STATUS "Target architecture selected: ${ARCH}")