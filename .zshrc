# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
#export ZSH_THEME="agnoster"
#export ZSH_THEME="amuse"
export ZSH_THEME="bdnelson"

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
plugins=(osx git git-flow ruby rake pow powder xcode gradle)

source $ZSH/oh-my-zsh.sh

# Base system paths
export PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/Applications

# Homebrew
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# rbenv
export PATH=$HOME/.rbenv/shims:$HOME/.rbenv/bin:$PATH
eval "$(rbenv init -)"

# swiftenv
export SWIFTENV_ROOT="$HOME/.swiftenv"
export PATH="$SWIFTENV_ROOT/bin:$PATH"
eval "$(swiftenv init -)"

# pyenv
export PYENV_ROOT=/usr/local/var/pyenv
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

# ANDROID
export ANDROID_SDK_ROOT=/Users/bdnelson/Library/Android/sdk
export ANDROID_HOME=$ANDROID_SDK_ROOT
export PATH=$PATH:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools

# Java
#export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_21.jdk/Contents/Home
#export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_31.jdk/Contents/Home
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_77.jdk/Contents/Home

# Groovy
export GROOVY_HOME=/usr/local/opt/groovy/libexec

# Crashlytics
export CRASHLYTICS_HOME=/usr/local/crashlytics

# Use vim as the pager - of course.
export PAGER=less

# MacTex
export PATH=/usr/texbin:$PATH

# Personal scripts
export PATH=$HOME/bin:$PATH

# Cargo
export PATH=$PATH:$HOME/.cargo/bin

# HomeBrew API Token
export HOMEBREW_GITHUB_API_TOKEN="YOUR_TOKEN_HERE"

# hub.github.com
alias git='hub'

# Colorized Man Pages
man() {
  env \
    LESS_TERMCAP_mb=$(printf "\e[1;31m") \
    LESS_TERMCAP_md=$(printf "\e[1;31m") \
    LESS_TERMCAP_me=$(printf "\e[0m") \
    LESS_TERMCAP_se=$(printf "\e[0m") \
    LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
    LESS_TERMCAP_ue=$(printf "\e[0m") \
    LESS_TERMCAP_us=$(printf "\e[1;32m") \
    man "$@"
}

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
alias mark='open -a Marked\ 2.app'
alias appcode='open -a AppCode.app'
alias lock='/System/Library/CoreServices/Menu\ Extras/user.menu/Contents/Resources/CGSession -suspend'

# Turn on vi
set -o vi

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
