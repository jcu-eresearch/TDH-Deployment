TDH-Deployment
====

This repository contains various files and scripts to assist in the deployment
of our redbox services. It uses the git-repo tool 
* http://code.google.com/p/git-repo/

repo
----
To install the repo tool:

	#> mkdir ~/bin
	#> wget https://dl-ssl.google.com/dl/googlesource/git-repo/repo -O ~/bin/repo
	#> chmod +x ~/bin/repo

Ensure that ~/bin is in the PATH variable.

ReDBoX
====
Find the branch for the version you wish to deploy. In this example we will be 
using `redbox-1.5.2.2`:

	#> mkdir redbox
	#> cd redbox
	#> repo init -u https://github.com/jcu-eresearch/TDH-Deployment.git -b redbox-1.5.2.2
	#> repo sync
	#> make

Mint
====
Find the branch for the version you wish to deploy. In this example we will be 
using `mint-1.5.2.2`:

	#> mkdir mint
	#> cd mint
	#> repo init -u https://github.com/jcu-eresearch/TDH-Deployment.git -b mint-1.5.2.2
	#> repo sync
	#> make



