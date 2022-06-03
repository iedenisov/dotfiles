#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Make wpgtk apply the colorscheme to new terminals
(cat $HOME/.config/wpg/sequences &)

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
PATH=$PATH:$HOME/.local/bin
