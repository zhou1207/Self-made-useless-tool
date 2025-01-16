#!/bin/bash

current_wifi=$(/Sy*/L*/Priv*/Apple8*/V*/C*/R*/airport -I | awk '/ SSID:/ {print $2}')
echo Current connected Wi-Fi is $current_wifi

read -p "Do you want to search the password for the current connected Wi-Fi? [y/n]: " choice

if [[ $choice =~ ^[Yy]$ ]] ; then
	security find-generic-password -D "AirPort network password" -a $current_wifi -g | grep "password:"
elif [[ $choice =~ ^[Nn]$ ]] ; then
	echo "Search for anotehr stored/remebered Wi-Fi password"
	read -p "Please enter the name of the Wi-Fi:" wifi_name  
	echo "Searching for the wifi password...."
	security find-generic-password -D "AirPort network password" -a $wifi_name -g | grep "password:"
fi
