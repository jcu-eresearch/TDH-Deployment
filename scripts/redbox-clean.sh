#!/bin/sh
SCRIPT_DIR=$(cd  $(dirname $0) ; pwd -P)
source $SCRIPT_DIR/redbox-setup.sh
exit 1
echo "Clean up old deployment... waiting for 5 seconds"
for count in 5 4 3 2 1
do
    echo -n $count
    sleep 1
    echo -n -e \\b
done
echo "Removing $PROJECT_HOME"
rm -Rf  $PROJECT_HOME
