find . -type f -name "*.sh" -print0 | xargs -0 sed -i'' -e 's/CocoPi/CoCoPi/g'
