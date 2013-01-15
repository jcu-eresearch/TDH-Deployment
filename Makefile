SHELL:=/bin/bash

all: install

clean:
	mvn -f deployment/pom.xml clean
	mvn -f TDH-Research-Data-Catalogue.git/pom.xml clean

install: clean
	mvn -f deployment/pom.xml install

compile: clean
	mvn -f deployment/pom.xml compile

deploy:
	deployment/scripts/redbox-deploy.sh $(cd TDH-Research-Data-Catalogue.git; pwd)
