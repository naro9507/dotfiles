#!/bin/zsh

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
