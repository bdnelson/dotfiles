# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
#ZSH_THEME="agnoster"
export ZSH_THEME="amuse"

export DEFAULT_USER="bdnelson"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(osx git git-flow ruby rails rake pow powder xcode gradle)

source $ZSH/oh-my-zsh.sh

# Base system paths
export PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/Applications

# Homebrew
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# rbenv
export PATH=$HOME/.rbenv/shims:$HOME/.rbenv/bin:$PATH
eval "$(rbenv init -)"

# ANDROID
export ANDROID_SDK_ROOT=/usr/local/android
export ANDROID_HOME=$ANDROID_SDK_ROOT

# Java
#export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_21.jdk/Contents/Home
#export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_31.jdk/Contents/Home
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_40.jdk/Contents/Home

# Groovy
export GROOVY_HOME=/usr/local/opt/groovy/libexec

# Crashlytics
export CRASHLYTICS_HOME=/usr/local/crashlytics

# Use vim as the pager - of course.
export PAGER=vimpager

# MacTex
export PATH=/usr/texbin:$PATH

# Personal scripts
export PATH=$HOME/bin:$PATH

# hub.github.com
alias git='hub'

# No correct
alias knife='nocorrect knife'
alias gem='nocorrect gem'
alias rm='nocorrect rm'
alias cp='nocorrect cp'
alias mv='nocorrect mv'
alias pyhn='nocorrect pyhn'
alias st='nocorrect st'
alias pip='nocorrect pip'
alias json='nocorrect json'

# Aliases
alias be='bundle exec'
alias mark='open -a Marked.app'
alias appcode='open -a AppCode.app'
alias lock='/System/Library/CoreServices/Menu\ Extras/user.menu/Contents/Resources/CGSession -suspend'

# Turn on vi
set -o vi
