#!/bin/bash
Battery_val=$(acpi -b | cut -d " " -f 4)
# echo $Battery_val

var=${Battery_val::-1} # remove (%)

echo $var
while [ true ]
do
    if [ ${var} -lt 120 ]
    then
        notify-send "Battery less than 50%, connect the charger"    
        sleep 5
        acpi -a | grep "on"
        if [ $? -eq 0 ]
        then
            notify-send "Charger is connected"
            break
        fi
    fi
done