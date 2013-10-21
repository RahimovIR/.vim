#!/bin/sh

cd ~
sudo apt-get install -y git
git clone https://github.com/RahimovIR/.vim.git ~/vim.git
cd ~/vim.git && mkdir bundle
git clone https://github.com/gmarik/vundle.git bundle/vundle
ln -s ~/vim.git ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc
vim -c BundleInstall -c qa
