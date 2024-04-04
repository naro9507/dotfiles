#!/bin/zsh

# TODO:

#######################################
# General Settings                    #
#######################################
export LANG=ja_JP.UTF-8
export LC_ALL=ja_JP.UTF-8
export TZ=Asia/Tokyo
export GPG_TTY=$TTY

########################################
# History                              #
########################################
# 履歴ファイルの保存先
HISTFILE=$HOME/.zsh_history
# メモリに保存される履歴の件数
HISTSIZE=10000
# HISTFILE で指定したファイルに保存される履歴の件数
SAVEHIST=10000

########################################
# Docker                              #
########################################
export DOCKER_COMFIG=$HOME/.docker


#######################################
# anyenv                              #
#######################################
export PATH=$HOME/.anyenv/bin:$PATH

#######################################
# Golang Settings                     #
#######################################
export GOENV_ROOT=$HOME/.anyenv/envs/goenv
export PATH=$GOENV_ROOT/bin:$PATH
export PATH=$GOROOT/bin:$PATH
export PATH=$PATH:$GOPATH/bin

#######################################
# Ruby Settings                     #
#######################################
export RBENV_ROOT=$HOME/.anyenv/envs/rbenv
export PATH=$RBENV_ROOT/bin:$PATH

#######################################
# Gem Settings                     #
#######################################
export GEM_HOME=$HOME/.gem
export PATH=$GEM_HOME/bin:$PATH

#######################################
# Node Settings                     #
#######################################
export NODEENV_ROOT=$HOME/.anyenv/envs/nodenv
export PATH=$NODEENV_ROOT/bin:$PATH

export CLOUDSDK_PYTHON_SITEPACKAGES=1

#######################################
# Android Studio                      #
#######################################
export PATH=$HOME/Library/Android/sdk/platform-tools:$PATH
