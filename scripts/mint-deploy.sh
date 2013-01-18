#!/bin/sh

SCRIPT_DIR=$(cd  $(dirname $0) ; pwd -P)
export INSTITUTIONAL_BUILD_DIR=$1
source $SCRIPT_DIR/redbox-setup.sh

echo "Instutional Build Directory: $INSTITUTIONAL_BUILD_DIR"

$SCRIPT_DIR/mint-shutdown.sh && $SCRIPT_DIR/mint-clean.sh

if [ $? -eq 0 ]
then
    pushd  $INSTITUTIONAL_BUILD_DIR
    mvn $DEPLOY_MAVEN_OPTS package
    popd
else
    echo "An Error occoured..."
fi



