#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Make wpgtk apply the colorscheme to new terminals
# (cat $HOME/.config/wpg/sequences &)

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# opam configuration
test -r /home/jrknsoff/.opam/opam-init/init.sh && . /home/jrknsoff/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

# Set up Node Version Manager (nvm)
source /usr/share/nvm/init-nvm.sh

# Load Simple Ruby Version Management (rbenv)
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# Load SFDX CLI
export PATH=~/sfdx/bin:$PATH

export PATH=/home/jrknsoff/.opam/default/bin:/home/jrknsoff/sfdx/bin:/home/jrknsoff/.rbenv/shims:/home/jrknsoff/.rbenv/bin:/home/jrknsoff/.nvm/versions/node/v18.4.0/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:$PATH
