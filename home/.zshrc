# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.homesick/repos/oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="bira"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

BREW_PREFIX=$(brew --prefix 2> /dev/null)

# Fix for the plugin below for brewed Python
export VIRTUALENVWRAPPER_PYTHON="${BREW_PREFIX:-/usr}/bin/python"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git screen git-extras command-not-found docker cargo pass poetry)

# Is virtualenvwrapper installed?
type -p virtualenvwrapper.sh 2>&1 > /dev/null
[ $? -eq 0 ] && plugins+="virtualenvwrapper"

# Do we have Homebrew installed?
[ -n ${BREW_PREFIX} ] && plugins+="brew"

# Go Path
export GOPATH=${HOME}/work/go

# Enable Homebrew installed items to come first before system items
# But my overrides to be before that
export PATH="${HOME}/.bin:/usr/local/sbin:/usr/local/bin:${PATH}"
# Enable Cargo install path
export PATH="${PATH}:${HOME}/.cargo/bin"
# Enable GOROOT path
export PATH="${PATH}:/usr/local/opt/go/libexec/bin"
# Enable GOPATH path
export PATH="${PATH}:${GOPATH}/bin"

# Python 3 bits in PATH
type -p python3 2>&1 > /dev/null
[ $? -eq 0 ] && export PATH="$(python3 -m site --user-base)/bin:${PATH}"
# Python bits in PATH as a fall back
type -p python 2>&1 > /dev/null
[ $? -eq 0 ] && export PATH="${PATH}:$(python -m site --user-base)/bin"
# Poetry too
export PATH="$HOME/.poetry/bin:${PATH}"
# Python 3 first
export PATH="/usr/local/opt/python/libexec/bin:${PATH}"

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
alias info='info --vi-keys'

# tweak less
# - don't mess with the termcap stuff
# - behave like cat for less than a page
# - colorize
export LESS='-XFR'

# Ubuntu doesn't have wgetpaste so pastebinit is good enough
type -p pastebinit 2>&1 > /dev/null
[ $? -eq 0 ] && alias wgetpaste='pastebinit'

# ripgrep is my new jam
type -p rg 2>&1 > /dev/null
[ $? -eq 0 ] && alias ag='rg' || alias rg='ag'

# exa over ls
type -p exa 2>&1 > /dev/null
[ $? -eq 0 ] && alias ls='exa' || alias exa='ls'

# bat over cat
type -p bat 2>&1 > /dev/null
[ $? -eq 0 ] && alias cat='bat' || alias bat='cat'

# colordiff over diff
type -p colordiff 2>&1 > /dev/null
[ $? -eq 0 ] && alias diff='colordiff'

# Some utilities like to complain about EDITOR not being set
export EDITOR=vim
alias vi=vim

# modern Docker
export DOCKER_BUILDKIT=1

# Ruby Gem Home
type -p ruby 2>&1 > /dev/null
if [ $? -eq 0 ]; then
	export GEM_HOME=$(ruby -e 'puts Gem.user_dir')
	# Enable Ruby Gem binaries
	export PATH="${PATH}:${GEM_HOME}/bin"
fi

# Node bits
export PATH="${PATH}:${HOME}/.node/bin"

# Brewfile
alias brew-save='brew bundle dump --force --global'
alias brew-check='brew bundle check --global'

# Enable keychain
type -p keychain 2>&1 > /dev/null
if [ $? -eq 0 ]; then
	# find keys that start with id but don't end in .pub
	local keyfiles=$(find $HOME/.ssh/ -name 'id*' -a ! -name '*.pub')
	eval $(keychain --eval --agents gpg,ssh --inherit any-once "${keyfiles}")
	unset keyfiles
fi

# ensure the passphrase is always requested on the current TTY
export GPG_TTY=$(tty)

# Enable Homeshick
source "$HOME/.homesick/repos/homeshick/homeshick.sh"

# System specific zshrc
[ -e "$HOME/.zshrc.local" ] && source "$HOME/.zshrc.local"

# Enable syntax highlighting which must come last
ZSH_HL="$HOME/.homesick/repos/zsh-syntax-highlighting/"
[ -e "${ZSH_HL}/zsh-syntax-highlighting.zsh" ] && \
    source "${ZSH_HL}/zsh-syntax-highlighting.zsh"
unset ZSH_HL

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
