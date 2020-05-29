#!/bin/bash

# this script will remove X permission from all files (not dirs) and change group ownership to 'users'
# you need to be in the root folder of the directory you wish to process

# old way
#find . -type f -exec chmod -x {} \;

# new way
chmod -R -x+X *
chmod -R o-w,g+w,a+r *
chown -R pi.users *

