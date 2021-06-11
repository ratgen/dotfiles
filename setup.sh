#!/bin/bash
mkdir -p $HOME/.vim
mkdir -p $HOME/.config/i3
dotFileDir=$(pwd)
unameS=$(uname -s)
device="desktop"

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

    dotfilelink config/zathura .config/zathura
    dotfilelink config/rofi .config/rofi
    dotfilelink config/newsboat .newsboat

    while true; do
        read -p "Desktop(d) or laptop(l)?" yn
        case $yn in
            [Dd]* ) installDesktop ; break;;
            [Ll]* ) installLaptop; break;;
            * ) echo "Please answer deskop or laptop.";;
        esac
    done

    dotfilelink zsh/zshrc .zshrc
}

function installDesktop {
    dotfilelink i3/desk-config .config/i3/config
    dotfilelink config/polybar/polybar-desktop .config/polybar
    dotfilelink screenlayout .screenlayout
    dotfilelink config/Xresources/Xresources-desktop .Xresources
}

function installLaptop {
    dotfilelink i3/laptop-config .config/i3/config
    dotfilelink config/polybar/polybar-laptop .config/polybar
    dotfilelink config/Xresources/Xresources-laptop .Xresources
}

function installFont {
    mkdir -p ~/.fonts
    cd ~/.fonts
    curl -o IBM_Plex_Mono.zip 'https://fonts.google.com/download?family=IBM%20Plex%20Mono'
    unzip IBM_Plex_Mono
    curl -o Fontawesome.zip 'https://use.fontawesome.com/releases/v5.15.3/fontawesome-free-5.15.3-desktop.zip'
    unzip Fontawesome
    mv fontawesome-free-5.15.3-desktop/otfs/* .
    rm -rf fontawesome-free-5.15.3-desktop
    rm README.md
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

packages="vim nodejs npm neofetch fzf \
    tree lua ripgrep compton xfce4-terminal \
    brave rofi nitrogen clipit"
aur_packages="vls texlab \
    bash-language-server vim-language-server \
    light"
if [ $unameS = "Linux" ]; then
    linkAllFiles
    pamac install $packages 
fi

vim +PlugInstall +q! +q! +q!
