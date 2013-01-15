#!/bin/sh

SCRIPT_DIR=$(cd  $(dirname $0) ; pwd -P)
source $SCRIPT_DIR/setup.sh

$SCRIPT_DIR/redbox-shutdown.sh
$SCRIPT_DIR/redbox-clean.sh

echo "Yeah"
#pushd  $INSTITUTIONAL_BUILD_DIR
#mvn -Dproject.home=$PROJECT_HOME package

