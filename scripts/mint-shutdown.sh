#!/bin/sh

SCRIPT_DIR=$(cd  $(dirname $0) ; pwd -P)
source $SCRIPT_DIR/mint-setup.sh

if [ ! -z  $PROJECT_HOME  ]
then
    echo "Stopping Mint..."
    cat $INSTITUTIONAL_BUILD_DIR/.project-home
    $PROJECT_HOME/server/tf.sh stop
fi