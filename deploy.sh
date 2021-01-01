#!/bin/bash

cd

# Install basic commands
DEPS="git vim python-pip exuberant-ctags"
sudo apt update
sudo apt install $DEPS

# Clone this repo
git clone https://github.com/alexAubin/etc ~/etc

# Powerline font
git clone https://github.com/powerline/fonts.git ~/etc/fonts
cd ~/etc/fonts
./install.sh
cd

# Vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/etc/vim/bundle/Vundle.vim
ln -s ~/etc/vim ~/.vim
ln -s ~/etc/vim.conf ~/.vimrc
vim +PluginInstall +qall

# Flake8
sudo pip install flake8
ln -s ~/etc/flake8.conf ~/.flake8

# Misc
echo "source ~/etc/aliases.sh" >> ~/.bashrc
ln -s ~/etc/git.conf ~/.gitconfig
ln -s ~/etc/urxvt.conf ~/.Xdefaults

source ~/.bashrc
