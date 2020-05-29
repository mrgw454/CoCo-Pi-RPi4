#!/bin/bash
# fbterm-bi: a wrapper script to enable background image with fbterm
# usage: fbterm-bi /path/to/image fbterm-options
echo -ne "\e[?25l" # hide cursor
fbv -cikue "$1" << EOF
q
EOF
shift
export FBTERM_BACKGROUND_IMAGE=1
#exec /usr/bin/fbterm "$@" menu2
exec /usr/bin/fbterm "$@"



