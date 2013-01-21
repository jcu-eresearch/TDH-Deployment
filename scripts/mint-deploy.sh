#!/bin/sh

SCRIPT_DIR=$(cd  $(dirname $0) ; pwd -P)
export INSTITUTIONAL_BUILD_DIR=$1
source $SCRIPT_DIR/mint-setup.sh

test_for_root "You are deploying as root. Do you want to continue (Y/N)?"

echo "Instutional Build Directory: $INSTITUTIONAL_BUILD_DIR"

$SCRIPT_DIR/mint-shutdown.sh && $SCRIPT_DIR/mint-clean.sh

if [ $? -eq 0 ]
then
    pushd  $INSTITUTIONAL_BUILD_DIR
    mvn $DEPLOY_MAVEN_OPTS package
    popd
else
    echo "An Error occoured..."
    exit 1
fi

if [ ! -z $RUN_AS_ROOT ]
then
    echo "Not setting user..."
else
    for i in $PROJECT_DIR/system/*/mint
    do
        echo "Updating \$USER in " $i
        sed -i "s/USER=\"\"/USER=\"$USER\"/g" $i
    done
fi

if [ $? -eq 0 ]
then
    $SCRIPT_DIR/mint-startup.sh && $SCRIPT_DIR/mint-populate.sh
fi



