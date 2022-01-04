# This will find all supported boards from the Makefile, and add build targets
# for each. Additionally, the all target will build the application for each
# support board.
# It is used by the github workflow to test a build on everything.

.PHONY: all build test
all: build
build:
test:

define BUILD_board =
.PHONY: build_$1
cache_$1:
	@echo === Downloading build cache for $1 ===
	BOARD=$1 $(MAKE) download_buildcache
build_$1: cache_$1
	@echo === Building for $1 ===
	BOARD=$1 $(MAKE)
.PHONY: test_$1
test_$1:
	@echo === Testing for $1 ===
	BOARD=$1 $(MAKE) test
build: build_$1
test: test_$1
endef #build_board

BOARDS := $(shell $(MAKE) describe | grep SUPPORTED_BOARDS | cut -d= -f2)
$(foreach BOARD,$(BOARDS),$(eval $(call BUILD_board,$(BOARD))))
