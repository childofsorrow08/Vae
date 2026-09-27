; Copyright (C) 2026 Child of Sorrow
;
; This file is part of VAE kernel.
; VAE kernel is free software: you can redistribute it and/or modify
; it under the terms of the GNU General Public License as published by
; the Free Software Foundation, either version 3 of the License, or
; (at your option) any later version.

[BITS 32]
section .uefi_boot
	global _uefi_start32

_uefi_start32:
	cli
