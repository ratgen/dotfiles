#line on terminal
if [ "$SSH_TTY" ]
then
  PS1='[\D{%d/%m %R} \u\e[01;32m@\h: \e[1;34m\w\e[00m] $ '

  #useful aliases
  #list all with human size
  alias ls='ls --color=auto'
  alias la='ls -lah'
  #list folders size
  alias list='du -cbsh *'
  alias python=python3

  op(){
    xdg-open "$1"
  }
  # set vim as the default editor
  VISUAL=nvim;export VISUAL EDITOR=nvim; export EDITOR

  #set the colors of ls
  LS_COLORS=$LS_COLOR:'di=1;37:' ; export LS_COLORS

  #set vi in bash terminal
  set -o vi

  neofetch --color_blocks off

  fortune
fi
