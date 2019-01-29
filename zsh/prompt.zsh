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
SPACESHIP_PROMPT_ORDER=(
  time          # Time stamps section
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section
# hg            # Mercurial section (hg_branch  + hg_status)
# package       # Package version
# node          # Node.js section
# ruby          # Ruby section
# elixir        # Elixir section
# xcode         # Xcode section
# swift         # Swift section
# golang        # Go section
# php           # PHP section
# rust          # Rust section
# haskell       # Haskell Stack section
# julia         # Julia section
# docker        # Docker section
# aws           # Amazon Web Services section
  venv          # virtualenv section
# conda         # conda virtualenv section
  pyenv         # Pyenv section
# dotnet        # .NET section
# ember         # Ember.js section
# kubecontext   # Kubectl context section
# terraform     # Terraform workspace section
  exec_time     # Execution time
  line_sep      # Line break
# battery       # Battery level and status
  vi_mode       # Vi-mode indicator
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)

alias spaceship_prompt='pwd > $XDG_CACHE_HOME/last_dir; spaceship_prompt'
spaceship_vi_mode_enable
