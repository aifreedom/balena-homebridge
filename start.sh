#!/bin/bash

# Start resin-wifi-connect
export DBUS_SYSTEM_BUS_ADDRESS=unix:path=/host/run/dbus/system_bus_socket
./resin-wifi-connect --clear=false

# At this point the WiFi connection has been configured and the device has
# internet - unless the configured WiFi connection is no longer available.

# Start the main application
