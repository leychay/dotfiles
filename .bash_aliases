#!/bin/bash

# Konsole default Aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'


# Custom Aliases
alias cdf="cd ~/projects/"
alias cdr="cd ~/"
alias cdvs="cd ~/projects/vagrant/ && vagrant status"
alias cdvg="cd ~/projects/vagrant/"
alias cdd="cd ~/dotfiles/"
alias pu="phpunit --test-suffix ".php" --colors $@"
alias puf="phpunit --stop-on-failure --test-suffix ".php" --colors $@"
alias phpcs="phpcs --standard=PSR2 $@"
alias c="clear"
alias gst="git status"

# Frog Specific Aliases
source "$HOME/dotfiles/.frogaliases"
