# This is a Nix shell environment configuration file
# If you using another linux distro or package mamager,
# you probably don't need this
#
# If you are using Nix, you can build project with this shell
# by running the following script in the project root:
# scripts/nix_build.sh
#
# Note: you need to manually specify compile settings in this script
# if you want to use a different configuration than the default one

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
