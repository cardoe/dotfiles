# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.homesick/repos/oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="gentoo"

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
[ -n ${BREW_PREFIX} ] && \
    export VIRTUALENVWRAPPER_PYTHON='/usr/local/bin/python'

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(gitfast screen git-extras command-not-found)

# Is virtualenvwrapper installed?
type -p virtualenvwrapper.sh 2>&1 > /dev/null
[ $? -eq 0 ] && plugins+="virtualenvwrapper"

# Do we have Homebrew installed?
[ -n ${BREW_PREFIX} ] && plugins+="brew"

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
alias info='info --vi-keys'

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

# Enable Homebrew installed items to come first
export PATH="/usr/local/sbin:/usr/local/bin:${PATH}"
# Enable GOROOT path
export PATH="${PATH}:/usr/local/opt/go/libexec/bin"
# Enable GOPATH path
export PATH="${PATH}:${GOPATH}/bin"

export LIBVIRT_DEFAULT_URI="qemu+tcp://swanson.local./system"

export PIP_DOWNLOAD_CACHE=$HOME/Library/Caches/pip-downloads

# Enable Homeshick
source "$HOME/.homesick/repos/homeshick/homeshick.sh"
