#!/bin/bash -       
#title           :myxbacklight.sh
#description     :This script will change the luminosity of you notebook screen 
#                 using the hardware LED.
#author		       :bgw
#date            :20160716
#version         :0.1
#usage		       :bash myxbacklight.sh ammount
#bash_version    :4.1.5(1)-release
#==============================================================================

function change_luminosity {
	tee /sys/class/backlight/intel_backlight/brightness <<< $1
	echo "new luminosity: $1"
	exit 0
}

MAX_LUMINOSITY_CONTAINER="/sys/class/backlight/intel_backlight/max_brightness"
LUMINOSITY_CONTAINER="/sys/class/backlight/intel_backlight/brightness"
typeset -i max_lum=$(cat $MAX_LUMINOSITY_CONTAINER)
typeset -i cur_lum=$(cat $LUMINOSITY_CONTAINER)
def_inc_ammount=$((-100))
inc_ammount=${1:-def_inc_ammount}

if test $inc_ammount -eq 0 ; then
	change_luminosity $inc_ammount
fi
next_lum=$(($cur_lum + $inc_ammount))

if test $next_lum -ge $max_lum ; then
	next_lum=$max_lum
fi

if test $next_lum -le 0 ; then
	next_lum=0
fi

change_luminosity $next_lum
