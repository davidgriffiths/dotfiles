# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
ZSH_CUSTOM=$HOME/.zsh_customisations

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="dg"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/usr/local/homebrew/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin

# For rbenv
PATH="$HOME/.rbenv/bin:$PATH"
# For RabbitMQ
PATH=$PATH:/usr/local/Homebrew/sbin
# Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export RBENV_ROOT=/usr/local/var/rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# cake slice
export CAKE_LOCAL_DB=alpha_dev
export CAKE_REMOTE_APP=cake-data

export EDITOR=vim

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
