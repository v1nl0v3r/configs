export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME=""

plugins=(git archlinux)

export STARSHIP_CONFIG="$HOME/.config/starship/everforest.toml"

source $ZSH/oh-my-zsh.sh

eval "$(starship init zsh)"


#autosuggestions config
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
bindkey '^ ' autosuggest-accept

source <(fzf --zsh)


# User configuration
alias vim='nvim'
