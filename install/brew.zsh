#!/bin/zsh

formulas=(
    anyenv
    autoconf
    helm
    openssl
    bdw-gc
    icu4c
    p11-kit
    c-ares
    istioctl
    pcre
    cask
    jansson
    pkg-config
    coreutils
    jemalloc
    postgresql
    docker
    krb5
    kubectx
    readline
    evans
    kubernetes-cli
    ruby-build
    fzf
    libev
    sops
    gdbm
    libevent
    sqlite
    gettext
    libffi
    tcl-tk
    git-flow-avh
    libidn2
    telnet
    gmp
    libtasn1
    unbound
    gnu-getopt
    libtool
    xz
    gnutls
    libunistring
    go
    m4
    golangci-lint
    mpdecimal
    grep
    nettle
    gh
    awscli
    jq
    peco
)

cask_formulas=(
    clipy
    google-chrome
    slack
    dbeaver-community
    google-drive
    sourcetree
    deepl
    google-japanese-ime
    visual-studio-code
    discord
    graphiql
    zoom
    docker
    iterm2
    firefox
    notion
    karabiner-elements
    alfred
    spotify
)

brew upgrade

for formula in ${formulas[@]}; do
  brew install ${formula}
done

for cask_formula in ${cask_formulas[@]}; do
  brew install --cask ${cask_formula}
done

# Remove outdated versions from the cellar.
brew cleanup
