source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=10"             # set autosuggest color to darker gray
ZSH_AUTOSUGGEST_HIGHLIGHT_STRATEGY="match_prev_cmd" # better autosuggest matching
bindkey '^L' autosuggest-accept                     # autosuggest keybindings
bindkey '^J' autosuggest-execute                    # --
bindkey '^H' autosuggest-clear                      # --
