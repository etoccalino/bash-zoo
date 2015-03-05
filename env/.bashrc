# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

export EDITOR="emacs -nw"

# export WORKON_HOME=$HOME/programming/ENVS
# export PROJECT_HOME=$HOME/programming

# If in a git repository, display the current branch in green.
PS1='\h:\W$(__git_ps1 "\[\e[32m\][%s]\[\e[0m\]")$ '

export PATH="$HOME/bin:$PATH"
