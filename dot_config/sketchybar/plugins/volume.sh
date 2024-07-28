#!/bin/bash

LABEL=$(osascript -e 'output volume of (get volume settings)')%
MUTE=$(osascript -e 'output muted of (get volume settings)')

if [[ "$MUTE" = true ]]; then
  ICON="婢"
  LABEL="0%"
else
  ICON="墳"
fi

sketchybar -m --set $NAME label=$LABEL\
                          icon=${ICON}
