#!/bin/bash

set -o pipefail -o noclobber -o nounset

DOTFILES_DIR="$HOME/.dotfiles"

prompt_theme=".oh-my-zsh/themes/robbyrussell.zsh-theme"
config=(
  "config/starship.toml"
  "config/gitui"
  "config/yabai"
  "config/skhd"
  "config/nvim"
  "config/kitty"
  "config/wezterm"
)
home=(
  ".zshrc"
  "Iterm"
  ".tmux.conf"
  ".xinitrc"
  "bin"
)
linux_config=(
  "config/i3"
  "config/polybar"
)

env=$1
action=${2:-link}

regex_env='^mac$|^linux$'
if [[ ! $env =~ $regex_env ]]; then
  echo "Usage: $0 <mac|linux> [link|clear|install]"
  echo "  link    - symlink dotfiles (default)"
  echo "  clear   - remove symlinks"
  echo "  install - full setup: install packages + symlinks (brew on mac)"
  exit 1
fi

regex_action='^link$|^clear$|^install$'
if [[ ! $action =~ $regex_action ]]; then
  echo "action should be link, clear, or install"
  exit 1
fi

if [[ $action == 'clear' ]]; then
  for i in "${config[@]}"; do
    unlink ~/"$i" 2>/dev/null
  done
  for i in "${home[@]}"; do
    unlink ~/"$i" 2>/dev/null
  done
  if [[ $env == 'linux' ]]; then
    for i in "${linux_config[@]}"; do
      unlink ~/"$i" 2>/dev/null
    done
  fi

  echo "unlinked"
  exit 0
fi

install_brew() {
  if ! command -v brew &>/dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  else
    echo "Homebrew already installed"
  fi

  echo "Installing packages from Brewfile..."
  brew bundle install --file="$DOTFILES_DIR/Brewfile"

  if [[ -f "$DOTFILES_DIR/Brewfile_personal" ]]; then
    read -rp "Install personal Brewfile too? [y/N] " answer
    if [[ $answer =~ ^[Yy]$ ]]; then
      brew bundle install --file="$DOTFILES_DIR/Brewfile_personal"
    fi
  fi
}

link_config() {
  mkdir -p ~/.config

  for i in "${config[@]}"; do
    echo "linking $i..."
    ln -sf "$DOTFILES_DIR/$i" ~/.config
  done

  for i in "${home[@]}"; do
    echo "linking $i..."
    ln -sf "$DOTFILES_DIR/$i" ~
  done
}

case $env in
  mac)
    if [[ $action == 'install' ]]; then
      install_brew
    fi

    link_config
    ln -sf "$DOTFILES_DIR/$prompt_theme" ~/.oh-my-zsh/themes
    ln -sf "$DOTFILES_DIR/Code/settings.json" ~/Library/Application\ Support/Code/User
    ln -sf "$DOTFILES_DIR/Code/keybindings.json" ~/Library/Application\ Support/Code/User
  ;;
  linux)
    if [[ $action == 'install' ]]; then
      echo "Skipping package installation on linux (no brew). Install packages manually."
    fi

    link_config
    for i in "${linux_config[@]}"; do
      echo "linking $i..."
      ln -sf "$DOTFILES_DIR/$i" ~/.config
    done
    ln -sf "$DOTFILES_DIR/$prompt_theme" ~/"$prompt_theme"
  ;;
esac

