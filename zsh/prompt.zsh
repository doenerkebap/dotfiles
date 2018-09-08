autoload -U promptinit; promptinit
prompt spaceship

SPACESHIP_GIT_PREFIX="%F{20}on "
SPACESHIP_GIT_STATUS_COLOR=16
SPACESHIP_EXEC_TIME_PREFIX="%F{20}took "
SPACESHIP_EXIT_CODE_SHOW=true
SPACESHIP_VI_MODE_COLOR=20
SPACESHIP_VI_MODE_SUFFIX=""
SPACESHIP_VI_MODE_INSERT=" I "
SPACESHIP_VI_MODE_NORMAL=" N "
alias spaceship_prompt='pwd > $XDG_CACHE_HOME/last_dir; spaceship_prompt'
spaceship_vi_mode_enable
