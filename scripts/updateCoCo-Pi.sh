#!/bin/bash

# script to update CoCo-Pi from github repo

# make sure to be in /home/pi
cd $HOME

#git pull origin master
#git diff --name-only origin/master

# new way
git fetch --all
git reset --hard origin/master
git pull origin master

echo -e
echo -e
read -p "Press any key to continue... " -n1 -s
echo -e

