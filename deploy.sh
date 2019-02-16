#/bin/bash
DOTFILES="$(cd $(dirname $0); pwd)/dotfiles"

mkdir -pm 700 ~/.vim
ln --symbolic ${DOTFILES}/vimrc ~/.vim/vimrc
ln --symbolic ${DOTFILES}/gvimrc ~/.vim/gvimrc
