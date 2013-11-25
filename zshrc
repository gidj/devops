# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"

# Base16 Shell
#BASE16_SCHEME="tomorrow"
#BASE16_SHELL="$HOME/.config/base16-shell/base16-$BASE16_SCHEME.dark.sh"
#[[ -s $BASE16_SHELL ]] && . $BASE16_SHELL

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
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(make django osx virtualenv brew git python tmux)

source $ZSH/oh-my-zsh.sh
#. /usr/local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh
# Customize to your needs...

# Set default user to remove the user@hostname if logged in via regular user:
DEFAULT_USER="gideon"

# Set locale; this fixes the problem in 'agnoster' theme where autocomplete 
# repeats the command it is completing 
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Aliases 
alias ll="ls -alrtFG"
alias lsa="ls -lahF"
alias la="ls -AF"
alias l="ls -CF"
alias m='less'
alias ..='cd ..'
alias ...='cd ..;cd ..'
alias md='mkdir'
alias cl='clear'
alias sicp-racket='racket -ip neil/sicp' 

# 2.4) grep options
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;31' # green for matches

