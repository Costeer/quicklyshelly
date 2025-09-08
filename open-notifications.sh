#!/bin/sh
# Make sure to use the full path to ensure it works
/run/current-system/sw/bin/swaync-client --open-panel

# Log the execution for debugging
echo "SwayNC panel open command executed at $(date)" >> /tmp/swaync-debug.log

# Make sure the command executes even if there are issues
if [ $? -ne 0 ]; then
  # Try alternative method
  /usr/bin/env swaync-client --open-panel
if
