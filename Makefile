SHELL:=/bin/bash

PROJECTS=$(shell ls | grep git )

all: install

clean:
	mvn -f deployment/pom.xml clean

dclean:
	mvn -f TDH-Research-Data-Catalogue.git/pom.xml clean

install: clean
	mvn -f deployment/pom.xml install

compile: clean
	mvn -f deployment/pom.xml compile

deploy: install dclean
	deployment/scripts/redbox-deploy.sh $(shell cd TDH-Research-Data-Catalogue.git; pwd)
