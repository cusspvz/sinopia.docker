#!/bin/bash

. lib/debug.sh

debug "Environment STORAGE"

. lib/throw.sh

STORAGE=${STORAGE:-container}
STORAGE_DATA_PATH=${STORAGE_DATA_PATH:-/data}

# Create data dir in case it doesn't exist
mkdir -p "$STORAGE_DATA_PATH"

echo "
storage: $STORAGE_DATA_PATH
" | configurator stdinappend

case $STORAGE in
    container|volume|s3|nfs)
        . ev/storage/$STORAGE.sh
    ;;
    *)
        throw "STORAGE is not valid"
    ;;
esac
