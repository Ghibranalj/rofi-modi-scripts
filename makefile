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

install: install-notification
	mkdir -p ${INSTALL_DIR}
	cp ${SCRIPTS} ${INSTALL_DIR}

notification:
	rofi -show $@ -modi "$@:${PWD}/$@"

install-notification:
	mkdir -p ${INSTALL_DIR}
	cp -r dunst ${INSTALL_DIR}
	cp notification ${INSTALL_DIR}
	./dunst-install.sh ${INSTALL_DIR}/dunst
