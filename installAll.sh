#!/bin/sh

aurhelper=paru
programsfile=programs.csv

trap userbreak SIGINT SIGTERM

function installpkg(){
	sudo pacman --noconfirm --needed -S "$1"
}

function aurinstall(){
	echo "Installing AUR package:  "  "$1"
	$aurhelper --noconfirm --needed -S "$1"
}

function maininstall(){
	echo "Installing package:  "  "$1"
	installpkg "$1"
}

function installationloop(){
	[ ! -f $programsfile ] && { echo "$programsfile file not found"; exit 99; }
	sed -e '/^#/d;$a\' $programsfile | while IFS=\; read -r category program; do
		echo $category
		case "$category" in
			"A") aurinstall "$program";;
			"S") echo "########  Installing $program Programs  ########";;
			*) maininstall "$program";;
		esac
	done
}

function userbreak(){
	echo "Cancelling..."
	exit 130
}


installationloop