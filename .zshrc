# Add deno completions to search path
if [[ ":$FPATH:" != *":/Users/gregmulvaney/.zsh/completions:"* ]]; then export FPATH="/Users/gregmulvaney/.zsh/completions:$FPATH"; fi
### XDG style config for macOS ###
export XDG_CONFIG_DIR="$HOME/.config"
export XDG_CACHE_DIR="$HOME/.cache"
export XDG_LOCAL_DIR="$HOME/.local"

### ZSH ###
PROMPT="%F{blue}%~%f %F{yellow}>%f "
HISTFILE="$XDG_CACHE_DIR/zsh/history"
HISTSIZE=5000
SAVEHIST=5000
ZSH_COMPDUMP="$XDG_CACHE_DIR/zsh/compdump"
autoload -Uz compinit
zstyle ':completion:*' menu select
compinit
# bindkey -v

### Go ###
export GOPATH="$XDG_LOCAL_DIR/go"
export PATH="$GOPATH/bin":$PATH

### Zig ###
export PATH="$XDG_LOCAL_DIR/zig:$PATH"

### Rust ###
export RUSTUP_HOME="$XDG_LOCAL_DIR/rustup"
export CARGO_HOME="$XDG_LOCAL_DIR/cargo"
export PATH="$CARGO_HOME/bin:$PATH"

### Bun ###
export BUN_INSTALL="$XDG_LOCAL_DIR/bun"
export PATH="$BUN_INSTALL/bin:$PATH"

### PyENV ###
export PYENV_ROOT="$XDG_LOCAL_DIR/pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

### Postgres ###
export PATH="/usr/local/opt/postgresql@17/bin:$PATH"

### Aliases ###
alias zvim="nvim $HOME/.zshrc"
alias zsrc="source $HOME/.zshrc"
alias cd="z"
alias vim="nvim"
alias ..="cd .."

### Zoxide ###
eval "$(zoxide init zsh)"
source <(fzf --zsh)

### Direnv ###
eval "$(direnv hook zsh)"

# bun completions
[ -s "/Users/gregmulvaney/.local/bun/_bun" ] && source "/Users/gregmulvaney/.local/bun/_bun"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
. "/Users/gregmulvaney/.deno/env"