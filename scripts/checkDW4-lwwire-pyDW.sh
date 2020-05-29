sleep 2s

ps_out=`ps -ef | grep pyDriveWire | grep -v 'grep' | grep -v $0`
result=$(echo $ps_out | grep "$1")
if [[ "$result" != "" ]];then
    echo -e "pyDriveWire is running"
else
    echo -e "pyDriveWire is not running"
fi


ps_out=`ps -ef | grep DW4UI | grep -v 'grep' | grep -v $0`
result=$(echo $ps_out | grep "$1")
if [[ "$result" != "" ]];then
    echo -e "DriveWire 4 is running"
else
    echo -e "DriveWire 4 is not running"
fi


ps_out=`ps -ef | grep lwwire | grep -v 'grep' | grep -v $0`
result=$(echo $ps_out | grep "$1")
if [[ "$result" != "" ]];then
    echo -e "lwwire is running"
else
    echo -e "lwwire is not running"
fi


ps_out=`ps -ef | grep emceed | grep -v 'grep' | grep -v $0`
result=$(echo $ps_out | grep "$1")
if [[ "$result" != "" ]];then
    echo -e "emceed is running"
else
    echo -e "emceed is not running"
fi

echo

cd $HOME/.mame

