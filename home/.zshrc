# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
ZSH_THEME="gentoo"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

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

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

BREW_PREFIX=$(brew --prefix 2> /dev/null)

# Fix for the plugin below for brewed Python
[ -n ${BREW_PREFIX} ] && \
    export VIRTUALENVWRAPPER_PYTHON='/usr/local/bin/python'

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(gitfast brew virtualenvwrapper terminalapp)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
alias info='info --vi-keys'

# Ruby Gem Home
export GEM_HOME=$(ruby -e 'puts Gem.user_dir')

# Go Path
export GOPATH=${HOME}/go

# Enable Homebrew installed items to come first
export PATH="/usr/local/sbin:/usr/local/bin:${PATH}"
# Enable Ruby Gem binaries
export PATH="${PATH}:${GEM_HOME}/bin"
# Enable GOROOT path
export PATH="${PATH}:/usr/local/opt/go/libexec/bin"
# Enable GOPATH path
export PATH="${PATH}:${GOPATH}/bin"

export LIBVIRT_DEFAULT_URI="qemu+tcp://swanson.local./system"

export PIP_DOWNLOAD_CACHE=$HOME/Library/Caches/pip-downloads

# Enable Homeshick
source "$HOME/.homesick/repos/homeshick/homeshick.sh"
