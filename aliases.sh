#!/bin/bash

####################
# Standard aliases #
####################

alias apt-search='sudo apt-cache search'
alias apt-install='sudo apt-get install'
alias apt-remove='sudo apt-get remove'

alias ll='ls -l'
alias grep='grep --color=auto'
alias top='top -i'

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

# Window-title trick
PS1='\[\e]0;$WINDOWTITLE \a\]'
# Username, host and pwd
PS1="$PS1"'[\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]]'
# Notifications
PS1="$PS1"'$(if [ -f ~/.notifications ]; then echo " [\033[01;31m"`cat ~/.notifications | wc -l` "notification\033[00m]"; fi)'
# New line for the user input
PS1="$PS1"'\n > '


export WINDOWTITLE=$HOSTNAME
function title {
WINDOWTITLE=$1
}

######################
# Mapping to scripts #
######################

alias launchScreen='~/littleScripts/launchScreen'
export GCCPARSER="2>&1 | python ~/littleScripts/colorGcc.py"
alias makec="make $GCCPARSER"
alias octopus="~/littleScripts/octopus"
alias harvestProdOnDPM="~/littleScripts/harvestProdOnDPM"

##############
# Misc stuff #
##############

# Get rid of the gnome pop-up when doing git push
unset SSH_ASKPASS

# Prevent non-breakable spaces and otha shet
setxkbmap -option "nbsp:none" 2> /dev/null

# Use english for ls -l, g++ errors and so on
export LANG="C"

