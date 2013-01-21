#!/bin/sh

SCRIPT_DIR=$(cd  $(dirname $0) ; pwd -P)
source $SCRIPT_DIR/mint-setup.sh

if [ ! -z  $PROJECT_DIR ] && [ -e  $PROJECT_DIR ]
then
    rm -Rf $PROJECT_DIR
fi
