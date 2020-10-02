#line on terminal
PS1='[\D{%d/%m %R} \u\e[01;32m@\h: \e[1;34m\w\e[00m] $ '

#useful aliases
#list all with human size
alias la='ls -lah'
#list folders size
alias list='du -cbsh *'
alias python=python3

unameS=$(uname -s)
# fzf 
## bindings and fzf completions 
if [ $unameS = "Linux" ]; then
  source /usr/share/fzf/key-bindings.bash
  source /usr/share/fzf/completion.bash
  LS_COLORS=$LS_COLOR:'di=1;37:' ; export LS_COLORS
elif [ $unameS = "Darwin" ]; then
  source /usr/local/Cellar/fzf/0.22.0/shell/key-bindings.bash
  source /usr/local/Cellar/fzf/0.22.0/shell/completion.bash
else
  echo "not a supported system"
fi

op(){
  xdg-open "$1"
}

# set nvim as the default editor
VISUAL=nvim;export VISUAL EDITOR=nvim; export EDITOR

##set vi in bash terminal
set -o vi

neofetch --color_blocks off

fortune
