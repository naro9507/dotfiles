#!/bin/zsh

if [[ ! -d ~/.zplug ]];then
    curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh| zsh
fi

source ~/.zplug/init.zsh

# gitルートにcd
zplug "mollifier/cd-gitroot"

# 移動強化プラグイン
zplug "b4b4r07/enhancd", use:init.sh

# 補完
zplug "zsh-users/zsh-completions"

# 長時間実行するコマンドのバックグラウンド通知
zplug 't413/zsh-background-notify'

# ターミナルを256色表示にする
zplug "chrissicool/zsh-256color"

# 過去に入力したコマンドの履歴が灰色のサジェストで出る
zplug "zsh-users/zsh-autosuggestions"

# Prompt Theme powerlevel10k
zplug "romkatv/powerlevel10k", as:theme, depth:1

# Gitのadd, resetをfzfを使ってやりやすくなるプラグイン
zplug "bigH/git-fuzzy", as:command, use:"bin/git-fuzzy"

# 自身をプラグインとして管理する
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# インストールされてないプラグインをインストール
if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi

# プラグインを読み込みコマンドを$PATHへ追加
zplug load --verbose 1> /dev/null
