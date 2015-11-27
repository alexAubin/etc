#!/bin/sh
# wmfs status
# inspired by addikt1ve, rhaamo, linkdd and some others

# volume
_volume() {

    status=`amixer -c 0 sget 'Master' | tail -n1 | awk '{ print $6 }' | sed -re 's/^\[*//' | cut -d\] -f1`
    if [[ $status == on ]]; then
        vol=`amixer -c 0 sget 'Master' | tail -n1 | awk '{ print $4 }' | sed -re 's/^\[*//' | cut -d\] -f1`
    else
        vol="mute"
    fi

    color="#5ca8a7"

    volume="^s[right;$color;vol $vol]"
}

# memory used
_memory() {
    total=`free -m -t | head -n2 | tail -n1 | awk '{print $2}'`
    used=`free -m -t | head -n2 | tail -n1 | awk '{print $3}'`
    mem=$((100*$used/$total))
    
    color="#f96d6d"

    memory="^s[right;$color;mem $mem%]"
}

#swap used
_swap() {
    total=`free -m -t | tail -n1 | awk '{print $2}'`
    used=`free -m -t | tail -n1 | awk '{print $3}'`
    mem=$((100*$used/$total))

    color="#faa125"

    swap="^s[right;$color;swap $mem%]"
}

# hdd used
_hdd() {
    total=`df -h --total | tail -n1 | awk '{print $2}' | sed 's/G//g'`
    used=` df -h --total | tail -n1 | awk '{print $3}' | sed 's/G//g'`
    
    hdd=$((100*$used/$total))
    color="#fad325"
    hdd="^s[right;$color;hdd $hdd%]"
}

# wifi
_wifi() {
    wlan=`awk '/wlan/' /proc/net/wireless`
    quality=`awk '/wlan0/ { print $3 }' /proc/net/wireless|sed -e 's/\.$//'`
    essid=`/sbin/iwconfig wlan0 | awk '/ESSID/ { print $4 }'|sed -e 's/ESSID:"//'|sed -e 's/"$//' | cut -c1-7`

    if [ -z "$wlan" ]; then
        wifi="off"
    else
        wifi="$essid $quality%"
    fi

    color="#b4c862"

    wifi="^s[right;$color;$wifi]"
}

# date
_date() {
    hour=`date +%H:%M`
    day=`date +%d/%m`

    color="#8696e4"

    date="^s[right;$color;$day $hour]"
}

_battery() {
   device=`upower -e | grep 'bat'`
   info=`upower -i $device | sed 's/ //g' | tr ':' ' '`
   state=`     upower -i $device | sed 's/ //g' | tr ':' ' ' | grep "state"                | awk '{print $2}'` 
   time=`      upower -i $device | sed 's/ //g' | tr ':' ' ' | grep "timetoempty\|tofull"  | awk '{print $2}' | sed 's/hours/h/g' | sed 's/minutes/min/g'`
   percentage=`upower -i $device | sed 's/ //g' | tr ':' ' ' | grep "percentage"           | awk '{print $2}'` 
  
   if [[ $state == "discharging" ]]; then
       state="v"
   else
       state="^"
   fi
   battery="$state ${percentage}, ${time}"
   color="#c090e4"
   battery="^s[right;$color;$battery]"
}

# statustext
statustext() {
    first=1
    args=""
    for arg in $@; do
        if [[ $first == 1 ]]; then
            separator=""
            first=0
        else    
            separator="^s[right;#c0c0c0; | ]"
        fi
        _${arg}
        args="${args} `eval echo '$separator$'$arg`"
    done
    wmfs -c status "default $args"
}

while true;
do
    statustext volume wifi hdd swap memory battery date
    sleep 1
done
