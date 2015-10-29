#!/bin/bash

. lib/debug.sh

debug "Environment AUTHENTICATION"

. lib/throw.sh

AUTH=${AUTH:-htpasswd}

case $AUTH in
    htpasswd|ldap)
        . ev/authentication/${AUTH}.sh
    ;;
    *)
        throw "AUTH is not valid"
    ;;
esac
