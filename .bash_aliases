alias df='df -h'
alias grep='grep --exclude-dir=.git --exclude-dir=out --exclude-dir=prebuilts --color=auto -I -s'
export GIT_PS1_SHOWDIRTYSTATE=

GIT_PS1 ()
{
    if type -t __git_ps1 | grep -q '^function$' 2>/dev/null; then
        __git_ps1
    fi
}

if [ `id -u` -eq 0 ]; then
    PS1='\[\033[01;31m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]# '
elif [ -n "$SSH_TTY" ]; then
    PS1='\[\033[01;35m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[01;33m\]\[\033[01;34m\]\[\033[00m\]$ '
else
    PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[01;33m\]\[\033[01;34m\]\[\033[00m\]$ '
fi
PATH=$PATH:/sbin:$HOME/bin

function sshadd() {
    eval $(ssh-agent -s)
    ssh-add $1
}

if [ -n "$SSH_CLIENT" -a -n "$DISPLAY" ]; then
    machine_id=`cat /var/lib/dbus/machine-id`
    x_display=$(echo $DISPLAY|sed 's/^.*:\([0-9]\+\)\(\.[0-9]\+\)*$/\1/')
    dbus_session_file="$HOME/.dbus/session-bus/${machine_id}-${x_display}"
    if [ -r "$dbus_session_file" ]; then
            export $(grep '^DBUS.*=' "$dbus_session_file")
            # check if PID still running, if not launch dbus
            ps $DBUS_SESSION_BUS_PID | tail -1 | grep dbus-daemon >& /dev/null
            [ "$?" != "0" ] && export $(dbus-launch) >& /dev/null
    else
            export $(dbus-launch) >& /dev/null
    fi
fi

