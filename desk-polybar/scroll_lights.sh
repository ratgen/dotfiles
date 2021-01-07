#!/bin/bash

zscroll --length=30 \
  --delay 0.2 \
  --scroll-padding " | " \
  --update-check true "python $HOME/.config/polybar/lights.py -K XPtyaMjGD7f6Liuh 192.168.1.67" &
wait
