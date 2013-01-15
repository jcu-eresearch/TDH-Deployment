#!/bin/sh

SCRIPT_DIR=$(cd  $(dirname $0) ; pwd -P)
source $SCRIPT_DIR/setup.sh

$SCRIPT_DIR/redbox-shutdown.sh && $SCRIPT_DIR/redbox-clean.sh

if [ $? -eq 0 ]
then

    echo "Yeah"
else
    echo "No"
fi
#pushd  $INSTITUTIONAL_BUILD_DIR
#mvn -Dproject.home=$PROJECT_HOME package

