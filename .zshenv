#!/bin/zsh

# TODO:

#######################################
# General Settings                    #
#######################################
export LANG=ja_JP.UTF-8
export LC_ALL=ja_JP.UTF-8
export TZ=Asia/Tokyo


########################################
# History                              #
########################################
# 履歴ファイルの保存先
HISTFILE=$HOME/.zsh_history
# メモリに保存される履歴の件数
HISTSIZE=10000
# HISTFILE で指定したファイルに保存される履歴の件数
SAVEHIST=10000

#######################################
# golang Settings                     #
#######################################
export GOPATH=$HOME/.anyenv/envs/goenv/shims/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/usr/local/go/bin
export PATH="$HOME/.anyenv/envs/nodenv/bin:$PATH"

#######################################
# anyenv                              #
#######################################
export PATH="$HOME/.anyenv/bin:$PATH"
