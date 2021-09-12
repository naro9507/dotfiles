# General
alias reload='exec ${SHELL} -l'
alias history='anyframe-widget-put-history'

# エイリアスの設定

# ls（カラー表示）
alias ls="ls -G"
alias ll="ls -lGa"
alias la="ls -laG"

# Git
alias lzg='lazygit'
alias kusa='curl https://github-contributions-api.deno.dev/$(git config user.name).term'
alias gfpo='git push --force-with-lease origin'
alias glbd='git branch -D $(git branch | fzf | awk "{print \$1}")'
alias gbc='git fetch --prune ( git fetch -p )'
alias cdu='cd-gitroot'
alias gadd='cdu && git add $(git diff --name-status | fzf --multi | awk "{print \$2}")'
alias gdis='cdu && git checkout $(git diff --name-status | fzf --multi | awk "{print \$2}")'

# docker
alias lzd='lazydocker'

# gcloud
alias gcpp='gcloud config set project $(gcloud projects list | fzf | awk "{print \$1}")'

# base64
alias encode='function __encode(){ echo -n "$1" | base64 }; __encode'
alias decode='function __decode(){ echo -n "$1" | base64 -d }; __decode'