find . -name "*.C10" -exec bash -c 'mv "$1" "${1%.C10}".CAS' - '{}' \;
find . -name "*.c10" -exec bash -c 'mv "$1" "${1%.c10}".CAS' - '{}' \;
find . -name "*.cas" -exec bash -c 'mv "$1" "${1%.cas}".CAS' - '{}' \;


