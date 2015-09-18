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
plugins=(gitfast screen git-extras command-not-found)

# Is virtualenvwrapper installed?
type -p virtualenvwrapper.sh 2>&1 > /dev/null
[ $? -eq 0 ] && plugins+="virtualenvwrapper"

# Do we have Homebrew installed?
[ -n ${BREW_PREFIX} ] && plugins+="brew boot2docker"

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
alias info='info --vi-keys'

# Ubuntu doesn't have wgetpaste so pastebinit is good enough
type -p pastebinit 2>&1 > /dev/null
[ $? -eq 0 ] && alias wgetpaste='pastebinit'

# Work around Ubuntu's ack installation
type -p ack-grep 2>&1 > /dev/null
[ $? -eq 0 ] && alias ack='ack-grep'

# Some utilities like to complain about EDITOR not being set
export EDITOR=vim

# Ruby Gem Home
type -p ruby 2>&1 > /dev/null
if [ $? -eq 0 ]; then
	export GEM_HOME=$(ruby -e 'puts Gem.user_dir')
	# Enable Ruby Gem binaries
	export PATH="${PATH}:${GEM_HOME}/bin"
fi

# Go Path
export GOPATH=${HOME}/go

# Enable Homebrew installed items to come first before system items
# But my overrides to be before that
export PATH="${HOME}/.bin:/usr/local/sbin:/usr/local/bin:${PATH}"
# Enable GOROOT path
export PATH="${PATH}:/usr/local/opt/go/libexec/bin"
# Enable GOPATH path
export PATH="${PATH}:${GOPATH}/bin"

# Enable keychain
type -p keychain 2>&1 > /dev/null
if [ $? -eq 0 ]; then
	keychain --agents gpg,ssh ~/.ssh/id_rsa
	source ~/.keychain/$HOST-sh
	source ~/.keychain/$HOST-sh-gpg
fi

# ensure the passphrase is always requested on the current TTY
export GPG_TTY=$(tty)

# Enable Homeshick
source "$HOME/.homesick/repos/homeshick/homeshick.sh"

# System specific zshrc
[ -e "$HOME/.zshrc.local" ] && source "$HOME/.zshrc.local"
