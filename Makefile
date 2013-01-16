SHELL:=/bin/bash

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
	deployment/scripts/redbox-deploy.sh $(shell cd TDH-Research-Data-Catalogue.git; pwd)
