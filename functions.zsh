# General
path-append ()  { path-remove $1; export PATH="$PATH:$1"; }
path-prepend () { path-remove $1; export PATH="$1:$PATH"; }
path-remove ()  { export PATH=`echo -n $PATH | awk -v RS=: -v ORS=: '$0 != "'$1'"' | sed 's/:$//'`; }
fzf-history() { print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed -E 's/ *[0-9]*\*? *//' | sed -E 's/\\/\\\\/g') }
emoji() {
    emojis=$(curl -sSL 'https://git.io/JXXO7')
    selected_emoji=$(echo $emojis | fzf | awk '{print $1}')
    echo $selected_emoji
}

# Git
## branch
git-current-branch-name(){
  git branch | grep '^\*' | sed 's/^\* *//'
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

fzf-git-branch-all() {
    git rev-parse HEAD > /dev/null 2>&1 || return

    git branch --color=always --all --sort=-committerdate |
        grep -v HEAD |
        fzf --height 50% --ansi --no-multi --preview-window right:65% \
            --preview 'git log -n 50 --color=always --date=short --pretty="format:%C(auto)%cd %h%d %s" $(sed "s/.* //" <<< {})' |
        sed "s/.* //"
}

## Checkout
fzf-git-checkout-local() {
    local branch

    branch=$(fzf-git-branch-local)
    if [[ "$branch" = "" ]]; then
        echo "No branch selected."
        return
    fi

    git checkout $branch

    if [[ $1 ]]; then
        git checkout -b $1 $branch
    fi
}

fzf-git-checkout() {
    git fetch
    local branch

    branch=$(fzf-git-branch-all)
    if [[ "$branch" = "" ]]; then
        echo "No branch selected."
        return
    fi

    if [[ "$branch" = 'remotes/'* ]]; then
        git checkout --track $branch
    else
        git checkout $branch;
    fi
}

## Branch Delete
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

## Stash
fzf-git-stash-create() {
}

fzf-git-stash-apply() {
}

fzf-git-stash-pop() {
}

fzf-git-stash-drop() {
}

## NPM
npm-run() {
    local file_path
    local script

    file_path=$(find . -name package.json -maxdepth 5 2> /dev/null| grep -v node_modules | fzf -m | awk '{print $1}')
    script=$(cat "$file_path" | jq -r '.scripts | keys[] ' | sort | fzf)
    npm run $(echo "$script") --prefix $(dirname "$file_path")


}

# Chrome
chrome-history() {
    local cols sep google_history open
    cols=$(( COLUMNS / 3 ))
    sep='{::}'

    if [ "$(uname)" = "Darwin" ]; then
        google_history="$HOME/Library/Application Support/Google/Chrome/Default/History"
        open=open
    else
        google_history="$HOME/.config/google-chrome/Default/History"
        open=xdg-open
    fi
    cp -f "$google_history" /tmp/h
    sqlite3 -separator $sep /tmp/h \
        "select substr(title, 1, $cols), url
        from urls order by last_visit_time desc" |
    awk -F $sep '{printf "%-'$cols's  \x1b[36m%s\x1b[m\n", $1, $2}' |
    fzf --ansi --multi | sed 's#.*\(https*://\)#\1#' | xargs $open > /dev/null 2> /dev/null
}

chrome-bookmark() {
    bookmarks_path=~/Library/Application\ Support/Google/Chrome/Default/Bookmarks

    jq_script='
        def ancestors: while(. | length >= 2; del(.[-1,-2]));
        . as $in | paths(.url?) as $key | $in | getpath($key) | {name,url, path: [$key[0:-2] | ancestors as $a | $in | getpath($a) | .name?] | reverse | join("/") } | .path + "/" + .name + "\t" + .url'

    jq -r "$jq_script" < "$bookmarks_path" \
        | sed -E $'s/(.*)\t(.*)/\\1\t\x1b[36m\\2\x1b[m/g' \
        | fzf --ansi \
        | cut -d$'\t' -f2 \
        | xargs open
}