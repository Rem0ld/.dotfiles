#!/bin/bash

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" &
PID=$!
wait $PID

result=$?
if [[ $result != 0 ]]; then
	echo "Something wrong happened when installing brew"
	exit 1;
fi

brew install --cask iterm2 brave-browser visual-studio-code obsidian insomnia discord slack bitwarden alfred rectangle font-fira-code-nerd-font &&
brew install git node nvm mysql postgres ripgrep starship docker;

exit 0;
