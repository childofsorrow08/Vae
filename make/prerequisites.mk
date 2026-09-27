# Platform

UNAME_S := $(shell uname -s)
ifneq ($(UNAME_S),Linux)
    $(error [ERROR] VAE kernel can only be built on Linux! Detected OS: $(UNAME_S))
endif


