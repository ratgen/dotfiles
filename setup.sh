#!/bin/bash
mkdir -p $HOME/.vim
mkdir -p $HOME/.config/i3
dotFileDir=$(pwd)
unameS=$(uname -s)

function dotfilelink {
    dest="$HOME/$2"
    echo "The destination is " $dest
    if [ -d $dest ]; then
        echo "Removing folder existing symlink"
        rm $dest
    fi
    if [ -f $dest ]; then
        echo "Removing file symlink"
        rm $dest
    fi
    if [ -h $dest ]; then
        echo "Removing symlink"
        rm $dest
    fi
    echo "Creating symlink"
    ln -s $dotFileDir/$1 $dest
}

function linkAllFiles {
    dotfilelink vim/vimrc .vim/vimrc
    dotfilelink vim/UltiSnips .vim/UltiSnips

    dotfilelink gitconfig .gitconfig
    dotfilelink inputrc .inputrc

    dotfilelink config/polybar .config/polybar
    dotfilelink config/zathura .config/zathura
    dotfilelink i3/desk-config .config/i3/config

    dotfilelink zsh/zshrc .zshrc
    dotfilelink config/Xresources .Xresources
}

function installFont {
    mkdir -p ~/.fonts
    cd ~/.fonts
    curl -o IBM_Plex_Mono.zip 'https://fonts.google.com/download?family=IBM%20Plex%20Mono'
    unzip IBM_Plex_Mono
    cd ~/dotfiles
}

if [ "$1" = "relink" ]; then
    linkAllFiles
    exit
fi

while true; do
    read -p "Pull in fonts?" yn
    case $yn in
        [Yy]* ) installFont; break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done

packages="neovim nodejs npm neofetch fzf tree lua ripgrep"
if [ $unameS = "Linux" ]; then
    linkAllFiles
    sudo pacman -S --needed $packages fortune-mod
fi

vim +PlugInstall +q! +q! +q!
sudo npm i -g bash-language-server
