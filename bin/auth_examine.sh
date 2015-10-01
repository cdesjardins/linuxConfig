#!/bin/bash

if [ -z "$1" ] ; then
    echo "Log dir required"
else
    logbasedir=$1
    logdir="$logbasedir"/$(date +%F)

    mkdir -p "$logdir"

    tmpdir=$logbasedir/`mktemp -d auth_examine-XXXXXXXXXXXX`
    
    function getIt()
    {
        logfile=$1
        searchterm=$2
        column=$3
        filter=$4
        grep -i "$searchterm" ~/tmp/auth.log* | tr -s [:space:] > "$tmpdir/t1"
        if [ -n "$filter" ]; then
            grep -v "$filter" "$tmpdir/t1" > "$tmpdir/t2"
        else
            mv "$tmpdir/t1" "$tmpdir/t2"
        fi
        cat "$tmpdir/t2" | cut -d " " -f $column | sort | uniq | while read line ; do
            echo -n "$line "; cat "$tmpdir/t2" | grep "${searchterm}${line}" | wc -l;
        done | sort -n -k 2 > "$logfile"
        cat "$tmpdir/t2" | wc -l  >> "$logfile"
        echo "Created $logfile"
    }

    getIt "$logdir/invalid_passwords.txt" "Failed password for " 9 "Failed password for invalid user"
    getIt "$logdir/invalid_passwords_ips.txt" "Failed password for .* from " 11 "Failed password for invalid user"
    getIt "$logdir/invalid_users.txt" "Failed password for invalid user " 11
    getIt "$logdir/invalid_users_ips.txt" "Failed password for invalid user .* from " 13
    getIt "$logdir/reverse_map_ips.txt" "reverse mapping checking getaddrinfo for " 12
    getIt "$logdir/no_map_back_ips.txt" "]: Address " 7
    rm -rf $tmpdir
fi
