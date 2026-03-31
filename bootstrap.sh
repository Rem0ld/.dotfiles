#!/bin/bash

set -e

DOTFILES_REPO="git@github.com:Rem0ld/dotfiles.git"
DOTFILES_DIR="$HOME/.dotfiles"

echo "=== Dotfiles Bootstrap ==="

# 1. Install Git (Xcode Command Line Tools on mac)
if [[ "$(uname)" == "Darwin" ]]; then
  if ! xcode-select -p &>/dev/null; then
    echo "Installing Xcode Command Line Tools..."
    xcode-select --install
    echo "Press any key once the installation is complete..."
    read -rn 1
  else
    echo "Xcode Command Line Tools already installed"
  fi
else
  if ! command -v git &>/dev/null; then
    echo "Installing git..."
    sudo apt-get update && sudo apt-get install -y git
  else
    echo "Git already installed"
  fi
fi

# 2. Configure Git
if [[ -z "$(git config --global user.name)" ]]; then
  read -rp "Git user name: " git_name
  git config --global user.name "$git_name"
fi

if [[ -z "$(git config --global user.email)" ]]; then
  read -rp "Git email: " git_email
  git config --global user.email "$git_email"
fi

if [[ ! -f "$HOME/.ssh/id_ed25519" ]]; then
  echo "Generating SSH key..."
  ssh-keygen -t ed25519 -C "$(git config --global user.email)"
  eval "$(ssh-agent -s)"
  ssh-add ~/.ssh/id_ed25519
  echo ""
  echo "Add this SSH key to your GitHub account:"
  echo "https://github.com/settings/keys"
  echo ""
  cat ~/.ssh/id_ed25519.pub
  echo ""
  read -rp "Press any key once the key is added to GitHub..." -n 1
  echo ""
fi

# 3. Clone dotfiles repo
if [[ ! -d "$DOTFILES_DIR" ]]; then
  echo "Cloning dotfiles..."
  git clone "$DOTFILES_REPO" "$DOTFILES_DIR"
else
  echo "Dotfiles already cloned at $DOTFILES_DIR"
fi

# 4. Run make_env
cd "$DOTFILES_DIR"
chmod +x make_env.sh

if [[ "$(uname)" == "Darwin" ]]; then
  ./make_env.sh mac install
else
  ./make_env.sh linux install
fi

echo "=== Done! Restart your terminal to apply changes. ==="
