#!/bin/bash

mkdir -p web/kernel

cp build/kernel.elf web/kernel/kernel.elf
cp build/kernel.iso web/kernel/kernel.iso
cp build/kernel.img web/kernel/kernel.img
cp build/kernel.bin web/kernel/kernel.bin