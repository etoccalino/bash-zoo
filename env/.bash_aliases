alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'

alias pfind="find . -name '*.py' -o -name '*.html' -o -name '*.handlebars' | grep -v migrations | xargs grep --color -n"
alias jfind="find . -name '*.js' -o -name '*.html' -o -name '*.handlebars' | grep -v '.min' | xargs grep --color -n"
alias ppfind="find . -name '*.php' -o -name '*.html' | xargs grep --color -n"
alias rfind="find . -name '*.rb' -o -name '*.html' | xargs grep --color -n"
alias cfind="find . -name '*.c' -o -name '*.cpp' -o -name "*.h" | xargs grep --color -n"

alias lookfor="~/bin/lookfor.sh"
alias e="emacs -nw"
alias o="gnome-open"
alias l="~/bin/shoot.sh"

alias g='git'
alias s='git status --short'
alias d='git diff'
alias ddd='git diff --cached'
alias gl='git log --color --graph --oneline --all --decorate'
alias gb='git branch'
alias ga='git add'
alias gp='git pull'
alias gr='git remote -v'
alias gc='git commit'
alias gba='git branch --all'
alias gco='git checkout'
alias grh='git reset --hard'
alias gfa='git fetch --all'
alias gls='git ls-files'

alias wgl='watch -n 1 --color git log --color --graph --oneline --all --decorate'
