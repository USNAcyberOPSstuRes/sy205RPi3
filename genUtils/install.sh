#!/usr/bin/env bash

# Description: Install USNA SY205 utilities
# Arguments:
#   (none)
# Return:
#   (none)

function main () {
	# Description: Main control flow
	# Arguments:
	#   (none)
	# Return:
	#   (none)

	printf "Installing...\n"
	createDirs
	addBins
	printf "...Complete\n"
}

function createDirs () {
	# Description: Create course related directories
	# Arguments:
	#   (none)
	# Return:
	#   (none)

	if [ ! -e ~/bin ] ; then
		mkdir ~/bin
	fi
	if [ ! -e ~/bin/include ] ; then
		mkdir -p ~/bin/include
	fi
}

function addBins () {
	# Description: Add binaries to ~/bin
	# Arguments:
	#   (none)
	# Return:
	#   (none)

	if [ -d ~/bin ] ; then
		if [ ! -e ~/bin/updateHostname.sh ] ; then
			ln -s `pwd`/updateHostname.sh ~/bin
		fi
		if [ ! -e ~/bin/deptUNIXMount ] ; then
			ln -s `pwd`/deptUNIXMount ~/bin
		fi
		if [ ! -e ~/bin/deptUNIXUnmount ] ; then
			ln -s `pwd`/deptUNIXUnmount ~/bin
		fi
	fi
}

# Call main
main ${@}
