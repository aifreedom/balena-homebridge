#!/bin/bash

# Constants
WORKING_DIR="/usr/src/app"
HOMEBRIDGE_DIR="/data/.homebridge/"
# Use Homekit PIN from balenaCloud
HOMEKIT_PIN=${HOMEKIT_PIN:-"000-00-000"}

cd "$WORKING_DIR"

# Setup Homebridge
if [ -d "${HOMEBRIDGE_DIR}" ]; then
  # Exists
  echo "Homebridge is already configured at \"${HOMEBRIDGE_DIR}\"."
  echo "Run \"Purge Data\" and then \"Restart\" action to reset to default configuration."
else
  # Does not exist
  echo "Homebridge is not configured."
  echo "Creating Homebridge directory at \"$HOMEBRIDGE_DIR\"."
  mkdir -p "$HOMEBRIDGE_DIR"
  echo "Copying Homebridge configuration"
  cp .homebridge/* "$HOMEBRIDGE_DIR"
  # 333-33-333 is default pin, assume it has been changed to anything else
  sed -e "s/333-33-333/${HOMEKIT_PIN}/g" .homebridge/config.json > "${HOMEBRIDGE_DIR}/config.json"
fi
