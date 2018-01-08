#/bin/bash
SCRIPT_DIR="$(cd $(dirname $0); pwd)/dotfiles"

mkdir -pm 700 ~/.vim
ln -s ${SCRIPT_DIR}/vimrc ~/.vim/vimrc
ln -s ${SCRIPT_DIR}/gvimrc ~/.vim/gvimrc
