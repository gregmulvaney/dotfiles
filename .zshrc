###########
### Zsh ###
###########

### Settings ###
bindkey -v
autoload -Uz compinit && compinit

### History ###
HISTFILE="$XDG_CACHE_HOME/zsh/history"
HISTSIZE=1000
SAVEHIST=1000

### VCS Info ###
autoload -Uz vcs_info 
precmd() { vcs_info }
setopt prompt_subst
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' formats '%F{green}on  %b%m%u%c %f'

### Prompt ###
PROMPT='%F{blue}%~%f ${vcs_info_msg_0_}%F{yellow}>%f '

#################
### Languages ###
#################

### Go ###
export GOPATH="$XDG_LOCAL_HOME/go"
export PATH="$GOPATH/bin":$PATH

### Rust ###
export RUSTUP_HOME="$XDG_LOCAL_HOME/rustup"
export CARGO_HOME="$XDG_LOCAL_HOME/cargo"
export PATH="$CARGO_HOME/bin:$PATH"

### Zig ###
export PATH="$XDG_LOCAL_HOME/zig:$PATH"

### NPM ###
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export PATH="$XDG_LOCAL_HOME/npm/bin":$PATH

###############
### Aliases ###
###############

alias cd='z'
alias zvim="nvim $HOME/.zshrc"
alias zsrc="source $HOME/.zshrc"

# Load zoxide
eval "$(zoxide init zsh)"
# Load fzf
source <(fzf --zsh)
# Load fnm
eval "$(fnm env --use-on-cd --shell zsh)"
# Load direnv
eval "$(direnv hook zsh)"

