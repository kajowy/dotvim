# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

export LANG=en_US.UTF-8
export LANGUAGE=en_US:en
export LC_CTYPE=en_US.UTF-8
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_PAPER="en_US.UTF-8"
export LC_NAME="en_US.UTF-8"
export LC_ADDRESS="en_US.UTF-8"
export LC_TELEPHONE="en_US.UTF-8"
export LC_MEASUREMENT="en_US.UTF-8"
export LC_IDENTIFICATION="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

export HISTFILE=~/.zsh_history
export SAVEHIST=1000000000
export HISTSIZE=1000000000

#Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="muse"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
#HIST_STAMPS="dd.mm.yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git colorize github jira vagrant virtualenv pip python brew macos iterm2 zsh-completions zsh-autosuggestions)

# User configuration

# export PATH="/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
# export MANPATH="/usr/local/man:$MANPATH"
export PATH=/opt/homebrew/bin:$PATH:/opt/homebrew/bin
source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#alias vim="/usr/local/bin/vim"
#alias vi="/usr/local/bin/vim"
alias k="k9s --kubeconfig ~/.kube/config-tunnel"
alias g="git"
alias vi="nvim"
alias vim="nvim"
alias top="top -o cpu"

alias rai-multi-tunnel="/Users/rafal.molak/scripts/multi-tunnel.sh --profile reedai --prod-profile reedai-prod"
alias rai-set-version="/Users/rafal.molak/scripts/set_version.sh"
alias rai-sync-envs="/Users/rafal.molak/scripts/sync_envs.sh"
alias rai-tunnel="/Users/rafal.molak/git/rai-infra/aws-vpc-tunnel.sh"
alias rai-envs-drifter="KUBECONFIG=~/.kube/config-tunnel /Users/rafal.molak/scripts/envs_drifter.sh"
alias rai-pr-details="/Users/rafal.molak/scripts/rai-pr-details.sh"
alias rai-trivy-scan="/Users/rafal.molak/scripts/scan_k8s.sh -n rai -e rai-populate-db,rai-postcodesio-db,rai-postcodesio-api,rai-match-calculator,rai-db-update"

alias kdev="kubectl --kubeconfig ~/.kube/config-tunnel --context dev"
alias ktest="kubectl --kubeconfig ~/.kube/config-tunnel --context test"
alias kuat="kubectl --kubeconfig ~/.kube/config-tunnel --context uat"

alias kprod="kubectl --kubeconfig ~/.kube/config-tunnel --context prod"

source ~/.env.sh


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh
# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"

if [[ -n "$PS1" && -z "$NVIM" ]]; then
  [ -s "$BASE16_SHELL/profile_helper.sh" ] && source "$BASE16_SHELL/profile_helper.sh"
fi
        
if [ $commands[kubectl] ]; then
  source <(kubectl completion zsh)
fi

export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
eval "$(/opt/homebrew/bin/brew shellenv)"

export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"
export PATH="/opt/homebrew/opt/bc/bin:$PATH"
export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
export PIPENV_PYTHON="$PYENV_ROOT/shims/python"

plugin=(
  pyenv
)

export PYTHON3_HOST_PROG=~/.venvs/nvim/bin/python
export PYENV_ROOT="$HOME/.pyenv"

[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"
eval "$(pyenv virtualenv-init -)"
eval "$(saml2aws --completion-script-zsh)"

export PRE_COMMIT_COLOR=always

# FZF file search with Ctrl+F
bindkey -r '^F'               # usuwamy ewentualne poprzednie mapowanie
bindkey '^F' fzf-file-widget

fzf_ag() {
  local query file
  query=$(printf "" | fzf --prompt='Ag search: ' --print-query --no-sort --no-preview --height=10%)
  [[ -z "$query" ]] && return

  file=$(ag --nobreak --nonumbers "$query" \
    | fzf --ansi \
          --preview "bat --style=numbers --color=always {1} || cat {1}" \
          --delimiter ':' \
          --preview-window=right:60%) \
    && nvim "$(echo "$file" | cut -d':' -f1)"
}


fzf_ag_widget() {
  zle -I
  fzf_ag
  zle reset-prompt
}
zle -N fzf_ag_widget
bindkey '^G' fzf_ag_widget

# Added by Windsurf
export PATH="/Users/rafal.molak/.codeium/windsurf/bin:$PATH"

export DOCKER_HOST=unix:///Users/rafal.molak/.colima/default/docker.sock

# Python scripts with dedicated environment
rai-sync-envs-py() {
    (cd ~/scripts && pyenv exec python sync_envs.py "$@")
}

rai-queues() {
    (cd ~/scripts && pyenv exec python queues.py "$@")
}

rai-test-sync-envs() {
    (cd ~/scripts && pyenv exec python -m pytest test_sync_envs.py "$@")
}
alias gspa="git stash && git pull && git stash apply"
unalias gg 2>/dev/null
function gg() { git branch --set-upstream-to=origin/$(git branch --show-current) 2>/dev/null; git pull; }
export DOCKER_HOST=unix:///Users/rafal.molak/.colima/default/docker.sock
export PATH="/Users/rafal.molak/.local/bin:$PATH"



export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"
export PATH="/opt/homebrew/opt/curl/bin:$PATH"
