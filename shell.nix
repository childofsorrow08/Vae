{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    # Compiler
    gcc

    # Development tools
    cmake
    gnumake

    # ISO file creation
    grub2
    xorriso
    mtools
  ];
}