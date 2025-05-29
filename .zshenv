###################
### XDG configs ###
###################

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_LOCAL_HOME="$HOME/.local"


#################
### Languages ###
#################

### Go ###
export GOPATH="$XDG_LOCAL_HOME/go"
export PATH="$GOPATH/bin":$PATH

### Rust ###
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup

### Tools ###

### Kubernetes ###
export KUBECONFIG="$XDG_CONFIG_HOME/kube" 
export KUBECACHEDIR="$XDG_CACHE_HOME/kube"



