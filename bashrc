#line on terminal
PS1='[\D{%d/%m %R} \u\e[01;32m@\h: \e[1;34m\w\e[00m] $ \n> '

#useful aliases
#list all with human size
alias la='ls -lah'
#list folders size
alias list='du -cbsh *'
alias python=python3

# fzf 
## bindings and fzf completions 
paths=("/usr/share/doc/fzf/examples/" "/usr/share/fzf/" "/usr/local/Cellar/fzf/0.22.0/shell/")
files=("key-bindings.bash" "completion.bash")

for path in "${paths[@]}"; do
  if test -f "$path${files[0]}"; then
    for file in "${files[@]}"; do
      source $path$file
    done
  fi
done

op(){
  xdg-open "$1"
}

# set nvim as the default editor
VISUAL=nvim;export VISUAL EDITOR=nvim; export EDITOR

##set vi in bash terminal
set -o vi

neofetch --color_blocks off

fortune
