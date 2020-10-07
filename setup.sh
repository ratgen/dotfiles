#!/bin/bash
mkdir -p $HOME/.config/nvim/
dotFileDir=$(pwd)
unameS=$(uname -s)

function dotfilelink {
  dest="$HOME/$2"
  if [ -h $dest ]; then
    echo "Removing existing symlink"
    rm $dest
  fi
  echo "Creating symlink"
  ln -s $dotFileDir/$1 $dest
}

function linkAllFiles {
  dotfilelink init.vim .config/nvim/init.vim
  dotfilelink gitconfig .gitconfig
  dotfilelink coc-settings.json .config/nvim/coc-settings.json
  dotfilelink inputrc .inputrc
  if [ $unameS = "Linux" ]; then
    dotfilelink bashrc .bashrc
    source ~/.bashrc
  elif [ $unameS = "Darwin" ]; then
    dotfilelink bashrc .bash_profile
    source ~/.bash_profile
  else
    echo "not a supported system"
  fi 
}

if [ "$1" = "relink" ]; then
  linkAllFiles
  exit
fi

linkAllFiles 

packages="neovim nodejs npm neofetch fzf tree lua"
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
else
  echo "not a supported system"
fi

nvim +PlugInstall +q! +q! +q!
sudo npm i -g bash-language-server

