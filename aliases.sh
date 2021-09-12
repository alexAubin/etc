#!/bin/bash

####################
# Standard aliases #
####################

alias apt-search='sudo apt-cache search'
alias apt-install='sudo apt-get install'
alias apt-remove='sudo apt-get remove'

alias ll='ls -lh'
alias grep='grep --color=auto'
alias top='top -i'
alias diff='git diff --no-index'
alias time='/usr/bin/time -f "\n Command took %E (%U user, %S system, %MKo memory)"'

alias wifi="nmcli d wifi"
alias comeoninternet="while ! ping -W 2 -c 1 89.234.141.66; do sleep 0.5; done"
alias battery="upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep 'state\|percentage'"
alias bs="/home/alex/dev/.backslide/node_modules/backslide/bin/bs"
alias weather="curl http://wttr.in/ 2>/dev/null | head -n 7"
alias moon="curl http://wttr.in/moon"

alias fix-github-origin="git remote set-url --push origin git@github.com:\$(git remote -v | grep \"origin.*push\" | sed 's@https://@@g' | sed 's@.com@@g' | tr '/:.' ' ' | awk '{print \$3\"/\"\$4}').git"

##################################
# In-console notification system #
##################################

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='echo "    $(date +%a" "%d" "%b" @ "%T) :: $(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'') :: completed" >> ~/.notifications'

alias checkNotifications='cat ~/.notifications && rm ~/.notifications'

##############
# Colored ls #
##############

alias ls='ls --color=auto'
export LS_COLORS='di=1;34:fi=0:ln=1;31:pi=1;5:so=1;5:bd=1;5:or=1;31:mi=0:ex=1;32:*.rpm=1;90:*.C=1;35:*.cc=1;35:*.cpp=1;35:*.h=0;35'

#######
# PS1 #
#######

if [[ $USER == "root" ]];
then
   PS1='[\[\033[01;31m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]]\n > '
else
   PS1='[\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]]\n > '
fi

########
# Misc #
########

export GCCPARSER="2>&1 | python ~/littleScripts/colorGcc.py"

alias reloadXdefaults="xrdb -load ~/.Xdefaults"
alias setBackground='feh --bg-scale'
alias setLuminosity='xbacklight -set'

##############
# Misc stuff #
##############

# Get rid of the gnome pop-up when doing git push
unset SSH_ASKPASS

# Prevent non-breakable spaces and otha shet
setxkbmap -option "nbsp:none" 2> /dev/null

# Use english for ls -l, g++ errors and so on
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

# If interactive
if [ -t 1 ]
then
    # Use up and down arrow in the command line to search for command starting with what's already written
    bind '"\e[A": history-search-backward'
    bind '"\e[B": history-search-forward'
fi
