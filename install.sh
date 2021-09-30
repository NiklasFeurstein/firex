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

function afterInstall(){
	# embable sddm
	sh ./scripts/500-enable-sddm.sh

	# copy personal folder
	copysettings
}

function copysettings(){
	echo "Installing Personal Settings"
	cd scripts
	sh ./900-install-personal-settings-v2.sh
	cd ..
}

function beforeInstall(){
	# Increase package build speed
	sh ./scripts/000-use-all-cores-makepkg-conf-v4.sh

	# Install Paru
	sh ./scripts/001-install-paru.sh
}

function userbreak(){
	echo "Cancelling..."
	exit 130
}

beforeInstall
installationloop
afterInstall
