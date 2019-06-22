# Settings
shopt -s histappend histverify
shopt -s autocd cdspell direxpand dirspell globstar histappend histverify \
      nocaseglob no_empty_cmd_completion

# Variables
export EDITOR=vim
HISTCONTROL='erasedups:ignoreboth'
HISTIGNORE=?:??
HISTFILESIZE=9999
HISTSIZE=9999
PROMPT_COMMAND='history -a'
export PATH="$PATH:$HOME/.bin/:$HOME/.npm-modules/bin/:$HOME/.local/bin/"
export NNN_OPENER=mimeo
export NNN_TMPFILE=~/.config/nnn/.lastd
export NNN_OPS_PROG=1
export GPG_TTY=$(tty)
gpg-connect-agent updatestartuptty /bye >/dev/null
if [ -f $HOME/.express_variables ]; then
  source $HOME/.express_variables
fi

# Functions
n () {
  nnn -l "$@";
  if [ -f $NNN_TMPFILE ]; then
    . $NNN_TMPFILE;
    rm -f $NNN_TMPFILE > /dev/null;
  fi
}

# Alias
alias dof='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias ls='ls --color=auto'
alias q='exit'
alias tsm='transmission-remote'
alias vifm='vifmrun'

# Prompt
SIMPLE_GIT_PROMPT_MAX_PWD_LEN=0
SIMPLE_GIT_PROMPT_PREFIX="[\[\e[31m\]\u\[\e[m\]@\[\e[34m\]\h\[\e[m\]] \[\e[34m\]\W"
if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
  SIMPLE_GIT_PROMPT_PREFIX="[\[\e[31m\]\u\[\e[m\]@\[\e[34m\]\h [SSH]\[\e[m\]] \[\e[34m\]\W"
fi
SIMPLE_GIT_PROMPT_SUFFIX=">"
source ~/.simple-git-prompt/simplegitprompt.sh
