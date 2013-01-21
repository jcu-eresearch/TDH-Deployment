#!/bin/sh

SCRIPT_DIR=$(cd  $(dirname $0) ; pwd -P)
source $SCRIPT_DIR/mint-setup.sh

if [ ! -z  $PROJECT_DIR  ]
then
    cat $INSTITUTIONAL_BUILD_DIR/.project-home
    $PROJECT_DIR/server/jcu_init_harvest.sh
fi
