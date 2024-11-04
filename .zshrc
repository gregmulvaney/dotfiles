###################
### XDG configs ###
###################
export XDG_CONFIG_DIR="$HOME/.config"
export XDG_CACHE_DIR="$HOME/.cache"
export XDG_LOCAL_DIR="$HOME/.local"

###########
### Zsh ###
###########
PROMPT="%F{blue}%~%f %F{yellow}>%f "
HISTFILE="$XDG_CACHE_DIR/zsh/history"
HISTSIZE=1000
SAVEHIST=1000

### Go ###
export GOPATH="$XDG_LOCAL_DIR/go"
export PATH="$GOPATH/bin":$PATH

### Rust ###
export RUSTUP_HOME="$XDG_LOCAL_DIR/rustup"
export CARGO_HOME="$XDG_LOCAL_DIR/cargo"
export PATH="$CARGO_HOME/bin:$PATH"

### NPM ###
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_DIR/npm/npmrc"

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

