##
# Project Title
#
# @file
# @version 0.1

INSTALL_DIR=$(HOME)/.config/rofi-scripts

SCRIPTS=$(shell find . -maxdepth 1 -type f -executable)

.PHONY: ${SCRIPTS}

${SCRIPTS}:
	rofi -show $@ -modi "$@:${PWD}/$@"

install: install-notification
	mkdir -p ${INSTALL_DIR}
	cp ${SCRIPTS} ${INSTALL_DIR}

install-notification:
	mkdir -p ${INSTALL_DIR}
	cp -r dunst ${INSTALL_DIR}
	cp notification ${INSTALL_DIR}
	./dunst-install.sh ${INSTALL_DIR}/dunst
