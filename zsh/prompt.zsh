autoload -U promptinit; promptinit
prompt spaceship

SPACESHIP_VI_MODE_SHOW=false
alias spaceship_prompt='pwd > $XDG_CACHE_HOME/last_dir; spaceship_prompt'
