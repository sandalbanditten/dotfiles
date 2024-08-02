#!/bin/zsh

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
	startx -- -keeptty >~/.xorg.log 2>&1
fi
