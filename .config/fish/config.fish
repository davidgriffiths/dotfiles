#!/usr/bin/env fish
set fish_greeting

set -gx EDITOR nvim
set -gx LANG en_US.UTF-8

set homebrew /usr/local/bin /usr/local/sbin
set default_path /usr/bin /usr/sbin /bin /sbin

set -gx PATH $homebrew $default_path

set -x FZF_DEFAULT_COMMAND 'ag --hidden --ignore .git -g ""'

# rbenv
status --is-interactive; and source (rbenv init -|psub)

alias vim='nvim'

function fish_prompt
  printf '%s' (prompt_pwd)
  printf ' > '
end
