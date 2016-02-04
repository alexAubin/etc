#!/bin/sh
# wmfs status
# inspired by addikt1ve, rhaamo, linkdd and some others

# volume
volume() {

    status=`amixer -c 0 sget 'Master' | tail -n1 | awk '{ print $6 }' | sed -re 's/^\[*//' | cut -d\] -f1`
    if [[ $status == on ]]; then
        vol=`amixer -c 0 sget 'Master' | tail -n1 | awk '{ print $4 }' | sed -re 's/^\[*//' | cut -d\] -f1`
    else
        vol="mute"
    fi

    color="#5ca8a7"
    echo "^p[1016;7;30;2;0;$vol;100;#333333;$color]"
}


#!/bin/bash

cpu(){
    cpu="$(eval $(awk '/^cpu /{print "previdle=" $5 "; prevtotal=" $2+$3+$4+$5 }' /proc/stat); sleep 0.4;
          eval $(awk '/^cpu /{print "idle=" $5 "; total=" $2+$3+$4+$5 }' /proc/stat);
          intervaltotal=$((total-${prevtotal:-0}));
          echo "$((100*( (intervaltotal) - ($idle-${previdle:-0}) ) / (intervaltotal) ))")"
    echo "^g[1050;2;30;12;$cpu;100;#333333;#1166DD;cpugraph]"
}

# memory used
ram() {
    total=`free -m -t | head -n2 | tail -n1 | awk '{print $2}'`
    used=`free -m -t | head -n2 | tail -n1 | awk '{print $3}'`
    mem=$((100*$used/$total))
    
    color="#c9cd6d"
    echo "^p[1086;12;30;2;0;$mem;100;#333333;$color]"
}

#swap used
swap() {
    total=`free -m -t | tail -n1 | awk '{print $2}'`
    used=`free -m -t | tail -n1 | awk '{print $3}'`
    mem=$((100*$used/$total))

    color="#faa125"
    echo "^p[1086;7;30;2;0;$mem;100;#333333;$color]"
}

# hdd used
hdd() {
    total=`df -h --total | tail -n1 | awk '{print $2}' | sed 's/G//g'`
    used=` df -h --total | tail -n1 | awk '{print $3}' | sed 's/G//g'`
    
    hdd=$((100*$used/$total))
    color="#3ac325"
    echo "^p[1086;2;30;2;0;$hdd;100;#333333;$color]"
}


avgping() {
    # Ping once
    ping=`ping 8.8.8.8 -c 1 | grep '64 bytes' | tr '=' ' ' | awk '{ print $10 }'`
    if [[ $ping == "" ]]; then ping=9999; fi
    echo $ping >> ~/.ping.log
    # Erase first line of ping log
    if [[ `cat ~/.ping.log | wc -l` -gt "20" ]]
    then
        tail -n +2 ~/.ping.log > ~/.ping.log
    fi
    # Average
    avg=`awk '{ total += $1; count++ } END { print total/count }' ~/.ping.log`
    # Display
    color="#b4c862"
    echo "^p[1016;2;30;2;0;$avg;300;#333333;$color]"
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

battery() {
   device=`upower -e | grep 'bat'`
   info=`upower -i $device | sed 's/ //g' | tr ':' ' '`
   state=`     upower -i $device | sed 's/ //g' | tr ':' ' ' | grep "state"                | awk '{print $2}'` 
   time=`      upower -i $device | sed 's/ //g' | tr ':' ' ' | grep "timetoempty\|tofull"  | awk '{print $2}' | sed 's/hours/h/g' | sed 's/minutes/min/g'`
   percentage=`upower -i $device | sed 's/ //g' | tr ':' ' ' | grep "percentage" | tr '%' ' ' | awk '{print $2}' ` 
    
   if [[ $state == "discharging" ]]; then
       #state="v"
       color="#f090e4"
   else
       #state="^"
       color="#c090e4"
   fi
   
   if [[ $state == "discharging" ]]; then
        if [[ $percentage -lt "10" ]]; then
            colorwarn="#c02020"
            echo "^s[500;14;$colorwarn;Warning : low battery !]"
        fi
    fi
    
   echo "^p[1016;12;30;2;0;$percentage;100;#333333;$color]"

   #if [[ $percentage == "100%" ]]; then
   #     battery=$percentage
   #else
   #     battery="$state ${percentage}, ${time}"
   #fi

   #color="#c090e4"
   #battery="^s[right;$color;$battery]"
}

# statustext
updateStatusText() {
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
    args="${args} $(volume)"
    args="${args} $(battery)"
    args="${args} $(avgping)"
    args="${args} $(cpu)"
    args="${args} $(ram)"
    args="${args} $(swap)"
    args="${args} $(hdd)"
    wmfs -c status "default $args"
}

while true;
do
    updateStatusText date
    sleep 1
done
