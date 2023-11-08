#!/bin/bash
mkdir -p $HOME/.config/nvim
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
    dotfilelink nvim .config/nvim
    dotfilelink gitconfig .gitconfig
    dotfilelink inputrc .inputrc

    dotfilelink config/redshift .config/redshift
    dotfilelink config/fish .config/fish
    dotfilelink config/zathura .config/zathura
    dotfilelink config/rofi .config/rofi
    dotfilelink config/tmux .config/tmux
    dotfilelink config/newsboat .newsboat
    dotfilelink config/xfce4/terminal .config/xfce4/terminal
    dotfilelink config/vifm .config/vifm
    dotfilelink config/userconfig/user-dirs.dirs .config/user-dirs.dirs
    dotfilelink config/userconfig/user-dirs.locale .config/user-dirs.locale

    while true; do
	read -p "Desktop(d), laptop(l) or none(n)?" yn
        case $yn in
            [Dd]* ) installDesktop ; break;;
            [Ll]* ) installLaptop; break;;
	    [Nn]* ) break;;
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
    dotfilelink config/nitrogen/desktop/ .config/nitrogen
    dotfilelink xprofile .xprofile
}

function installLaptop {
    dotfilelink i3/laptop-config .config/i3/config
    dotfilelink config/polybar/polybar-laptop .config/polybar
    dotfilelink config/Xresources/Xresources-laptop .Xresources
    dotfilelink config/nitrogen/laptop/ .config/nitrogen
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
    read -p "Pull in fonts? (y/n)" yn
    case $yn in
        [Yy]* ) installFont; break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done

npm_packages="eslint sass yarn npm typescript"
aur_packages="
    neovim-nightly-bin headsetcontrol \
     spotify vue-cli"
packages="nodejs npm neofetch fzf tree lua ripgrep compton xfce4-terminal rofi nitrogen clipit texlab  polybar" 
if [ $unameS = "Linux" ]; then
    linkAllFiles
    npm -g i $npm_packages
    yay -Syu $aur_packages
    pacman -S $packages 
fi

nvim +PlugInstall +q! +q! +q!
