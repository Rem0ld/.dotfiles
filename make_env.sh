#!/bin/bash

set -o pipefail -o noclobber -o nounset

prompt_theme=".oh-my-zsh/themes/robbyrussell.zsh-theme"
config=(
  "config/starship.toml"
  "config/gitui"
  "config/yabai"
  "config/skhd"
  "config/nvim"
  "config/kitty"
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
  echo "env should be mac or linux"
  exit 1
fi

regex_action='^link$|^clear$'
if [[ ! $action =~ $regex_action ]]; then
  echo "action should be link or clear"
  exit 1
fi

if [[ $action == 'clear' ]]; then
  for i in "${config[@]}"; do
    unlink ~/$i
  done
  for i in "${home[@]}"; do
    unlink ~/$i
  done
  for i in "${linux_config[@]}"; do
    unlink ~/$i
  done

  echo "unlinked"
  exit 0
fi

case $env in
  mac)
    for i in "${config[@]}"; do
      echo "linking $i..."
      ln -sf ~/.dotfiles/$i ~/.config
    done

    for i in "${home[@]}"; do
      echo "linking $i..."
      ln -sf ~/.dotfiles/$i ~
    done

    ln -sf ~/.dotfiles/"$prompt_theme" ~/.oh-my-zsh/themes
    ln -sf ~/.dotfiles/Code/settings.json ~/Library/Application\ Support/Code/User
    ln -sf ~/.dotfiles/Code/keybindings.json ~/Library/Application\ Support/Code/User
  ;;
  linux)
    for i in "${config[@]}"; do
      echo "linking $i..."
      ln -sf ~/.dotfiles/$i ~/.config
    done

    for i in "${home[@]}"; do
      echo "linking $i..."
      ln -sf ~/.dotfiles/$i ~
    done

    for i in "${linux_config[@]}"; do
      echo "linking $i..."
      ln -sf ~/.dotfiles/$i ~/.config
    done

    ln -sf ~/.dotfiles/$prompt_theme ~/"$prompt_theme"
  ;;
esac

