##
# Project Title
#
# @file
# @version 0.1

INSTALL_DIR=$(HOME)/.config/rofi-scripts

SCRIPTS=bluetooth

.PHONY: all

all:
	rofi -show blue -modi "blue:${PWD}/bluetooth-modi"

install:
	mkdir -p ${INSTALL_DIR}
	cp ${SCRIPTS} ${INSTALL_DIR}/bluetooth-modi
# end
