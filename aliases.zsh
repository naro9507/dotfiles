# General
alias reload='exec ${SHELL} -l'
alias history='fzf-history'
alias calc='function __calc(){ echo "$1" | bc }; __calc'
alias gunzip='gzip -dv $(find $HOME/Downloads -name \*.gz -or -name \*.gzip | fzf) | echo '
alias pkill='kill -9 $(lsof -t -i :$1)'

# ls（カラー表示）
alias ls="ls -G"
alias ll="ls -lGa"
alias la="ls -laG"

# Git
alias lzg='lazygit'
alias cb='git-current-branch-name'
alias kusa='curl https://github-contributions-api.deno.dev/naro9507.term'
alias gfp='git push --force-with-lease origin'
alias gbrl='fzf-git-branch-delete-local'
alias gbra='git fetch --prune ( git fetch -p )'
alias gclone='ghq get $1'
alias gbcl='fzf-git-checkout-local'
alias gbcr='fzf-git-checkout'
alias gsl='git stash --list'
alias repo='ghq list -p'
alias repog='ghq get $1'
alias repoc='cd "$(repo | fzf)"'
alias cdgr='cd-gitroot'

# Git Flow
alias gffs='git pull origin develop && git flow feature start $1'
alias gfff='git flow feature finish $(git branch | grep "feature" | fzf --layout=reverse | awk "{print \$2}") | sed "s/feature\///")'
alias gfhs='git pull origin master && git flow hotfix start $1'
alias gfhf='git flow hotfix finish $(git branch | grep "hotfix" | fzf --layout=reverse | awk "{print \$2}" | sed "s/hotfix\///")'
alias gfrs='git pull origin develop && git flow release start $1'
alias gfrf='git pull origin master && git pull origin develop && git flow release finish $(git branch | grep "release" | fzf --layout=reverse | awk "{print \$2}" | sed "s/release\///")'

# NPM
alias npm-run='npm-run'

# Chrome
alias chrome-history='chrome-history'
alias chrome-bookmark='chrome-bookmark'

# docker
alias lzd='lazydocker'
alias dcu='docker compose up -d $@'

# gcloud
alias gcpp='gcloud config set project $(gcloud projects list | fzf --layout=reverse | awk "{print \$1}")'

# base64
alias encode='function __encode(){ echo -n "$1" | base64 }; __encode'
alias decode='function __decode(){ echo -n "$1" | base64 -d }; __decode'