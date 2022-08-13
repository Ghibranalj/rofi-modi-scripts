##
# Project Title
#
# @file
# @version 0.1

INSTALL_DIR=$(HOME)/.config/rofi-scripts

SCRIPTS=bluetooth pulseaudio

.PHONY: ${SCRIPTS}

${SCRIPTS}:
	rofi -show $@ -modi "$@:${PWD}/$@"

install:
	mkdir -p ${INSTALL_DIR}
	cp ${SCRIPTS} ${INSTALL_DIR}
# end
