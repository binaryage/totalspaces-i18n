#!/bin/bash
TOTALSPACES_RESOURCES='/Applications/TotalSpaces.app/Contents/Resources'
TOTALSPACES_RESOURCES_BACKUP='/Applications/TotalSpaces.app/Contents/ResourcesOrig'

# need absolute path of the repo's root
pushd . > /dev/null
cd "$(dirname "$0")"
cd ..
ROOT=$PWD

if [ ! -d "$TOTALSPACES_RESOURCES" ]; then # is it a folder?
  echo "Please install TotalSpaces. Folder '$TOTALSPACES_RESOURCES' not found".
  popd > /dev/null
  exit
fi

if [ -L "$TOTALSPACES_RESOURCES" ]; then # is is a symlink?
  echo "TotalSpaces is already in dev mode. Folder '$TOTALSPACES_RESOURCES' is a symlink! Exiting.".
  popd > /dev/null
  exit
fi

# ok, we should be safe to do the replacement
sudo mv "$TOTALSPACES_RESOURCES" "$TOTALSPACES_RESOURCES_BACKUP"
sudo ln -s "$ROOT/app" "$TOTALSPACES_RESOURCES"
sudo cp "$TOTALSPACES_RESOURCES_BACKUP/"*.nib "$TOTALSPACES_RESOURCES"
sudo cp "$TOTALSPACES_RESOURCES_BACKUP/"*.png "$TOTALSPACES_RESOURCES"
sudo cp "$TOTALSPACES_RESOURCES_BACKUP/"*.plist "$TOTALSPACES_RESOURCES"
sudo cp "$TOTALSPACES_RESOURCES_BACKUP/"*.html "$TOTALSPACES_RESOURCES"
sudo cp "$TOTALSPACES_RESOURCES_BACKUP/"*.icns "$TOTALSPACES_RESOURCES"
sudo cp "$TOTALSPACES_RESOURCES_BACKUP/"*.pem "$TOTALSPACES_RESOURCES"
sudo cp "$TOTALSPACES_RESOURCES_BACKUP/"*.applescript "$TOTALSPACES_RESOURCES"
sudo cp "$TOTALSPACES_RESOURCES_BACKUP/"*.scpt "$TOTALSPACES_RESOURCES"
sudo cp -r "$TOTALSPACES_RESOURCES_BACKUP/"*.app "$TOTALSPACES_RESOURCES"

popd > /dev/null
