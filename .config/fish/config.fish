#!/usr/bin/env fish
set fish_greeting

set -gx EDITOR nvim
set -gx LANG en_US.UTF-8

set -x PATH $PATH /usr/local/hombrew/sbin /usr/local/bin /usr/sbin

# rbenv
status --is-interactive; and source (rbenv init -|psub)

function fish_prompt
  printf '%s' (prompt_pwd)
  printf ' > '
end
