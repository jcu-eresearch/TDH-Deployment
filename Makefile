SHELL:=/bin/bash

all: install

clean:
	mvn -f deployment/pom.xml clean

dclean:
	pushd TDH-Name-Authority.git;\
	mvn clean;\
	popd

install: clean
	mvn -f deployment/pom.xml install

compile: clean
	mvn -f deployment/pom.xml compile

deploy: install dclean
	deployment/scripts/mint-deploy.sh $(shell cd TDH-Name-Authority.git; pwd)
