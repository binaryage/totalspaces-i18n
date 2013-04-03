#!/bin/bash

TOTALSPACES_RESOURCES='/Applications/TotalSpaces.app/Contents/Resources'
TOTALSPACES_RESOURCES_BACKUP='/Applications/TotalSpaces.app/Contents/ResourcesOrig'

if [ -d "$TOTALSPACES_RESOURCES" ]; then # is it a folder?
  if [ -L "$TOTALSPACES_RESOURCES" ]; then # is it a symlink?
    sudo rm "$TOTALSPACES_RESOURCES"
    sudo mv "$TOTALSPACES_RESOURCES_BACKUP" "$TOTALSPACES_RESOURCES"
    exit
  fi
fi

echo "Failed: TotalSpaces is not installed or not in dev mode"
