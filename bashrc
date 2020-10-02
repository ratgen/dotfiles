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
elif [ $unameS = "Darwin" ]; then
  source /usr/local/Cellar/fzf/0.22.0/shell/key-bindings.bash
  source /usr/local/Cellar/fzf/0.22.0/shell/completion.bash
else
  echo "not a supported system"
fi

## 
if type rg &> /dev/null; then
  export FZF_DEFAULT_COMMAND='rg --files'
  export FZF_DEFAULT_OPTS='-m --height 50% --border'
fi

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
