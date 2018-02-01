#
# ~/.bash_profile
# t

[[ -f ~/.bashrc ]] && . ~/.bashrc

eval $(ssh-agent)

udiskie &

export GIT_EDITOR="emacsclient"
export EDITOR="emacsclient"

export PATH="$PATH:$HOME/.local/bin"
export GOPATH="$HOME/projects/go"
