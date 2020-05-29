function fileChooser(){
  local __DIR=$1
  local __RESULT=$(dialog --clear --title "Audio file browser" --stdout \
                   --title "Audio file browser - choose file"\
                   --fselect $__DIR 20 60)

  echo $__RESULT
}

RESULT=$( fileChooser $PWD/ )

while [ -d "$RESULT" ]
do
  RESULT=$( fileChooser "$RESULT/" )
done

echo $RESULT

