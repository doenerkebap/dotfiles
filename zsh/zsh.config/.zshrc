typeset -U config_files
config_files=($ZSH/**/*.zsh)
# exclude path and aliases (already loaded in .zshenv) and plugin files
config_files=(${${config_files:#*/path.zsh}:#*/aliases.zsh})


# load everything but the completion files
for file in ${${config_files:#*/completion.zsh}:#*/plugin.zsh}
do
  source $file
done

# initialize autocomplete here, otherwise functions won't be loaded
autoload -U compinit
compinit

# load every completion after autocomplete loads
for file in ${(M)config_files:#*/completion.zsh}
do
  source $file
done

# load plugin files last
for file in ${(M)config_files:#*/plugin.zsh}
do
  source $file
done
unset config_files
