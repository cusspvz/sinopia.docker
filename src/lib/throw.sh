#!/bin/bash

. lib/function_exists.sh

function_exists "throw" || {
    throw () {
        echo "Error: $1"
        exit 1;
    }
}
