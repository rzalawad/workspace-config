#!/bin/zsh

kill `pgrep .lsp`

echo "starting kmonad for freebird"
kmonad freebird-kconf.lsp &

dev_file="/dev/input/$(grep -B 1 -A 9 "HHKB" /proc/bus/input/devices | grep -o -E 'event[0-9]+')"
sed -i -e "s:/dev/input/event[0-9]*:$dev_file:g" /home/ridham/hhkb-kconf.lsp
echo "starting kmonad for HHKB with path $dev_file"
kmonad hhkb-kconf.lsp &
