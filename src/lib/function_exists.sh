#!/bin/bash

declare -f -F "function_exists" > /dev/null || {
    function_exists() {
        declare -f -F $1 > /dev/null
        return $?
    }
}
