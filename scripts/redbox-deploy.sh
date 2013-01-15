#!/bin/sh

SCRIPT_DIR=$(cd  $(dirname $0) ; pwd -P)
source $SCRIPT_DIR/redbox-setup.sh

INSTITUTIONAL_BUILD_DIR=$1

echo "Instutional Build Directory: $INSTITUTIONAL_BUILD_DIR"

$SCRIPT_DIR/redbox-shutdown.sh && $SCRIPT_DIR/redbox-clean.sh

if [ $? -eq 0 ]
then
    pushd  $INSTITUTIONAL_BUILD_DIR
    mvn -Dproject.home=$PROJECT_HOME package
else
    echo "An Error occoured..."
fi

