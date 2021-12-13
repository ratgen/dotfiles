#!/bin/bash

if [ $1 == 'raise' ] 
then
  pactl set-sink-volume @DEFAULT_SINK@ +2%
elif [ $1 == 'lower' ] 
then
  pactl set-sink-volume @DEFAULT_SINK@ -2%
fi

curvol=$(pactl get-sink-volume @DEFAULT_SINK@)

echo $curvol

notify-send -t 2000 "$curvol"
