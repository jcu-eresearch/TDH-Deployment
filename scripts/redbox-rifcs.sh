#!/bin/bash

SCRIPT_DIR=$(cd  $(dirname $0) ; pwd -P)
export INSTITUTIONAL_BUILD_DIR=$1
source $SCRIPT_DIR/redbox-setup.sh


if [ ! -e ~/.rifpython ]
then
    DEF_PATH=`which python`
    echo -n "Enter the python executable path [$DEF_PATH]: "
    read LOC
    if [ -x $LOC ]
    then
        RIF_PYTHON=$DEF_PATH
    else
        RIF_PYTHON=$LOC
    fi
    echo "RIF_PYTHON=$RIF_PYTHON" >> ~/.rifpython
fi
if [  -e ~/.rifpython ]
then
    source ~/.rifpython
else
    echo "An error occoured trying to generate the rifcs import files..."
    exit 6
fi

$RIF_PYTHON -c "import lxml, requests, argparse"
LIBS_INSTALLED=$?

if [ $LIBS_INSTALLED -ne 0 ]
then
    echo "ERROR: The python executable $RIF_PYTHON does not have access to the required modules: lxml, requests, argparse."
    echo "exiting..."
    exit 7
fi


mkdir -p rifcs/processed
pushd rifcs
pwd
if [ ! -e jcu-rifcs.rif ]
then
    wget -O jcu-rifcs.rif  https://eresearch.jcu.edu.au/tdh/data/@@rifcs?days_in_past=all
fi
$RIF_PYTHON $INSTITUTIONAL_BUILD_DIR/src/main/python/bin/rifsplit.py jcu-rifcs.rif
$RIF_PYTHON $INSTITUTIONAL_BUILD_DIR/src/main/python/bin/process_rif_cs.py -o processed output/collection*.rif
popd