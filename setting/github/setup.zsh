#!/bin/zsh

ssh-keygen -t ed25519 -C "naohiro.ishikawa7@gmail.com" -f ~/.ssh/github_ed25519

echo "Done. Add the following public key to your GitHub account:"
cat ~/.ssh/github_ed25519.pub
