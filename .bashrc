# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !

# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.

# RUBY
export PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"

# GOOGLE APPENGINE
export PATH=$PATH:/opt/google_appengine

# LOCAL BIN (VIM/GVIM)
export PATH=~/bin:$PATH

if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi

# Aliases
alias ls='ls --color=auto'
alias makepkg='sudo -u nobody makepkg'
alias emc='emacsclient -c'
alias emt='emacsclient -t'

#[ ! "$UID" = "0" ] && archbey -c cyan
#[ "$UID" = "0" ] && archbey -c red

# Put your fun stuff here.

# Setup ENV variables for various applications
#

# GENERAL
export EDITOR='gvimgg'
export TERM='xterm-256color'

# GIT
export GIT_EDITOR='gvimb --nofork'
export GIT_AUTHOR_NAME="Stuart Parry"
export GIT_AUTHOR_EMAIL="stuart.parry@gmail.com"
export GIT_COMMITER_NAME="$GIT_AUTHOR_NAME"
export GIT_COMMITER_EMAIL="$GIT_AUTHOR_EMAIL"

# SVN
export SVN_EDITOR='gvimb --nofork'
