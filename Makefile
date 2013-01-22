SHELL:=/bin/bash

INSTUTIONAL_BUILD_DIR=$(shell cd TDH-Research-Data-Catalogue.git; pwd)

all: install

clean:
	mvn -f deployment/pom.xml clean

dclean:
	pushd TDH-Research-Data-Catalogue.git;\
	mvn clean;\
	popd

install: clean
	mvn -f deployment/pom.xml install

compile: clean
	mvn -f deployment/pom.xml compile

deploy: install dclean
	deployment/scripts/redbox-deploy.sh $(INSTUTIONAL_BUILD_DIR)

get-rifcs:
    deployment/scripts/redbox-rifcs.sh $(INSTUTIONAL_BUILD_DIR)