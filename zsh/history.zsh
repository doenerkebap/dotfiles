HISTFILE=$XDG_CACHE_HOME/zsh/history        # history filename
HISTSIZE=10000                 # ?
SAVEHIST=10000                 # ?
setopt APPENDHISTORY           # add history
setopt EXTENDED_HISTORY        # add timestamps to history
setopt HIST_IGNORE_ALL_DUPS    # no duplicates
setopt HIST_REDUCE_BLANKS      # no superfluous white space
setopt SHARE_HISTORY           # import from and append to history file

autoload -Uz up-line-or-beginning-search
zle -N up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '\eOA' up-line-or-beginning-search
bindkey '\e[A' up-line-or-beginning-search
bindkey '\eOB' down-line-or-beginning-search
bindkey '\e[B' down-line-or-beginning-search
