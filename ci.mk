# This will find all supported boards from the Makefile, and add build targets
# for each. Additionally, the all target will build all targets.
# It is used by the github workflow to test a build on everything.

.PHONY: all test
all:
test:

define build_example_board =
.PHONY: build_$1_$2
cache_$1_$2:
	@echo === Downloading build cache for $1 for $2 ===
	BOARD=$2 $(MAKE) -C examples/$1 download_buildcache
build_$1_$2: cache_$1_$2
	@echo === Building $1 for $2 ===
	BOARD=$2 $(MAKE) -C examples/$1
.PHONY: test_$1_$2
test_$1_$2:
	@echo === Testing $1 for $2 ===
	BOARD=$2 $(MAKE) -C examples/$1 test
build_$1: build_$1_$2
test_$1: test_$1_$2
endef

define build_example =
$(eval BOARDS_$1 := $(shell $(MAKE) describe | grep SUPPORTED_BOARDS | cut -d= -f2))
$(foreach BOARD,$(BOARDS_$1),$(eval $(call build_example_board,$1,$(BOARD))))
.PHONY: build_$1
all: build_$1
.PHONY: test_$1
testall: test_$1
endef

$(foreach EXAMPLE,$(EXAMPLES),$(eval $(call build_example,$(EXAMPLE))))
