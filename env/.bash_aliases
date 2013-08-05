alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'

alias pfind="find . -name '*.py' -o -name '*.html' -o -name '*.handlebars' | grep -v migrations | xargs grep -n"
alias jfind="find . -name '*.js' -o -name '*.html' -o -name '*.handlebars' | grep -v '.min' | xargs grep -n"
alias ppfind="find . -name '*.php' -o -name '*.html' | xargs grep -n"

alias lookfor="~/bin/lookfor.sh"

alias rviz_='source /opt/ros/groovy/setup.bash && roslaunch turtlebot_rviz_launchers view_navigation.launch'
alias leo_='source /opt/ros/groovy/setup.bash && export ROS_MASTER_URI=http://10.1.0.19:11311 && export ROS_HOSTNAME=10.1.0.15'
alias don_='source /opt/ros/groovy/setup.bash && export ROS_MASTER_URI=http://10.1.0.17:11311 && export ROS_HOSTNAME=10.1.0.15'

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
