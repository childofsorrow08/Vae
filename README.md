# VAE KERNEL - Vae Victis

Developed as a hobby, as well as an opportunity to learn low-level programming and understand how everything works at the low level - **Vae kernel**.

A monolithic kernel that will contain everything necessary for a minimal operating system. I’m not promising much, but I’ll keep adding features as long as I can and want to.

# How to build:
> Note: If you want to test this kernel, you can do this online [here](https://childofsorrow08.github.io/kernel/)!

## Dependencies:

Main dependencies:
- **CMake** 3.25+
- **C compiler** (GCC for Linux, currently unavailable for other OS)
- **NASM** compiler ([nasm.us](https://www.nasm.us/))

If you want to build .iso, you also need this:
- **GRUB**
- **xorriso**

## Building:

1. Clone the repository and navigate to the project directory:
    ```bash
    git clone https://github.com/childofsorrow08/Vae
    cd Vae
    ```
2. Create a build directory and run CMake:
    ```bash
    mkdir build && cd build
    cmake * ..
    cmake --build .
    ```
> Note: Instead of `*`, you can specify the compilation options you need. You can see all compile options [here](docs/BUILDING.md/#1-build-options).

> Note: Also, if you're using NixOS or Nix, [you can use the script to build in the nix-shell](docs/BUILDING.md/#2-nix-package-manager).

# Docs:

## For developers:
- [CONTRIBUTING.md](docs/CONTRIBUTING.md)

## User-related:
- [BUILDING.md](docs/BUILDING.md)

## Other:
- [THANKS.md](docs/THANKS.md)