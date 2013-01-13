SHELL:=/bin/bash

all: install

clean:
	mvn -f deployment/pom.xml clean

install: clean
	mvn -f deployment/pom.xml install

compile: clean
	mvn -f deployment/pom.xml compile
