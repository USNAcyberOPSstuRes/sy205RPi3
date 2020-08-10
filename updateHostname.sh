#!/usr/bin/env bash

# Author: LCDR C. W. Hoffmeister
# Description: Check and update hostname if needed

# Setup Required Variables
crsName="sy205"
sep="-"
hostMAC=""
desiredHostName=""

# Update hostMAC
function updateHostMAC() {
	# Find and trim host MAC address
	hostMAC=$( ifconfig | grep eth0 | cut -d " " -f 11 | cut -d ":" -f 4,5,6 | tr -d ":" )
	if [ ${hostMAC} == "" ] ; then
		hostMAC="error"
		return 1
	fi
	return 0
}

# Check for good hostname
function validHostname() {
	desiredHostName=${crsName}${sep}${hostMAC}
	if [ ${desiredHostName} != ${1} ]; then
		return 1
	fi
	return 0
}

# Set hostname, reboot
function setupHostname() {
	echo ${desiredHostName} | sudo tee /etc/hostname
	sudo shutdown -r now
	return 0
}

# main Function
function main() {
	updateHostMAC
	validHostname $( hostname ) || setupHostname
}

# Call main Function
main ${@}
