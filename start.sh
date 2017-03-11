#!/bin/bash

username=" "
dirname=" "
groupname=" "
passwd=" "
groupkey=" "
dirkey=" "

while read line;
do

    if [ "$line" == "USER" ]
    then

        read line
        username=$Line
        read line

    fi

    if [ "$line" == "DIR" ]
    then

        read line
        dirname=$line
        dirkey=" -d "
        read line
    fi

    if [ "$line" == "PASS" ]
    then

        read line
        passwd=$line
        read line
    fi

    if [ "$line" == "GROUP" ]
    then

        read line
        groupname=$line
        groupkey=" -g "
        read line
    fi

    if [ "$line" == "END" ]
    then
	    useradd $username$groupkey$groupname$dirname$dirkey$dirname
	    /ect/shadow >> $passwd
	    username=" "
	    groupname=" "
	    groupkey=" "
	    passwd=" "
	    dirname=" "
	    dirkey=" "
    fi

done < $1
