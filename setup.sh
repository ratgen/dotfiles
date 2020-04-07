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

unameS=$(uname -s)
declare packageManager
packages="neovim nodejs npm neofetch"

if [ $unameS=="Linux" ]
then
  if [ /etc/arch-release ]
  then
    sudo pacman -S --needed $packages fortune-mod
  elif [ /etc/debian_version ]
  then
    sudo apt install $packages fortune
  else
    echo "no supported package manager"
  fi
elif [ $unameS=="Darwin" ]
then
  brew install $packages fortune
else
  echo "not a supported system"
fi

nvim +PlugInstall +q! +q! +q!
source ~/.bashrc
