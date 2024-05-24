ZINIT_DIR="${HOME}/.local/share/zinit/zinit.git"

if [ ! -d "$ZINIT_DIR" ]; then
   mkdir -p "$(dirname $ZINIT_DIR)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_DIR"
fi

source "${ZINIT_DIR}/zinit.zsh"

zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

zinit snippet OMZP::command-not-found

autoload -Uz compinit && compinit

zinit cdreplay -q

bindkey -e
bindkey "^y" autosuggest-accept
bindkey "^p" history-search-backward
bindkey "^n" history-search-forward
bindkey '^[w' kill-region

HISTSIZE=5000
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

zstyle ":completion:*" matcher-list "m:{a-z}={A-Za-z}"
zstyle ":completion:*" list-colors "${(s.:.)LS_COLORS}"
zstyle ":completion:*" menu no
zstyle ":fzf-tab:complete:cd:*" fzf-preview "ls --color $realpath"
zstyle ":fzf-tab:complete:__zoxide_z:*" fzf-preview "ls --color $realpath"

export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#14141f,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
--color=gutter:#14141f"
zstyle ':fzf-tab:*' fzf-flags $(echo $FZF_DEFAULT_OPTS)

set -o AUTO_CD

alias ls="ls --color"
alias vim="nvim"

eval "$(starship init zsh)"
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

export TERM="xterm-256color"
[[ -n $TMUX ]] && export TERM="screen-256color"
export LANG=en_US.UTF-8
export EDITOR="nvim"
