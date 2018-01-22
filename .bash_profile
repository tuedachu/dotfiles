#
# ~/.bash_profile
# t

[[ -f ~/.bashrc ]] && . ~/.bashrc

eval $(ssh-agent)

export GIT_EDITOR="emacsclient"
export EDITOR="emacsclient"

export PATH="$PATH:$HOME/.local/bin"

