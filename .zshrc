export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=15

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

if [[ $OSTYPE == *"linux"* ]]; then
	ZSH_CUSTOM=/usr/share/zsh
  export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fi

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
	export EDITOR='nvim'
else
	export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"


export PATH="/usr/local/sbin:$PATH"

# MacOs specifics
# ==============
if [[ $OSTYPE == *"darwin"* ]]; then
	# alias docker-compose='/usr/local/bin/docker-compose'
	alias python=/opt/homebrew/opt/python@3.8/bin/python3

	export NVM_DIR="$HOME/.nvm"
	[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh" # This loads nvm
	[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ]

	# alias pip=/opt/homebrew/opt/python@3.9/Frameworks/Python.framework/Versions/3.9/bin/pip
	export PATH="/opt/homebrew/opt/python@3.8/bin:$PATH"

	#determines search program for fzf
	if type ag &>/dev/null; then
		export FZF_DEFAULT_COMMAND='ag -p ~/.gitignore -g ""'
	fi
	#refer rg over ag
	if type rg &>/dev/null; then
		export FZF_DEFAULT_COMMAND='rg --files --hidden --ignore'
	fi

	[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

	# ~/Iterm/Scripts/change_background.py ~/Iterm/Images/Nord-Wallpapers/wallpapers

  export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
  export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
fi

# ALIAS
# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

alias '?'=duck

alias dot='cd ~/.dotfiles'

# == VIM ==
alias vim='nvim'
alias dlvimbak="rm -rf ~/.config/nvim_bak && rm -rf ~/.local/share/nvim_bak && rm -rf ~/.local/state/nvim_bak && rm -rf ~/.cache/nvim_bak"
alias dlvim="rm -rf ~/.config/nvim && rm -rf ~/.local/share/nvim && rm -rf ~/.local/state/nvim && rm -rf ~/.cache/nvim"
alias mvvim="mv ~/.config/nvim ~/.config/nvim_bak && mv ~/.local/share/nvim ~/.local/share/nvim_bak && mv ~/.local/state/nvim ~/.local/state/nvim_bak && mv ~/.cache/nvim ~/.cache/nvim_bak"
alias mvvimbak="mv ~/.config/nvim_bak ~/.config/nvim && mv ~/.local/share/nvim_bak ~/.local/share/nvim && mv ~/.local/state/nvim_bak ~/.local/state/nvim && mv ~/.cache/nvim_bak ~/.cache/nvim"
alias resetvim="dlvim && mvvimbak"

# == Kitty DIFF ==
alias d="kitty +kitten diff"

# == REVOLUGO START ==
alias p='pnpm'
alias pi='pnpm install'
alias pnr='pnpm nx run'
alias revo="cd ~/workspace/revolugo-repos"
alias skarevo="skaffold dev --filename ./skaffold.local.yaml --build-concurrency=1 --cache-artifacts=true --cleanup=true --no-prune=true --digest-source=tag --status-check=false "
alias pnba="pnpm nx run-many --targets=build"
alias pnbsa="pnpm nx run-many --targets=storybook-build"
# == REVOLUGO END ==

# load starship - prompt command line manager
eval "$(starship init zsh)"

autoload -U add-zsh-hook
load-nvmrc() {
	local node_version="$(nvm version)"
	local nvmrc_path="$(nvm_find_nvmrc)"

	if [ -n "$nvmrc_path" ]; then
		local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

		if [ "$nvmrc_node_version" = "N/A" ]; then
			nvm install
		elif [ "$nvmrc_node_version" != "$node_version" ]; then
			nvm use
		fi
	elif [ "$node_version" != "$(nvm version default)" ]; then
		echo "Reverting to nvm default version"
		nvm use default
	fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/pielov/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/pielov/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/pielov/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/pielov/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

export HOMEBREW_GITHUB_API_TOKEN=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

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
