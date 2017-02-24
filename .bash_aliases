#!/bin/bash

#Aliases
alias cdf="cd ~/projects/"
alias cdr="cd ~/"
alias pu="phpunit --test-suffix ".php" --colors $@"
alias puf="phpunit --stop-on-failure --test-suffix ".php" --colors $@"
alias phpcs="phpcs --standard=PSR2 $@"
alias c="clear"
alias gst="git status"
alias gdf="git diff $@"
alias gc="git commit $@"
alias frogdocker="docker exec -i -t frogappliance_appliance_1 /bin/bash"
alias fa-start="docker-compose up -d"
alias cdvag="cd ~/projects/vagrant/ && vagrant status"
