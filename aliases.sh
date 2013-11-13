#!/bin/bash

##############
# Misc stuff #
##############

alias ll='ls -l'
alias grep='grep --color=auto'
alias top='top -i'

# Get rid of the gnome pop-up when doing git push
unset SSH_ASKPASS

##############
# Colored ls #
##############

alias ls='ls --color=auto'
LS_COLORS='di=1;34:fi=0:ln=1;31:pi=1;5:so=1;5:bd=1;5:or=1;31:mi=0:ex=1;32:*.rpm=1;90:*.C=1;35:*.cc=1;35:*.h=0;35'
export LS_COLORS

#######
# PS1 #
#######

PS1='\[\e]0;$WINDOWTITLE \a\][\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]]\n > '
export WINDOWTITLE=$HOSTNAME

######################
# Mapping to scripts #
######################

alias launchScreen='~/littleScripts/launchScreen'
alias makec='make 2>&1 | python ~/littleScripts/colorGcc.py'
