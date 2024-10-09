# Path to your Oh My Zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Theme for omz
ZSH_THEME="robbyrussell"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# OMZ Plugins
plugins=(
    git
    zsh-syntax-highlighting
    zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# User configuration

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Aliases
alias zshe="nvim ~/.zshrc"
alias zshr="source ~/.zshrc"
alias config="cd ~/.config"
alias dotfiles="cd ~/dotfiles"
alias vimc="cd ~/.config/nvim/lua/custom && nvim"
alias htop="bpytop"

alias  l='eza -l  --icons'
alias ls='eza -a  --icons'
alias ll='eza -la --icons'
alias ld='eza -lD --icons'

# Starup commands
clear
fastfetch
