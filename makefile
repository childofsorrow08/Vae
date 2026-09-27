# Copyright (C) 2026 Child of Sorrow
#
# This file is part of VAE kernel.
# VAE kernel is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# Various checks and directory definitions
ROOT_DIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
include $(ROOT_DIR)/make/directories.mk
include $(MAKE_CFG_DIR)/prerequisites.mk

# Sources and definitions
include $(MAKE_CFG_DIR)/bare_sources.mk
include $(MAKE_CFG_DIR)/multiboot_sources.mk
include $(MAKE_CFG_DIR)/definitions.mk
include $(MAKE_CFG_DIR)/flags.mk

# Now we can build our targets
include $(TARGETS_DIR)/x32.mk
include $(TARGETS_DIR)/multiboot_x32.mk
include $(TARGETS_DIR)/x64.mk
include $(TARGETS_DIR)/multiboot_x64.mk

# May be needed
include $(TARGETS_DIR)/clean_x32.mk
include $(TARGETS_DIR)/clean_x64.mk

# DONT USE THIS
# This shit adds targets for GitHub Actions
include $(ROOT_DIR)/.github/webkernel.mk
include $(ROOT_DIR)/.github/release.mk
