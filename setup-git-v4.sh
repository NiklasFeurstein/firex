#!/bin/bash  
#
##################################################################################################################
# Written to be used on 64 bits computers
# Author 	: 	Erik Dubois
# Website 	: 	http://www.erikdubois.be
##################################################################################################################
##################################################################################################################
#
#   DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.
#
##################################################################################################################

# Problem solving commands

# Read before using it.
# https://www.atlassian.com/git/tutorials/undoing-changes/git-reset
# git reset --hard orgin/master
# ONLY if you are very sure and no coworkers are on your github.

# Command that have helped in the past
# Force git to overwrite local files on pull - no merge
# git fetch all
# git push --set-upstream origin master
# git reset --hard orgin/master

echo "####################################"
echo "Full Name"
echo "####################################"
read -p "Input: " fullname

echo "####################################"
echo "Email"
echo "####################################"
read -p "Input: " email

git config --global pull.rebase false
git config --global user.name "$fullname"
echo "$fullname"
echo "$email"
git config --global user.email "$email"
sudo git config --system core.editor nano
git config --global credential.helper cache
git config --global credential.helper 'cache --timeout=32000'
git config --global push.default simple

echo "If you made a mistake rerun (if problem --> delete ~/.gitconfig)"

echo "################################################################"
echo "###################    T H E   E N D      ######################"
echo "######     Create SSH Key For Connection Yourself      #########"
echo "################################################################"