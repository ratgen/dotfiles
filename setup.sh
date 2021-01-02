#!/bin/bash
mkdir -p $HOME/.config/nvim/
mkdir -p $HOME/.config/i3
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
  dotfilelink nvim/init.vim .config/nvim/init.vim
  dotfilelink nvim/cocsettings.vim .config/nvim/cocsettings.vim
  dotfilelink nvim/coc-settings.json .config/nvim/coc-settings.json
  dotfilelink nvim/UltiSnips .config/nvim/UltiSnips

  dotfilelink gitconfig .gitconfig
  dotfilelink inputrc .inputrc

  if [ "$1" == "desk" ]; then
    dotfilelink desk-polybar .config/polybar
    dotfilelink i3/desk-config .config/i3/config
    dotfilelink Xresources-desktop .Xresources
  elif [ "$1" == "mac" ]; then
    dotfilelink mac-polybar .config/polybar
    dotfilelink i3/mac-config .config/i3
    dotfilelink Xresources-mac .Xresources
  fi
}

if [ "$1" = "relink" ]; then
  if [ "$2" = "desk" ]; then
    linkAllFiles $2
    exit
  elif [ "$2" = "mac" ]; then
    linkAllFiles $2
    exit
  else
    linkAllFiles
    exit
  fi
else 
  if [ "$1" = "desk" ]; then
    linkAllFiles $2
    exit
  elif [ "$1" = "mac" ]; then
    linkAllFiles $2
    exit
  else
    linkAllFiles
    exit
  fi
fi

packages="neovim nodejs npm neofetch fzf tree lua ripgrep"
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

