#line on terminal
PS1='[\D{%d/%m %R} \u\e[01;32m@\h: \e[1;34m\w\e[00m] $ '

#useful aliases
#list all with human size
alias ls='ls --color=auto'
alias la='ls -lah'
#list folders size
alias list='du -cbsh *'
alias python=python3

# fzf 
## bindings and fzf completions 
source /usr/share/fzf/key-bindings.bash
source /usr/share/fzf/completion.bash

## 
if type rg &> /dev/null; then
  export FZF_DEFAULT_COMMAND='rg --files'
  export FZF_DEFAULT_OPTS='-m --height 50% --border'
fi

# use ripgrep for FZF
export FZF_DEFAULT_COMMAND='rg'

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
