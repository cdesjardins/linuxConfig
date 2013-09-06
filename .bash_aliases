alias df='df -h'
alias grep='grep --exclude-dir=boost_1_54_0 --exclude-dir=kernels'
export GIT_PS1_SHOWDIRTYSTATE=1
PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w\[\033[01;33m\]$(__git_ps1)\[\033[01;34m\]\[\033[00m\]$ '
PATH=$PATH:/sbin

