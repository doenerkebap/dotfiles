source $ZSH/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=10"
export ZSH_AUTOSUGGEST_HIGHLIGHT_STRATEGY="match_prev_cmd"
bindkey '^L' autosuggest-accept
bindkey '^J' autosuggest-execute
bindkey '^H' autosuggest-clear
