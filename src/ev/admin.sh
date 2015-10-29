#!/bin/bash

. lib/debug.sh

debug "Environment ADMIN"

. lib/throw.sh

ADMIN_USERNAME=${ADMIN_USERNAME:-admin}
ADMIN_PASSWORD=${ADMIN_PASSWORD:-4015bc9ee91e437d90df83fb64fbbe312d9c9f05}

[ -z "$ADMIN_PASSWORD" ] && throw "ADMIN_USERNAME is empty"

# check for 40 length string with only hexadecimal chars
[ ${#ADMIN_PASSWORD} -eq 40 ] && [[ $ADMIN_PASSWORD =~ *[!0-9A-Fa-f]* ]] ||
    throw "ADMIN_PASSWORD isn't a valid sha1"

. lib/configurator.sh

# Append to config
echo "
users:
  ${ADMIN_USERNAME}:
    password: ${ADMIN_PASSWORD}
" | configurator stdinappend
