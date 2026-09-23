# BUILDING.md
> [Return to README.md](../README.md)

## 1. Build options
1) `-DBUILDISO=*` - An option to package the finished .elf file into an .iso file. Possible values: `ON`; `OFF`
2) `-DBUILDIMG=*` - An option to package the finished .elf file into an .img file. Possible values: `ON`; `OFF`
3) `-DBUILDBIN=*` - An option to package the finished .elf file into an .bin file. Possible values: `ON`; `OFF`

## 2. Nix package manager
1) You can use the `scripts/nix_build.sh` script to compile everything within the Nix package manager environment, which automatically installs all dependencies. **Run the script only in the project's root directory**. However, if you want to compile the project using non-standard options, you'll have to edit the script manually.