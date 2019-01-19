#!/bin/bash

curl -X POST --header "Content-Type:application/json" \
  --data "{\"appId\": ${BALENA_APP_ID}}" \
  "${BALENA_SUPERVISOR_ADDRESS}/v1/restart?apikey=${BALENA_SUPERVISOR_API_KEY}"
  