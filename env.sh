#!/bin/zsh

# PATH
export PATH="$HOME/bin:/usr/local/go/bin:/usr/local/opt/python/libexec/bin:$PATH"
export VISUAL=nvim
export EDITOR="$VISUAL"
# export PYTHONPATH=$PYTHONPATH
# export MANPATH="/usr/local/man:$MANPATH"

# Virtual Environment
export WORKON_HOME=$HOME/.virtualenvs
# source /usr/local/bin/virtualenvwrapper.sh

# Owner
export USER_NAME="kaj"

# FileSearch
function f() { find . -iname "*$1*" ${@:2} }
function r() { grep "$1" ${@:2} -R . }

#mkdir and cd
function mkcd() { mkdir -p "$@" && cd "$_"; }

# Aliases
alias cppcompile='c++ -std=c++11 -stdlib=libc++'

# Use sublimetext for editing config files
alias zshconfig="nvim ~/.zshrc"
alias envconfig="nvim ~/.env.sh"
alias vimconfig="nvim ~/.vim/.vimrc"

#if [ ! -S ~/.ssh/ssh_auth_sock ]; then
#  eval `ssh-agent`
#  ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock
#fi
#export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock
#ssh-add -l | grep "The agent has no identities" && ssh-add

# Filesystem
alias ..='cd ..'            # Go up one directory
alias ...='cd ../..'        # Go up two directories
alias ....='cd ../../..'    # And for good measure
alias l='ls -lah'   # Long view, show hidden
alias la='ls -AF'   # Compact view, show hidden
alias ll='ls -lFh'  # Long view, no hidden


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
