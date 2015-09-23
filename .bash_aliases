alias df='df -h'
alias grep='grep --exclude-dir=.git --exclude-dir=out --exclude-dir=prebuilts --color=auto -I -s'
export GIT_PS1_SHOWDIRTYSTATE=1
if [ `id -u` -eq 0 ]; then
    PS1='\[\033[01;31m\]\u@\h\[\033[01;34m\] \w\[\033[00m\]# '
elif [ -n "$SSH_TTY" ]; then
    PS1='\[\033[01;35m\]\u@\h\[\033[01;34m\] \w\[\033[01;33m\]$(__git_ps1)\[\033[01;34m\]\[\033[00m\]$ '
else
    PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w\[\033[01;33m\]$(__git_ps1)\[\033[01;34m\]\[\033[00m\]$ '
fi
PATH=$PATH:/sbin:$HOME/bin

function sshadd() {
    eval $(ssh-agent -s)
    ssh-add
}
export $(dbus-launch)
