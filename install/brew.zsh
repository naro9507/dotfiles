#!/bin/zsh

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

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
    ghq
    m4
    zsh-syntax-highlighting
    zsh-history-substring-search
    golangci-lint
    mpdecimal
    grep
    nettle
    gh
    awscli
    jq
    peco
    gibo
    kube-ps1
    lazydocker
    docker
    lazygit
    google-cloud-sdk
    gdb
    libpq
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
    monitorcontrol
    shiftit
    wireshark
    1password
    kindle
    biscuit
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
