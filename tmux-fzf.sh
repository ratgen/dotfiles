#!/bin/sh

tmux a -t $(tmux ls | cut -d ' ' -f1 | sed 's/://g' | fzf)
