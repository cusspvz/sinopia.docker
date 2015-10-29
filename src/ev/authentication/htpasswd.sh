#!/bin/bash

. lib/debug.sh

debug "Environment AUTHENTICATION_HTPASSWD"

. lib/throw.sh

AUTH_HTPASSWD_MAX_USERS=${AUTH_HTPASSWD_MAX_USERS:--1}

case $AUTH_HTPASSWD_MAX_USERS in
    "+inf")
        YAMELIZED_MAX_USERS="\"+inf\""
    ;;
    "-1")
        YAMELIZED_MAX_USERS="-1"
    ;;
    [0-9]+)
        YAMELIZED_MAX_USERS=$AUTH_HTPASSWD_MAX_USERS
    ;;
    *)
        throw "AUTH_HTPASSWD_MAX_USERS not valid"
    ;;
esac

# Append to config
echo "
auth:
  htpasswd:
    file: ${STORAGE_DATA_PATH}/htpasswd
    max_users: ${YAMELIZED_MAX_USERS}
" | configurator stdinappend
