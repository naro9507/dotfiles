#!/bin/zsh

anyenv install --init

source ${HOME}/.zshenv

# install env
anyenv install rbenv
anyenv install nodenv
anyenv install goenv
anyenv install pyenv
anyenv update

source ${HOME}/.zshenv

