#!/bin/sh

SCRIPT_DIR=$(cd  $(dirname $0) ; pwd -P)
source $SCRIPT_DIR/setup.sh

if [ -a  $PROJECT_HOME ]
then
    echo "Stopping ReDBoX..."
    $PROJECT_HOME/server/tf.sh stop
fi
