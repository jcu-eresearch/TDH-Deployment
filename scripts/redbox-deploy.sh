#!/bin/sh

SETTINGS_DIR=~/.tdh-deploy-settings
SETTINGS_NAME=redbox-settings.sh
SETTINGS=$SETTINGS_DIR/$SETTINGS_NAME

SCRIPT_DIR=$(cd  $(dirname $0) ; pwd -P)

INSTITUTIONAL_BUILD_DIR=$1

if [ ! -a "$SETTINGS" ]
then
    echo "Creating ReDBoX Deployment Settings..."
    mkdir -p $SETTINGS_DIR
    echo cp $SCRIPT_DIR/$SETTINGS_NAME $SETTINGS
    cp $SCRIPT_DIR/$SETTINGS_NAME $SETTINGS
fi

echo "Settings File: $SETTINGS"
source $SETTINGS
echo "Project Directory: $PROJECT_HOME"

if [ -z $PROJECT_HOME ]
then
    echo "PROJECT_HOME variable not set"
    exit 2
fi

if [ -a  $PROJECT_HOME ]
then
    echo "Stopping ReDBoX..."
    $PROJECT_HOME/server/tf.sh stop
    echo "Clean up old deployment... waiting for 5 seconds"
    for count in 5 4 3 2 1
    do
        echo -n $count
        sleep 1
        echo -n -e \\b
    done
    echo "Removing $PROJECT_HOME"
    rm -Rf  $PROJECT_HOME
fi


pushd  $INSTITUTIONAL_BUILD_DIR
mvn -Dproject.home=$PROJECT_HOME package

