#!/bin/sh

SCRIPT_DIR=$(cd  $(dirname $0) ; pwd -P)
source $SCRIPT_DIR/redbox-setup.sh

if [ ! -z  $PROJECT_DIR  ]
then
    echo "Stopping ReDBoX..."
    cat $INSTITUTIONAL_BUILD_DIR/.project-home
    $PROJECT_DIR/server/tf.sh stop
fi
