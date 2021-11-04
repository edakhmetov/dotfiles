#!/bin/bash    
# find names with
# xrandr -q    
EXTERNAL_HDMI="HDMI1"    
EXTERNAL_VGA="DP2"    
INTERNAL_OUTPUT="eDP1"    
    
SETUP_FULL="full"    
SETUP_EXTERNAL="external"    
SETUP_INTERNAL=""    
SETUP_EXTEND="extend"    
    
# if we don't have a file, start at zero    
if [ ! -f "/tmp/monitor_mode.dat" ] ; then    
  monitor_mode="all"    
    
# otherwise read the value from the file    
else    
  monitor_mode=`cat /tmp/monitor_mode.dat`    
fi    
    
if [ $monitor_mode = $SETUP_FULL ]; then    
        monitor_mode=$SETUP_EXTERNAL
	xrandr --output $INTERNAL_OUTPUT --auto --output $EXTERNAL_HDMI --mode 1920x1080 --same-as $INTERNAL_OUTPUT
elif [ $monitor_mode = $SETUP_EXTERNAL ]; then    
        monitor_mode=$SETUP_INTERNAL    
        xrandr --output $INTERNAL_OUTPUT --off --output $EXTERNAL_HDMI --mode 1920x1080 --same-as $INTERNAL_OUTPUT
elif [ $monitor_mode = $SETUP_INTERNAL ]; then    
        monitor_mode=$SETUP_EXTEND    
	xrandr --output $INTERNAL_OUTPUT --auto  --output $EXTERNAL_HDMI --off
else    
        monitor_mode=$SETUP_FULL    
        # --left-of/--right-of/--below/--above    
        xrandr --output $INTERNAL_OUTPUT --auto --output $EXTERNAL_HDMI --mode 1920x1080 --right-of $INTERNAL_OUTPUT
fi    
    
#echo "Switching to ${monitor_mode}"    
echo "${monitor_mode}" > /tmp/monitor_mode.dat 
