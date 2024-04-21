export TERM="xterm-256color"
[[ -n $TMUX ]] && export TERM="screen-256color"
export LANG=en_US.UTF-8
export EDITOR="nvim"
export BROWSER="librewolf"

export ZSH=$HOME/.oh-my-zsh

eval "$(starship init zsh)"

plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
    fast-syntax-highlighting
    colorize
    colored-man-pages
    command-not-found
)

source $ZSH/oh-my-zsh.sh

alias vim=nvim

bindkey "^y" autosuggest-accept
