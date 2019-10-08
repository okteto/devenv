#!/bin/sh

set -e

echo "Creating marker file $OKTETO_MARKER_PATH ..."
touch $OKTETO_MARKER_PATH

syncthingHome=/var/syncthing
echo "Copying configuration files to $syncthingHome ..."
cp /var/syncthing/secret/* $syncthingHome

echo "Executing syncthing..." 
/var/okteto/bin/syncthing -home $syncthingHome -gui-address 0.0.0.0:8384
