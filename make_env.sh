#!/bin/bash

# Making a script to clear symbolic links or create them for a given environments
# no need to fuss here
# I pass 2 arguments 
# first the env mac or linux (lower, upper we don't care we can handle that)
# second the action clear of link 
# no need for long or short options
# it can be done in a second time in case I forgot how to use it
set -o pipefail -o noclobber -o nounset

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

echo "Will perform $action in env $env"
other="/Users/pielov/Library/Application\ Support/Code/User"

mac_config=(
  "starship.toml"
  "gitui"
  "yabai"
  "skhd"
)

mac_home=(
  ".zshrc"
  "Iterm"
  ".tmux.conf"
)

pathVsCode="Library/Application\ Support/Code/User"
vscode=(
  "VsCode/settings.json"
  "VsCode/keybindings.json"
)

for i in "${mac_config[@]}"; do
  echo "linking $i..."
  ln -s "~/.dotfiles/$i" ~/.config
done

