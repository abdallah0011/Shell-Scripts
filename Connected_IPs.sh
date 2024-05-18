#!/bin/bash

# Usage <filename> <range_of_ips> <count_of_pings> <time_before_timeout>

# default values
range=10
count=1
timeout=1

if [[ ! -z $1 ]]
then
range=$1
fi

if [[ ! -z $2 ]]
then
count=$2
fi

if [[ ! -z $3 ]]
then
timeout=$3
fi

# echo "${range} ,${count}, ${timeout}"
SUCCESS=" 0% packet"


for (( i=1; i <= $range; i++))
do
    var=$(ping "192.168.1.${i}" -c ${count} -W ${timeout})
    # echo $var
    if [[ $var == *${SUCCESS}* ]]
    then 
    echo "192.168.1.${i} is connected"
    else
    echo "192.168.1.${i} is not connected"
    fi
done

echo "Done"

