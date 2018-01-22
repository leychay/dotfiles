#!/bin/bash

#Requirement:
# Install git beforehand so that we can checkout the dotfiles from repo
# To be run as root

# Install Vim-Pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
  curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# Install all vim's plugins that I use.
# Read from vim.plugins file
for i in $(cat vim.plugins); do
  cd ~/.vim/bundle/
  git clone $i
  cd -
done

# Bootstrap typical directories
# mkdir -p ~/projects ~/_utils
mkdir -p ~/_utils

# Install Solarized theme (Konsole || Gnome-Terminal)
mkdir -p ~/_utils/gnome-solarized
if [ "$XDG_CURRENT_DESKTOP" == "KDE" ];
then
  echo 'Konsole'
  cd ~/_utils/gnome-solarized
  git clone https://github.com/phiggins/konsole-colors-solarized.git .
  cd -
  echo "Read further instruction here: https://github.com/phiggins/konsole-colors-solarized"
else
  echo 'Gnome'
  sudo apt-get install dconf-cli
  cd ~/_utils/gnome-solarized
  git clone https://github.com/Anthony25/gnome-terminal-colors-solarized.git .
  cd -
  echo "TODO :: Done cloning gnome-solarized theme in ~/_utils/gnome-solarized/ . Please manually install it yeah?"
  echo "TODO :: Just run ./install.sh or set_dark.sh would do the trick"
fi

# Install FiraCode Font Ligatures (docs: https://github.com/tonsky/FiraCode/wiki)
# create fonts dir
mkdir -p /.local/share/fonts
#
# run installation
for type in Bold Light Medium Regular Retina; do
  wget -O ~/.local/share/fonts/FiraCode-${type}.ttf \
    "https://github.com/tonsky/FiraCode/blob/master/distr/ttf/FiraCode-${type}.ttf?raw=true";
done
#
fc-cache -f

# TODO ::  Install PHP Brew for managing different version of PHP with ease (docs: https://github.com/phpbrew/phpbrew)
# TODO ::  Install Fuzzy Finder
# TODO ::  Install icons-in-terminal
# TODO ::  Install keychain?


# Create Symlink for the dotfiles to home dir
ln -s ~/dotfiles/.bashrc ~/.bashrc
ln -s ~/dotfiles/.bash_aliases ~/.bash_aliases
ln -s ~/dotfiles/.bash_profile ~/.bash_profile
ln -s ~/dotfiles/.bash_prompt ~/.bash_prompt
