###########
### Zsh ###
###########

### Settings ###
bindkey -v
#autoload -Uz compinit && compinit

### History ###
HISTFILE="$XDG_CACHE_HOME/zsh/history"
HISTSIZE=1000
SAVEHIST=1000

### VCS Info ###
autoload -Uz vcs_info 
precmd() {
  vcs_info
}
setopt prompt_subst
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' unstagedstr '%F{9} ●%f'
zstyle ':vcs_info:*' stagedstr '%F{222} ●%f'  
zstyle ':vcs_info:*' check-for-changes true 
zstyle ':vcs_info:git:*' formats '%m%u%c %F{green} %b%f'

### Prompt ###
PROMPT='%F{blue}%~%f${vcs_info_msg_0_} %F{11}>%f '

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
export PATH="$XDG_LOCAL_HOME/zls:$PATH"
export PATH="/usr/local/opt/llvm/bin:$PATH"

### NPM ###
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export PATH="$XDG_LOCAL_HOME/npm/bin:$PATH"

### OCAML ###
export OPAMROOT="$XDG_DATA_HOME/opam"

### Bun ###
export BUN_INSTALL="$XDG_DATA_HOME/bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export GPG_TTY=$(tty)
export PATH="/usr/local/opt/postgresql@17/bin:$PATH"

export HELIX_RUNTIME=~/Projects/rust/helix/runtime


###############
### Aliases ###
###############

alias cd='z'
alias zvim="nvim $HOME/.zshrc"
alias zsrc="source $HOME/.zshrc"
alias ls='eza'

# Load zoxide
eval "$(zoxide init zsh)"
 # Load fzf
# source <(fzf --zsh)
# # Load fnm
# eval "$(fnm env --use-on-cd --shell zsh)"
# # Load direnv
eval "$(direnv hook zsh)"

