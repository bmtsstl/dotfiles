#/bin/bash
DOT="$(cd $(dirname $0); pwd)/dot"

ln --backup --symbolic "${DOT}/bash_profile" ~/.bash_profile
ln --backup --symbolic "${DOT}/bashrc" ~/.bashrc
ln --backup --symbolic "${DOT}/tmux.conf" ~/.tmux.conf

mkdir -pm 700 ~/.vim
ln --backup --symbolic "${DOT}/vimrc" ~/.vim/vimrc
ln --backup --symbolic "${DOT}/gvimrc" ~/.vim/gvimrc
