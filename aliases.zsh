# General
alias reload='exec ${SHELL} -l'
alias history='anyframe-widget-put-history'
alias calc='function __calc(){ echo "$1" | bc }; __calc'
alias gunzip='gzip -dv $(find $HOME/Downloads -name \*.gz -or -name \*.gzip | fzf) | echo '

# ls（カラー表示）
alias ls="ls -G"
alias ll="ls -lGa"
alias la="ls -laG"

# Git
alias lzg='lazygit'
alias kusa='curl https://github-contributions-api.deno.dev/$(git config user.name).term'
alias gfp='git push --force-with-lease origin'
alias gbrl='git branch -D $(fzf-git-branch-local)'
alias gbra='git fetch --prune ( git fetch -p )'
alias gclone='ghq get $1'
alias gbs='fzf-git-checkout-local'
alias gbcl='fzf-git-checkout-local'
alias gbcr='fzf-git-checkout'
alias gadd='cdgr && git add $(git diff --name-status | fzf --multi | awk "{print \$2}")'
alias gdis='cdgr && git checkout $(git diff --name-status | fzf --multi | awk "{print \$2}")'
alias gsl='git stash --list'
alias repo='ghq list -p'
alias repoc='cd "$(repo | fzf)"'
alias cdgr='cd-gitroot'


# Git Flow
alias gffs='git flow feature start $1'
alias gfff='git flow feature finish $(git branch | grep "feature" | fzf | awk "{print \$2}") | sed "s/feature\///")'
alias gfhs='git flow hotfix start $1'
alias gfhf='git flow hotfix finish $(git branch | grep "hotfix" | fzf | awk "{print \$2}" | sed "s/hotfix\///")'

# docker
alias lzd='lazydocker'
alias dcu='docker compose up -d $@'

# gcloud
alias gcpp='gcloud config set project $(gcloud projects list | fzf | awk "{print \$1}")'

# base64
alias encode='function __encode(){ echo -n "$1" | base64 }; __encode'
alias decode='function __decode(){ echo -n "$1" | base64 -d }; __decode'