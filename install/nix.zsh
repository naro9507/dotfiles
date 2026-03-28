#!/bin/zsh

DOTFILES_DIR="$(cd "$(dirname "$0")/.." && pwd)"

# Install Nix (Determinate Systems installer - recommended for macOS)
if ! command -v nix &>/dev/null; then
  echo "Installing Nix..."
  curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
  . /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
fi

# Bootstrap nix-darwin or apply config
if ! command -v darwin-rebuild &>/dev/null; then
  echo "Bootstrapping nix-darwin..."
  nix run nix-darwin -- switch --flake "${DOTFILES_DIR}/nix#default" --impure
else
  echo "Applying nix-darwin configuration..."
  darwin-rebuild switch --flake "${DOTFILES_DIR}/nix#default" --impure
fi
