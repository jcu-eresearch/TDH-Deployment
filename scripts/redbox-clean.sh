#!/bin/bash

SCRIPT_DIR=$(cd  $(dirname $0) ; pwd -P)
source $SCRIPT_DIR/redbox-setup.sh

if [ ! -z  $PROJECT_DIR  ]
then
    rm -Rf $PROJECT_DIR
fi
