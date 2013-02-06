#!/bin/sh

SCRIPT_DIR=$(cd  $(dirname $0) ; pwd -P)
export INSTITUTIONAL_BUILD_DIR=$1
source $SCRIPT_DIR/redbox-setup.sh

echo "Instutional Build Directory: $INSTITUTIONAL_BUILD_DIR"

$SCRIPT_DIR/redbox-shutdown.sh && $SCRIPT_DIR/redbox-clean.sh

if [ $? -eq 0 ]
then
    pushd  $INSTITUTIONAL_BUILD_DIR
    mvn $DEPLOY_MAVEN_OPTS package
    popd
else
    echo "An Error occoured..."
    exit 5
fi

if [ ! -z $RUN_AS_ROOT ]
then
    echo "Not setting user..."
else
    for i in $PROJECT_DIR/system/*/redbox
    do
        echo "Updating \$USER in " $i
        sed -i "s/USER=\"\"/USER=\"$USER\"\n/g" $i
    done
fi
