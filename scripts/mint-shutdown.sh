#!/bin/sh

SCRIPT_DIR=$(cd  $(dirname $0) ; pwd -P)
source $SCRIPT_DIR/mint-setup.sh

if [ ! -z  $PROJECT_DIR  ] && [ -e  $PROJECT_DIR ]
then
    echo "Stopping Mint..."
    cat $INSTITUTIONAL_BUILD_DIR/.project-home
    $PROJECT_DIR/server/tf.sh stop
fi
