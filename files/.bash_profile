#
# .bashrc
#


HISTSIZE=50
HISTFILESIZE=25
export BROWSER=firefox

# ---------------------------------------------------------------
# aliases 
alias back='cd $OLDPWD'
alias ls='ls -C --color=auto'
alias ll='ls -l'
alias la='ls -a'
alias lal='ls -al'
alias lnew='ls -alt | head -16'

export VISUAL=vim

export PS1='\[\e]0;\u@\h (\w)\a\]\n\[\e[0;32m\]\u\[\e[1;34m\]@\h\[\e[0;31m\] [ \w ]\n\[\e[0;32m\]\$\[\e[m\] '
export PS2='\[\e[0;32m\]>\[\e[m\] '

export PATH=/usr/sccs/bin:/usr/sccs/staff/bin:$PATH
