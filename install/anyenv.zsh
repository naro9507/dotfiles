#!/bin/zsh

anyenv install --init
git clone https://github.com/znz/anyenv-update.git $(anyenv root)/plugins/anyenv-update

source ${HOME}/.zshenv

# install env
anyenv install rbenv
anyenv install nodenv
anyenv install goenv
anyenv install pyenv
anyenv update
