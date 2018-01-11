#/bin/bash
DOTFILES="$(cd $(dirname $0); pwd)/dotfiles"

mkdir -pm 700 ~/.vim
ln -s ${DOTFILES}/vimrc ~/.vim/vimrc
ln -s ${DOTFILES}/gvimrc ~/.vim/gvimrc
