#!/bin/bash

. lib/debug.sh

debug "Environment LISTEN"

. lib/configurator.sh

LISTEN=${LISTEN:-0.0.0.0:4873}

configurator append "listen:"
for listen in $LISTEN; do
    configurator append "- $listen"
done
