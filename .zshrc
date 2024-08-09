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
compinit
# bindkey -v

### Go ###
export GOPATH="$XDG_LOCAL_DIR/go"
export PATH="$GOPATH/bin":$PATH

### Rust ###
export RUSTUP_HOME="$XDG_LOCAL_DIR/rustup"
export CARGO_HOME="$XDG_LOCAL_DIR/cargo"
export PATH="$CARGO_HOME/bin:$PATH"

### Bun ###
export BUN_INSTALL="$XDG_LOCAL_DIR/bun"
export PATH="$BUN_INSTALL/bin:$PATH"

### Postgres ###
export PATH="/usr/local/opt/postgresql@16/bin:$PATH"

### Kubernetes ###
export KUBECONFIG="$XDG_CONFIG_DIR/kube/k3s.yaml"
export KUBE_EDITOR=nvim

### Aliases ###
alias k="kubectl"
alias t="talosctl"
alias zvim="nvim $HOME/.zshrc"
alias zsrc="source $HOME/.zshrc"
alias cd="z"
alias vim="nvim"

### Zoxide ###
eval "$(zoxide init zsh)"

# TODO: Find lazy load alternatives to improve shell startup times 

### Direnv ###
#eval "$(direnv hook zsh)"

### NVM ###
#export NVM_DIR="$XDG_LOCAL_DIR/nvm"
#[ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion



