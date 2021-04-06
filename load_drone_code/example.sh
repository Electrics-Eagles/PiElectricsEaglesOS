FILE=/etc/pielectricseagles/config.ini
if test -f "$FILE"; then
    echo config detected > /dev/kmsg
    echo config detected
    exit 
else
	  then echo Fatal error (code : NCFD) (create config file please) > /dev/kmsg
	  	   echo Fatal error (code : NCFD) (create config file please) 
	  	   exit  

fi


FILE=/var/pielectricseagles/pielectricseagles.log
if test -f "$FILE"; then
    echo log file detected > /dev/kmsg
    echo log file detected
    sudo mv /var/pielectricseagles/pielectricseagles.log backup.log
    echo log moved to backup.log

else
	  then echo Warring (code : NLFD) (create config file please) > /dev/kmsg
	  	   echo Warring (code : NLFD) (create config file please)
	  	   echo > /var/pielectricseagles/pielectricseagles.log

	  	   

fi


FILE=/etc/pielectricseagles/config.ini
if test -f "$FILE"; then
    echo config detected > /dev/kmsg
    echo config detected
    exit 
else
	  then echo Fatal error (code : NCFD) (create config file please) > /dev/kmsg && echo Fatal error (code : NCFD) (create config file please) && exit
fi


FILE=/var/pielectricseagles/pielectricseagles.log
if test -f "$FILE"; then
    echo log file detected > /dev/kmsg
    echo log file detected
    sudo mv /var/pielectricseagles/pielectricseagles.log backup.log
    echo log moved to backup.log

else
	  then echo Warring (code : NLFD) (create config file please) > /dev/kmsg && echo Warring (code : NLFD) (create config file please) && echo > /var/pielectricseagles/pielectricseagles.log
fi