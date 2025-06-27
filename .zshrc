###########
### Zsh ###
###########

### Settings ###
#bindkey -v
autoload -Uz compinit && compinit

### History ###
HISTFILE="$XDG_CACHE_HOME/zsh/history"
HISTSIZE=1000
SAVEHIST=1000

### VCS Info ###
#autoload -Uz vcs_info
#precmd() {
#  vcs_info
#}
#setopt prompt_subst
#zstyle ':vcs_info:*' enable git
#zstyle ':vcs_info:*' unstagedstr '%F{9} ●%f'
#zstyle ':vcs_info:*' stagedstr '%F{222} ●%f'
#zstyle ':vcs_info:*' check-for-changes true
#zstyle ':vcs_info:git:*' formats '%m%u%c %F{green} %b%f'

### Prompt ###
PROMPT='%F{blue}%~%f${vcs_info_msg_0_} %F{11}>%f '

###############
### Aliases ###
###############

# cd to zoxide
alias cd='z'
# ls to eza
alias ls='eza'
alias vim='nvim'
alias zvim='nvim $HOME/.zshrc'
alias zsrc='source $HOME/.zshrc && source $HOME/.zshenv'
#alias k='kubectl'

#############
### Evals ###
#############

eval "$(zoxide init zsh)"
#export PATH="/usr/local/opt/rustup/bin:$PATH"
#eval "$(mise activate zsh)"
#export PATH="/Users/greg/.cache/.bun/bin:$PATH"
export PATH="/Users/greg/.cache/.bun/bin:$PATH"
export PATH="/Users/greg/.cache/.bun/bin:$PATH"
alias claude="/Users/greg/.config/claude/local/claude"
export JJ_EDITOR="nvim"
