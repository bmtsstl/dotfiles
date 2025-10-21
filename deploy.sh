#/bin/bash
DOT="$(cd $(dirname $0); pwd)/dot"

ln --backup --symbolic "${DOT}/shellrc" ~/.shellrc
ln --backup --symbolic "${DOT}/tmux.conf" ~/.tmux.conf

mkdir -pm 700 ~/.vim
ln --backup --symbolic "${DOT}/vimrc" ~/.vim/vimrc
ln --backup --symbolic "${DOT}/gvimrc" ~/.vim/gvimrc
