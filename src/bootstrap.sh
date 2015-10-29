#!/bin/bash
. lib/configurator.sh


# Reset configurator
configurator clean

# Load environment
. ev/admin.sh
. ev/web.sh
. ev/storage.sh
. ev/authentication.sh
. ev/listen.sh

# Run backends
. backend/storage.sh

# Debugging config
configurator dump

# Start sinopia
sinopia --config $(configurator path)
