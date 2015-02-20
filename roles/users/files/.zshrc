export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="af-magic"

HIST_STAMPS="dd/mm/yyyy"

plugins=(git cp command-not-found git-extras gnu-utils history pip python ruby screen ssh-agent)

source $ZSH/oh-my-zsh.sh

export PATH=/usr/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games

source .bash_profile
source .bash_aliases

unsetopt nomatch
