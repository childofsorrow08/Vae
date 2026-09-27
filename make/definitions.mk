BUILD_TIME := $(shell date '+%Y-%m-%d %H:%M:%S')
CC_VERSION := $(shell $(CC) --version | head -n 1)
AS_VERSION := $(shell $(AS) -v 2>&1 | head -n 1)
ARCH ?= x86_64

METADATA_FLAGS := \
    -DBUILD_TIME="\"$(BUILD_TIME)\"" \
    -DCC_VERSION="\"$(CC_VERSION)\"" \
    -DAS_VERSION="\"$(AS_VERSION)\"" \
    -DARCH="\"$(ARCH)\""

