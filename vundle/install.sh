#!/bin/sh
#
# Vundle

if [ ! -d "$HOME/.vim/bundle" ]; then
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

vim +PluginInstall +qall
