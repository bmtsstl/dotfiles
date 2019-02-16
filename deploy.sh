#/bin/bash
DOTFILES="$(cd $(dirname $0); pwd)/dotfiles"

mkdir -pm 700 ~/.vim
ln --backup --symbolic "${DOTFILES}/vimrc" ~/.vim/vimrc
ln --backup --symbolic "${DOTFILES}/gvimrc" ~/.vim/gvimrc
