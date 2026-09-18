#include <func/print.h>

void print_build_info() {
    print("==============================\n");
    print("    Welcome to Vae kernel!    \n");
    print("==============================\n");
    print("Build Date:   %s\n", BUILD_DATE);
    print("\n");
    print("C compiler:     %s\n", C_COMPILER_INFO);
    print("NASM compiler:     %s\n", NASM_COMPILER_INFO);
    print("\n");
    print("Architecture: %s\n", ARCH_NAME);
    print("==============================\n");
}