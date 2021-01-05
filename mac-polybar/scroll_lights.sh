#!/bin/bash

echo this

zscroll -l 30 \
  --delay 0.1 \
  --scroll 1  \
  --update-check true "python3 $HOME/.config/polybar/lights.py -K XPtyaMjGD7f6Liuh 192.168.1.67" &
wait
