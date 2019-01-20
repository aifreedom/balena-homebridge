#!/bin/bash

# Constants
WORKING_DIR="/usr/src/app"
HOMEBRIDGE_DIR="/data/.homebridge/"
# Use Homekit PIN from balenaCloud
HOMEKIT_PIN=${HOMEKIT_PIN:-"000-00-000"}
HOMEKIT_USER=${HOMEKIT_USER:-"00:11:22:33:44:55"}

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
  sed -i -e "s/333-33-333/${HOMEKIT_PIN}/g" ${HOMEBRIDGE_DIR}/config.json
  sed -i -e "s/AA:BB:CC:DD:EE:FF/${HOMEKIT_USER}/g" ${HOMEBRIDGE_DIR}/config.json
fi
