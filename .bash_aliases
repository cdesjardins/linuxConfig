alias df='df -h'
alias grep='grep --exclude-dir=boost_1_55_0 --exclude-dir=kernels'
export GIT_PS1_SHOWDIRTYSTATE=1
if [ "$USERNAME" = "root" ]; then
    PS1='\[\033[01;31m\]\u@\h\[\033[01;34m\] \w\[\033[00m\]# '
elif [ -n "SSH_TTY" ]; then
    PS1='\[\033[01;35m\]\u@\h\[\033[01;34m\] \w\[\033[01;33m\]$(__git_ps1)\[\033[01;34m\]\[\033[00m\]$ '
else
    PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w\[\033[01;33m\]$(__git_ps1)\[\033[01;34m\]\[\033[00m\]$ '
fi
PATH=$PATH:/sbin

