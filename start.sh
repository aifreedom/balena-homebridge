#!/bin/bash

# Start resin-wifi-connect
export DBUS_SYSTEM_BUS_ADDRESS=unix:path=/host/run/dbus/system_bus_socket
./resin-wifi-connect --clear=false

# At this point the WiFi connection has been configured and the device has
# internet - unless the configured WiFi connection is no longer available.

# Start the main application

WORKING_DIR="/usr/src/app"
HOMEBRIDGE_DIR="/data/.homebridge/"
KEEP_CONFIG=${KEEP_CONFIG:-no}
HOMEKIT_PIN=${HOMEKIT_PIN:-"000-00-000"}

cd "$WORKING_DIR"

# Setup Homebridge
if [ -d "${HOMEBRIDGE_DIR}" ]; then
  # Exists
  echo "Homebridge is already configured at \"${HOMEBRIDGE_DIR}\"."
  if [ "${KEEP_CONFIG}" = "yes" ]; then
    echo "KEEP_CONFIG=yes, Run \"Purge Data\" and then \"Reboot\" action to reset to default configuration."
  else
    echo "KEEP_CONFIG=no, Replacing ${HOMEBRIDGE_DIR}/config.json with .homebridge/config.json"
    sed -e "s/333-33-333/${HOMEKIT_PIN}" .homebridge/config.json > "${HOMEBRIDGE_DIR}/config.json"
  fi
else
  # Does not exist
  echo "Homebridge is not configured."
  echo "Creating Homebridge directory at \"$HOMEBRIDGE_DIR\"."
  mkdir -p "$HOMEBRIDGE_DIR"
  echo "Copying Homebridge configuration"
  cp .homebridge/* "$HOMEBRIDGE_DIR"
  sed -e "s/333-33-333/${HOMEKIT_PIN}" .homebridge/config.json > "${HOMEBRIDGE_DIR}/config.json"
fi
