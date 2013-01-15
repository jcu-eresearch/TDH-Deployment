#!/bin/sh

SETTINGS_DIR="~/.tdh-deploy-settings"
SETTINGS_NAME=redbox-settings.sh
SETTINGS=$SETTINGS_DIR/$SETTINGS_NAME

SCRIPT_DIR=$(cd  $(dirname $0) ; pwd -P)

if [ ! -a "$SETTINGS" ]
then
    echo "Creating ReDBoX Deployment Settings..."
    mkdir -p $SETTINGS_DIR
    cp $SCRIPT_DIR/$SETTINGS_NAME $SETTINGS
fi

echo "Settings Directory: $SETTINGS"
source $SETTINGS
echo "Project Directory: $PROJECT_HOME"

