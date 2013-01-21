#!/bin/sh

SCRIPT_DIR=$(cd  $(dirname $0) ; pwd -P)
source $SCRIPT_DIR/mint-setup.sh

if [ ! -z  $PROJECT_DIR  ]
then
    cat $INSTITUTIONAL_BUILD_DIR/.project-home
    $PROJECT_DIR/server/jcu_init_harvest.sh
    if [ $? -eq 0 ]
    then
        if [ ! -e ~/.geonames ]
        then

            echo -n "Enter location of allCountries.zip file [~/allCountries.zip]: "
            read LOC
            if [ -x $LOC ]
            then
                ALL_COUNTRIES=~/allCountries.zip
            else
                ALL_COUNTRIES=$LOC
            fi
            echo "ALL_COUNTRIES=$ALL_COUNTRIES" >> ~/.geonames
        fi
        if [ -e ~/.geonames ]
        then
            source ~/.geonames
            if [ ! -e $ALL_COUNTRIES ]
            then
                wget http://download.geonames.org/export/dump/allCountries.zip -O $ALL_COUNTRIES
            fi
            if [ -e $ALL_COUNTRIES ]
            then
                echo "Downloaded allCountries.zip"
                pushd $PROJECT_DIR/server
                unzip $ALL_COUNTRIES
                ./geo_harvest.sh allCountries.txt
                rm allCountries.txt
                popd
            else
                echo "An error ocoured whilst trying to ingest all countries data...."
                exit 5
            fi
        fi
    fi
fi
