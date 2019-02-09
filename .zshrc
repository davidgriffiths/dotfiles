# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
ZSH_CUSTOM=$HOME/.zsh_customisations
ZSH_THEME="dg"

COMPLETION_WAITING_DOTS="true"

# Load plugins
plugins=(git)

source $ZSH/oh-my-zsh.sh

export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:
# X11
export PATH="$PATH/usr/X11/bin"
# Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
# Rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
# Homebrew
export PATH="/usr/local/homebrew/bin:$PATH"
export PATH="/usr/local/Homebrew/sbin:$PATH"
# Place ~/bin first
export PATH="$HOME/bin:$PATH"

export RBENV_ROOT=/usr/local/var/rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

#include hidden files in fzf search
export FZF_DEFAULT_COMMAND='find .'

# cake slice
export CAKE_LOCAL_DB=alpha_dev
export CAKE_REMOTE_APP=cake-data

export EDITOR=vim

export FZF_TMUX=1
# Z - cd sanely
. $HOME/.scripts/z/z.sh

# Modifying
alias ohmy='vim ~/.oh-my-zsh'
alias zsh='vim ~/.zshrc'
alias reload!='. ~/.zshrc'

#navigation
alias repo='cd ~/Repositories/'
alias pto='cd ~/Repositories/pistachio'
alias pot='pto'
alias bra='cd ~/Repositories/Brazil'

# no correct
alias rspec="nocorrect rspec *"
alias update="nocorrect update"

#dev
alias r="./script/rails" #faster than rails command
alias be='bundle exec'
alias migrate='be rake db:migrate db:test:clone_structure'
alias pgon='postgres -D /usr/local/var/postgres >logfile 2>&1 &'
alias cleanup='rm -rf **/*.orig & rm -rf tmp/* & echo '\'\'' > log/development.log & echo '\'\'' > log/test.log'
alias tailog='tail -f log/development.log'
alias mlm='vim `ls -r db/migrate/* | head -n 1`'
alias wipetest='RAILS_ENV=test rake db:drop db:create db:test:clone_structure'
alias ts='bundle exec thin start'
alias pslog='tail -f /var/log/postgresql'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
