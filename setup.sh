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

if [ -f /etc/os-release ]; then
  . /etc/os-release
  OS=$ID_LIKE
else
  OS=$(uname -r)
fi

echo "Install nvim and coc dependencies"
if [ $OS=="arch" ]; then
  sudo pacman -Syu
  sudo pacman -S --needed neovim node npm
elif [$OS=="debian" ]; then
  sudo apt install neovim
else
  echo "no installtion for this setup file"
fi

nvim +PlugInstall +q! +q! +q!
source ~/.bashrc
