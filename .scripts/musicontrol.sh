#!/bin/bash

NEXT=""
PLAY="喇"
PAUSE=""
PREV="丹"
PLAYER=""
[[ "`mpc | wc -l`" == "3" ]] && MPD=`mpc | head -n1 | cut -c 1-30` || MPD=`echo "No Music Playing"`
ICON=`[ "$(mpc | grep playing)" = "" ] && echo $PLAY || echo $PAUSE`
RES=`echo "$PLAYER|$PREV|$ICON|$NEXT" | rofi -dmenu -p "$MPD" -sep "|" -theme music -monitor -1`
[ "$RES" = "$PLAY" ]  && mpc toggle
[ "$RES" = "$PAUSE" ] && mpc toggle
[ "$RES" = "$PREV" ]  && mpc prev
[ "$RES" = "$NEXT" ]  && mpc next
[ "$RES" = "$PLAYER" ]  && urxvt -name "music_player" -e ncmpcpp
