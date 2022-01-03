# A list of all support boards.
# This can be used by yourself as a reminder what your boards are called,
# and is used by the dub generator to generate a set of configurations so
# you can easily select the board you want to target from within your IDE.
SUPPORTED_BOARDS = \
	fri3d-badge-2020-00 \
	ublox_nora_b1_eval

# Sets the default board to compile for.
BOARD ?= fri3d-badge-2020-00

include mcud/mcud.mk
