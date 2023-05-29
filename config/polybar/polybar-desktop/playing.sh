#!/bin/bash

PLAYER="mpv"

if [ "$(pidof "$PLAYER")" != "" ];
then
	echo "$(playerctl metadata --player="$PLAYER" --format "{{ artist }} - {{ title }}")"
else
  if [ "$(pidof "spotify")" != "" ];
  then
	  echo "$(playerctl metadata --player="spotify" --format "{{ artist }} - {{ title }}")"
  else
    if [ "$(pidof "spotifyd")" != "" ];
    then
      echo "$(playerctl metadata --player="spotifyd" --format "{{ artist }} - {{ title }}")"
    else
      echo "No player is running"
    fi
  fi
fi
