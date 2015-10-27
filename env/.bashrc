#
# ~/.bashrc
#

alias ls='ls --color=auto'
source ~/bin/git-prompt.sh

# Alias definitions.
[ -f ~/.bash_aliases ] && source ~/.bash_aliases

# Custom completions.
[ -d ~/bin/bash_completion.d ] && source ~/bin/bash_completion.d/*

export TERM="rxvt-unicode"

export EDITOR="emacs -nw"

# If in a git repository, display the current branch in green.
PS1='\h:\W$(__git_ps1 "\[\e[32m\][%s]\[\e[0m\]")$ '

export PATH="$HOME/bin:$PATH"

# Load pyenv
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && startx
