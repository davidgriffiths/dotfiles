#!/usr/bin/env fish
set fish_greeting
set -gx EDITOR vim
set -gx LANG en_US.UTF-8
set homebrew /opt/homebrew/bin
set default_path /usr/bin /usr/sbin /bin /sbin ~/bin
set -gx PATH $homebrew $default_path
set -x FZF_DEFAULT_COMMAND 'ag --hidden --ignore .git -g ""'

# set pure prompt symbol
set -g pure_symbol_prompt ">"

# alias vim='nvim'

function nvm
    bass source ~/.nvm/nvm.sh --no-use ';' nvm $argv
end

if test -z (pgrep ssh-agent | string collect)
    eval (ssh-agent -c)
    set -Ux SSH_AUTH_SOCK $SSH_AUTH_SOCK
    set -Ux SSH_AGENT_PID $SSH_AGENT_PID
end
