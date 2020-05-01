#!/bin/bash

mkdir -p $HOME/.config/nvim/

dotFileDir=$(pwd)

function dotfilelink {
  dest="$HOME/$2"
  
  if [ -h $dest ]; then
    echo "Removing existing symlink"
    rm $dest
  fi

  echo "Creating symlink"
  ln -s $dotFileDir/$1 $dest
}

dotfilelink bashrc  .bashrc
dotfilelink init.vim .config/nvim/init.vim
dotfilelink gitconfig .gitconfig
dotfilelink coc-settings.json .config/nvim/coc-settings.json

unameS=$(uname -s)
declare packageManager
packages="neovim nodejs npm neofetch firefox"

if [ $unameS = "Linux" ]; then
  if test -f "/etc/arch-release" ; then
    sudo pacman -S --needed $packages fortune-mod
  elif test -f "/etc/debian_version" ; then
    sudo apt install $packages fortune
  else
    echo "no supported package manager"
  fi
elif [ $unameS = "Darwin" ]; then
  brew install $packages fortune
  echo "done brewing"
else
  echo "not a supported system"
fi

nvim +PlugInstall +q! +q! +q!
sudo npm i -g bash-language-server
nvim +"CocInstall coc-vimtex" +"CocInstall coc-json" +"CocInstall coc-python" +"CocInstall coc-html" +"CocInstall coc-html" +q! +q!

source ~/.bashrc
