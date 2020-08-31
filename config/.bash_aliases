#!/usr/bin/env bash

# Description: Setup USNA SY205 bash environment
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

	setupEnvVars
	setupAliases
}

function setupEnvVars () {
	# Description: Setup environment variables
	# Arguments:
	#   (none)
	# Return:
	#   (none)

	setupPath
	## Setup Prompt
	export PS1="[\#] \u@\h:\W \$ "
	# Environment Variables
	export COURSE_NUM_UPPER="SY205"
	export COURSE_NUM_LOWER="sy205"
	export COURSE_REPO_DIR="~/${COURSE_NUM_LOWER}Resources"
}

function setupPath () {
	# Description: Setup PATH
	# Arguments:
	#   (none)
	# Return:
	#   (none)

	if [ -d ~/bin ] ; then  # Enable user ~/bin
		PATH="${PATH}:~/bin"
	fi
	if [ -d ~/bin/include ] ; then  # Enable user ~/bin/include
		PATH="${PATH}:~/bin/include"
	fi
	export PATH
}

function setupAliases () {
	# Description: Setup environment variables
	# Arguments:
	#   (none)
	# Return:
	#   (none)

	setupCmdSafety
	setupAutoDevSecOPS
}

function setupCmdSafety () {
	# Description: Setup command safety aliases
	# Arguments:
	#   (none)
	# Return:
	#   (none)

	alias cp='cp -i'  # Prompt for overwrite
	alias mv='mv -i'  # Prompt for overwrite
	alias rm='rm -i'  # Prompt for remove
}

function setupAutoDevSecOPS () {
	# Description: Setup auto DevSecOPS command aliases
	# Arguments:
	#   (none)
	# Return:
	#   (none)

	alias make${COURSE_NUM_UPPER}="make -f ${COURSE_REPO_DIR}/genUtils/Makefile"
}

# Call main
main
