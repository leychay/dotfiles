#!/bin/bash

# Konsole default Aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ll='ls -alhF'
alias la='ls -A'
alias l='ls -CF'
# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'


# My Custom Aliases
alias cdf="cd ~/projects/"
alias cdvg="cd ~/projects/vagrant/"
alias cdd="cd ~/dotfiles/"
alias pu="phpunit --test-suffix ".php" --colors $@"
alias puf="phpunit --stop-on-failure --test-suffix ".php" --colors $@"
alias phpcs="phpcs --standard=PSR2 $@"
alias gst="git status"
alias vimbundle="cd ~/.vim/bundle/"
alias ..="cd .."
alias ...="cd ../.."
alias wificonnect="nmcli --ask -p device wifi connect $@"
alias wifilist="nmcli device wifi list"
alias revlist="git rev-list -n 1 $@"
alias icons="cd ~/_xproj/_utils/icons-in-terminal/ && ./print_icons.sh --names"
