#!/bin/bash

# Constants
CONFIG_JSON="${HOMEBRIDGE_DIR}/config.json"
# Use Homekit identity from balenaCloud
HOMEKIT_PIN=${HOMEKIT_PIN:-"000-00-000"}
HOMEKIT_USER=${HOMEKIT_USER:-"00:11:22:33:44:55"}
# Retrieve config.json from the given URL
CONFIG_URL=${CONFIG_URL:-""}
# Keep config as specified in balenaCloud
KEEP_CONFIG=${KEEP_CONFIG:-yes}

cd "$WORKING_DIR"

# Setup Homebridge
if [ -d "${HOMEBRIDGE_DIR}" ] ; then
  # Homebridge directory exists
  echo "Homebridge is already configured at \"${HOMEBRIDGE_DIR}\"."
  if [ "${KEEP_CONFIG}" == "no" ] ; then
    echo "Replacing ${CONFIG_JSON} with default configuration."
    cp .homebridge/config.json ${CONFIG_JSON}
    if [ -n "${CONFIG_URL}" ] ; then
      curl -o ${CONFIG_JSON} "${CONFIG_URL}" \
        || echo "Unable to download configuration from ${CONFIG_URL}"
    fi
  else
    echo "Run \"Purge Data\" and then \"Restart\" action to reset to default configuration."
  fi
else
  # Homebridge directory does not exist
  echo "Homebridge is not configured."
  echo "Creating Homebridge directory at \"${HOMEBRIDGE_DIR}\"."
  mkdir -p ${HOMEBRIDGE_DIR}
  echo "Copying Homebridge configuration"
  cp .homebridge/* ${HOMEBRIDGE_DIR}
  if [ -n "${CONFIG_URL}" ] ; then
    curl -o ${CONFIG_JSON} "${CONFIG_URL}" \
      || echo "Unable to download configuration from ${CONFIG_URL}"
  fi
fi

# Always update PIN and USERNAME to match balenaCloud
cp ${CONFIG_JSON} /tmp/config.json
cat /tmp/config.json \
  | jq ".bridge.pin = \"${HOMEKIT_PIN}\" | .bridge.username = \"${HOMEKIT_USER}\"" > ${CONFIG_JSON}
rm /tmp/config.json
