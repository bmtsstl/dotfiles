#/bin/bash
DOTFILES="$(cd $(dirname $0); pwd)/dotfiles"

ln --backup --symbolic "${DOTFILES}/bash_profile" ~/.bash_profile
ln --backup --symbolic "${DOTFILES}/bashrc" ~/.bashrc
ln --backup --symbolic "${DOTFILES}/tmux.conf" ~/.tmux.conf

mkdir -pm 700 ~/.vim
ln --backup --symbolic "${DOTFILES}/vimrc" ~/.vim/vimrc
ln --backup --symbolic "${DOTFILES}/gvimrc" ~/.vim/gvimrc
