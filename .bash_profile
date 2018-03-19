#! /bin/bash

#export env
export PATH="$HOME/bin:$PATH"
export ANDROID_HOME=~/Android/Sdk
export PATH=${PATH}:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
export TERM=xterm-256color

export PATH=~/.config/composer/vendor/bin:$PATH

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,bash_aliases,fzf.bash,extra}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;
