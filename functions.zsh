# General
path_append ()  { path_remove $1; export PATH="$PATH:$1"; }
path_prepend () { path_remove $1; export PATH="$1:$PATH"; }
path_remove ()  { export PATH=`echo -n $PATH | awk -v RS=: -v ORS=: '$0 != "'$1'"' | sed 's/:$//'`; }

# Git
fzf-git-branch-all() {
    git rev-parse HEAD > /dev/null 2>&1 || return

    git branch --color=always --all --sort=-committerdate |
        grep -v HEAD |
        fzf --height 50% --ansi --no-multi --preview-window right:65% \
            --preview 'git log -n 50 --color=always --date=short --pretty="format:%C(auto)%cd %h%d %s" $(sed "s/.* //" <<< {})' |
        sed "s/.* //"
}

fzf-git-checkout() {
    git fetch
    local branch

    branch=$(fzf-git-branch-all)
    if [[ "$branch" = "" ]]; then
        echo "No branch selected."
        return
    fi

    # If branch name starts with 'remotes/' then it is a remote branch. By
    # using --track and a remote branch name, it is the same as:
    # git checkout -b branchName --track origin/branchName
    if [[ "$branch" = 'remotes/'* ]]; then
        git checkout --track $branch
    else
        git checkout $branch;
    fi
}

fzf-git-branch-local() {
    git branch --color=always --sort=-committerdate |
        grep -v HEAD |
        fzf --height 50% --ansi --no-multi --preview-window right:65% \
            --preview 'git log -n 50 --color=always --date=short --pretty="format:%C(auto)%cd %h%d %s" $(sed "s/.* //" <<< {})' |
        sed "s/.* //"
}

fzf-git-multi-branch-local() {
    git branch --color=always --sort=-committerdate |
        grep -v HEAD |
        fzf --height 50% --ansi --multi --preview-window right:65% \
            --preview 'git log -n 50 --color=always --date=short --pretty="format:%C(auto)%cd %h%d %s" $(sed "s/.* //" <<< {})' |
        sed "s/.* //"
}

fzf-git-branch-delete-local() {
    local branches

    branches=($(fzf-git-multi-branch-local))

    if [[ "$branches" = "" ]]; then
        echo "No branches selected."
        return
    fi

    for branch in $branches; do
        git branch -D $branch
    done

}

fzf-git-checkout-local() {
    local branch

    branch=$(fzf-git-branch-local)
    if [[ "$branch" = "" ]]; then
        echo "No branch selected."
        return
    fi

    git checkout $branch
    git pull

    if [[ $1 ]]; then
        git checkout -b $1 $branch
    fi
}

