#!/bin/sh

set -e
remote=0
while getopts ":r" opt; do
  case $opt in
    r)
      remote=1
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
  esac
done

echo "Creating marker file $OKTETO_MARKER_PATH ..."
touch $OKTETO_MARKER_PATH

syncthingHome=/var/syncthing
echo "Copying configuration files to $syncthingHome ..."
cp /var/syncthing/secret/* $syncthingHome

if [ $remote -eq 1 ]; then
echo "Executing remote..." 
/var/okteto/bin/remote &
fi

echo "Executing syncthing..." 
/var/okteto/bin/syncthing -home $syncthingHome -gui-address 0.0.0.0:8384 -verbose

