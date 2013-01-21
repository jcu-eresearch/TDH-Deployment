#!/bin/sh

SCRIPT_DIR=$(cd  $(dirname $0) ; pwd -P)
source $SCRIPT_DIR/mint-setup.sh

if [ ! -z  $PROJECT_DIR  ]
then
    echo "Stopping Mint..."
    cat $INSTITUTIONAL_BUILD_DIR/.project-home

    $PROJECT_DIR/server/tf.sh start
    if [ $? -eq 0 ]
    then
        source $PROJECT_DIR/system/redhat/mint
        while [ -z `netstat -tln | grep ${LOCAL_PORT} | cut -f 1 -d " "` ]; do echo -n "."; sleep 1; done
        ${PROJECT_DIR}/server/initserver.sh ${MINT_HOSTNAME} ${LOCAL_PORT} ${MINT_CONTEXT} &> /dev/null &
    else
        echo "Failed to start mint..."
        exit 3
    fi
else
    echo "The PROJECT_DIR variable is not set..."
    exit 4
fi