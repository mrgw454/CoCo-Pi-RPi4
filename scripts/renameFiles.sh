find . -depth -type f -name '*CoCoPi*' -execdir bash -c 'mv -v "$1" "${1//CoCoPi/CoCoPi}"' _ {} \;
