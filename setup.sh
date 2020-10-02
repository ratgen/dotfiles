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

dotfilelink init.vim .config/nvim/init.vim
dotfilelink gitconfig .gitconfig
dotfilelink coc-settings.json .config/nvim/coc-settings.json

unameS=$(uname -s)
declare packageManager
packages="neovim nodejs npm neofetch fzf"

if [ $unameS = "Linux" ]; then
  dotfilelink bashrc .bashrc
  if test -f "/etc/arch-release" ; then
    sudo pacman -S --needed $packages fortune-mod
  elif test -f "/etc/debian_version" ; then
    sudo apt install $packages fortune
  else
    echo "no supported package manager"
  source ~/.bashrc
  fi
elif [ $unameS = "Darwin" ]; then
dotfilelink bashrc .bash_profile
  brew install $packages fortune
  echo "done brewing"
  source ~/.bash_profile
else
  echo "not a supported system"
fi

nvim +PlugInstall +q! +q! +q!
sudo npm i -g bash-language-server

