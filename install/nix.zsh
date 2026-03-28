#!/bin/zsh

# Install Nix (single-user mode)
if ! command -v nix &> /dev/null; then
  echo "Installing Nix..."
  curl -L https://nixos.org/nix/install | sh -s -- --no-daemon
  . ${HOME}/.nix-profile/etc/profile.d/nix.sh
fi

# Install packages via Nix
echo "Installing Nix packages..."
nix-env -iA nixpkgs.starship
