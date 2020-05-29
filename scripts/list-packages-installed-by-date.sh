clear

# get name of script and place it into a variable
scriptname=`basename "$0"`

if [ $# -eq 0 ]; then
    echo "No date provided."
    echo
    echo syntax:
    echo
    echo "./$scriptname yyyy-mm-dd"
    echo
    exit 1
fi



echo Listing all packages installed on: $1

# list packages
grep "$1.*.install " /var/log/dpkg.log | awk '{ print $4 }' | cut -d: -f1

echo
read -p "Press any key to continue to continue with purge of packages or [CTRL-C] to abort." -n1 -s
echo
echo


# remove packages (careful)

# dry-run option enabled
#sudo  grep "$1.*.install " /var/log/dpkg.log | awk '{ print $4 }' | cut -d: -f1 | xargs sudo apt-get --dry-run purge

sudo  grep "$1.*.install " /var/log/dpkg.log | awk '{ print $4 }' | cut -d: -f1 | xargs sudo apt-get purge -y
