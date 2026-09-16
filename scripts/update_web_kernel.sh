# #!/usr/bin/env bash

mkdir -p web/kernel

cp build/kernel.efi web/kernel/kernel.efi
cp build/kernel.iso web/kernel/kernel.iso
cp build/kernel.img web/kernel/kernel.img
cp build/kernel.bin web/kernel/kernel.bin