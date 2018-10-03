# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

#export ZSH_THEME="bdnelson"
#export ZSH_THEME="candy"
#export ZSH_THEME="dogenpunk"
export ZSH_THEME="bdnelson2"
export DEFAULT_USER="bdnelson"

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(osx git git-flow rails ruby rake gradle)

source $ZSH/oh-my-zsh.sh

# Base system paths
export PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/Applications

# Homebrew
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# rbenv
export PATH=$HOME/.rbenv/shims:$HOME/.rbenv/bin:$PATH
eval "$(rbenv init -)"

# pyenv
export PYENV_ROOT=/usr/local/var/pyenv
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

# ANDROID
export ANDROID_SDK_ROOT=/Users/brian-nelson/Library/Android/sdk
export ANDROID_HOME=$ANDROID_SDK_ROOT
export PATH=$PATH:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools

# Java
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk-10.0.1.jdk/Contents/Home

# Rust
source $HOME/.cargo/env

# NVM
#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Use vim as the pager - of course.
export PAGER=less

# Personal scripts
export PATH=$HOME/bin:$PATH

# HomeBrew API Token
export HOMEBREW_GITHUB_API_TOKEN="TOKEN_GOES_HERE"

# ImageMagick
export PATH="/usr/local/opt/imagemagick@6/bin:$PATH"

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
alias gs='git shorty'

# Turn on vi
set -o vi
