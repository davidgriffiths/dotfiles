#!/usr/bin/env fish
set -gx EDITOR nvim
set -gx LANG en_US.UTF-8
set homebrew /usr/local/bin /usr/local/sbin
set default_path /usr/bin /usr/sbin /bin /sbin
set -gx PATH $homebrew $default_path
set -x FZF_DEFAULT_COMMAND 'ag --hidden --ignore .git -g ""'

# set pure prompt symbol
set -g pure_symbol_prompt ">"

alias vim='nvim'

# rbenv
status --is-interactive; and source (rbenv init -|psub)

function nvm
    bass source ~/.nvm/nvm.sh --no-use ';' nvm $argv
end
