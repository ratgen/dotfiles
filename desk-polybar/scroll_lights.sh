#!/bin/bash

zscroll -l 45 \
  --delay 0.008 \
  --scroll-padding " | " \
  --update-check true "python $HOME/.config/polybar/lights.py -K XPtyaMjGD7f6Liuh 192.168.1.67" &
wait
