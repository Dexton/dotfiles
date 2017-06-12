#! /bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ln -sf $DIR/config.reek $HOME/.config.reek
ln -sf $DIR/.gitconfig $HOME/.gitconfig
ln -sf $DIR/nvim $HOME/.config/nvim
ln -sf $DIR/fish $HOME/.config/fish
