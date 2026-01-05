# Antidote
source ${ZDOTDIR:-~}/.antidote/antidote.zsh

# Homebrew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

#Zoxide
eval "$(zoxide init zsh)"

# Starship
eval "$(starship init zsh)"

# Keybindings
bindkey -v # Vi Mode

bindkey -M viins '^p' history-search-backward
bindkey -M viins '^n' history-search-forward

bindkey -M vicmd '^p' history-search-backward
bindkey -M vicmd '^n' history-search-forward

# SDKMAN (Java/JVM tools)
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"

# PATH additions
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.claude/local:$PATH"

# Aliases
alias v='nvim'
alias ls='ls --color'

# History
HISTSIZE=1000000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# Shell integrations
eval "$(fzf --zsh)"

antidote load

# fzf-tab configuration
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup  # if using tmux

