# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

export ZSH_THEME="bdnelson2"
export DEFAULT_USER="bdnelson"

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git ruby rails rust)

source $ZSH/oh-my-zsh.sh

# Base system paths
export PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin

# asdf
source $HOME/.asdf/asdf.sh

# Rust
source $HOME/.cargo/env
export RUST_SRC_PATH=$(rustc --print sysroot)/lib/rustlib/src/rust/src/

# Use vim as the pager - of course.
export PAGER=less

# Personal scripts
export PATH=$HOME/bin:$PATH

# Lineage
if [ -d "$HOME/lineage/platform-tools" ] ; then
    PATH="$HOME/lineage/platform-tools:$PATH"
fi
if [ -d "$HOME/lineage/bin" ] ; then
    PATH="$HOME/lineage/bin:$PATH"
fi
export ANDROID_JACK_VM_ARGS="-Dfile.encoding=UTF-8 -XX:+TieredCompilation -Xmx4G"

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

source $HOME/.cargo/env
export RUST_SRC_PATH=$(rustc --print sysroot)/lib/rustlib/src/rust/library/

# Snap
export PATH=/snap/bin:$PATH


# Aliases
alias be='bundle exec'
alias gs='git status'

# Turn on vi
set -o vi
