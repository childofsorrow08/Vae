string(TIMESTAMP BUILD_DATE "%d.%m.%Y")
string(TIMESTAMP BUILD_TIME "%H:%M:%S")

set(COMPILER_INFO "${CMAKE_C_COMPILER_ID} ${CMAKE_C_COMPILER_VERSION}")

target_compile_definitions(kernel PRIVATE
    BUILD_DATE="${BUILD_DATE}"
    BUILD_TIME="${BUILD_TIME}"
    COMPILER_INFO="${COMPILER_INFO}"

    # taken from cmake/options/arch.cmake
    ARCH_NAME="${ARCH}" 
)