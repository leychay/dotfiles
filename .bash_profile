#! /bin/bash

#export env
# export PATH="$HOME/bin:$PATH"
# export ANDROID_HOME=~/Android/Sdk
# export PATH=${PATH}:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
# export TERM=xterm-256color

export PATH=~/.config/composer/vendor/bin:$PATH
export EDITOR='vim'
export VISUAL='vim'

export PATH=~/.phpbrew/bin:$PATH
export PATH=~/utils/git-imerge/:$PATH
export PATH=~/utils/sonar-scanner/bin:$PATH
export PATH=~/utils/flutter/bin:$PATH
export PATH=~/utils/certbot/bin:$PATH
export PATH=~/utils/sonar-scanner/bin:$PATH

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,bash_aliases,fzf.bash,extra}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
