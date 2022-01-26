#!/bin/zsh

extensions=(
    4ops.terraform
    alphabotsec.vscode-eclipse-keybindings
    apollographql.vscode-apollo
    benjaminadk.emojis4git
    christian-kohler.npm-intellisense
    chrmarti.regex
    dbaeumer.vscode-eslint
    donjayamanne.githistory
    dsznajder.es7-react-js-snippets
    eamodio.gitlens
    eg2.vscode-npm-script
    erd0s.terraform-autocomplete
    esbenp.prettier-vscode
    fknop.vscode-npm
    formulahendry.auto-close-tag
    formulahendry.auto-rename-tag
    GitHub.vscode-pull-request-github
    golang.go
    Gruntfuggly.todo-tree
    hashicorp.terraform
    henriiik.docker-linter
    herrmannplatz.npm-dependency-links
    IBM.output-colorizer
    ionutvmi.path-autocomplete
    KnisterPeter.vscode-github
    lkytal.FlatUI
    mhutchie.git-graph
    ms-azuretools.vscode-docker
    ms-vscode-remote.remote-containers
    ms-vscode-remote.remote-ssh
    ms-vscode-remote.remote-ssh-edit
    ms-vscode-remote.vscode-remote-extensionpack
    msjsdiag.debugger-for-chrome
    PKief.material-icon-theme
    ritwickdey.LiveServer
    rogalmic.bash-debug
    ryu1kn.partial-diff
    shardulm94.trailing-spaces
    shd101wyy.markdown-preview-enhanced
    TabNine.tabnine-vscode
    TeamHub.teamhub
    wayou.vscode-todo-highlight
    xabikos.ReactSnippets
    yzhang.markdown-all-in-one
    sozercan.slack
    oderwat.indent-rainbow
    xyz.local-history
    cschleiden.vscode-github-actions
    timonwong.shellcheck
    mtxr.sqltools
    mtxr.sqltools-driver-mysql
    mtxr.sqltools-driver-pg
    zxh404.vscode-proto3
    EditorConfig.EditorConfig
    GraphQL.vscode-graphql
    stylelint.vscode-stylelint
    ms-vscode.cpptools
    slevesque.vscode-hexdump
)

for extension in ${extensions[@]}; do
  code --install-extension ${extension} --force
done