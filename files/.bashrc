# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

umask 027

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
shopt -s histappend
export HISTCONTROL=ignoreboth
export HISTSIZE=1000
export HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# VARIABLES
export LC_COLLATE="C" 
# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;\u@\h (\w)\a\]$PS1"
    ;;
*)
    ;;
esac
export PATH="$PATH:/usr/local/sbin:/usr/sbin:/sbin:~/bin"
export OCDDIR="$HOME/.ocd"

export VISUAL=vim

# ALIASES
alias vim='vim -p'
alias gvim='gvim -p'

if [ "$USER" = "root" ]; then
    alias vim="vim -p -u /home/$SUDO_USER/.vimrc"
fi
alias rc="source $HOME/.bashrc"

alias s='ssh -l root'

SOURCE_FILES="
/etc/bash_completion
$HOME/.agentrc
$HOME/.bash_prompts
$HOME/.bashrc_$(hostname -f)
$HOME/.bashrc_$(dnsdomainname)
"
for file in $SOURCE_FILES;do test -f $file && . $file;done
