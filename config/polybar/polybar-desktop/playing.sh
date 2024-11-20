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
      if [ "$(pidof "firefox")" != "" ]; then
        # Check if Firefox is actually playing something by looking for non-empty title
        TITLE="$(playerctl metadata --player=firefox --format "{{ title }}")"
        if [ -n "$TITLE" ]; then
          echo "$(playerctl metadata --player="firefox" --format "{{ artist }} - {{ title }}")"
        else
          echo "Firefox is running but no media is playing"
        fi
      else
        echo "No player is running"
      fi
    fi
    fi
  fi
fi
