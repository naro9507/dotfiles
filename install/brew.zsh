#!/bin/zsh

if ! command -v brew &>/dev/null; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "Homebrew is ready. Packages are managed by nix-darwin (nix/darwin.nix)."
# Do NOT run 'brew bundle' - nix-darwin manages all packages via darwin-rebuild switch
