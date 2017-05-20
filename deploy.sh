#!/bin/bash

# Install basic commands
if command -v apt >/dev/null 2>&1; then
    sudo apt update
    sudo apt install git vim
else
if command -v pacman >/dev/null 2>&1; then
    sudo pacman -Sy
    sudo pacman -S git vim
fi fi

cd

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
ln -s ~/etc/ssh.conf ~/.ssh/config

source ~/.bashrc
