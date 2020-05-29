find . -depth -type d -name '*CoCoPi*' -execdir bash -c 'mv -v "$1" "${1//CoCoPi/CoCoPi}"' _ {} \;
