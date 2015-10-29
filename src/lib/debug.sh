#!/bin/bash

DEBUG=${DEBUG:-treu}

. lib/function_exists.sh

function_exists "debug" || {
    debug () {
        [ "$DEBUG" == "false" ] && return 0
        echo " [debug] $1"
    }
}
