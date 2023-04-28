#!/bin/bash

# check desktop app on Mac

# you can run this script with: ./check_desktop_app_on_mac.sh "< desktop app >"

desktopApp=$1

check_os_for_mac() {
	echo "Started checking operating system at $(date)"
	
	if [[ $OSTYPE == 'darwin'* ]]; then 
		tput setaf 2; echo -e "Operating System: \n$(sw_vers)"; tput sgr0
		
		echo "Finished checking operating system at $(date)"
		echo ""
	else 
		tput setaf 1; echo "Sorry but this script only runs on Mac."; tput sgr0
		
		echo "Finished checking operating system at $(date)"
		echo ""
		
		exit 1
	fi
}

get_desktop_app() {
	if [ -z "$desktopApp" ]; then 
		read -p "Please type the name of the desktop app you want to check and press \"return\" key (Example: Docker): " desktopApp
		
		echo ""

		for $desktopApp in `ls /Applications | grep $desktopApp`; do 
			echo $desktopApp &>/dev/null
		done 

	else 
		echo $desktopApp &>/dev/null
	fi
}

check_parameters() {
	echo "Started checking parameter(s) at $(date)"
	valid="true"
		
	echo "Parameter(s):"
	echo "-----------------------"
	echo "desktopApp: $desktopApp"
	echo "-----------------------"
	
	if [ -z "$desktopApp" ]; then 
		tput setaf 1; echo "desktopApp is not set."; tput sgr0
		valid="false"
	fi
	
	if [ $valid == "true" ]; then 
		tput setaf 2; echo "All parameter check(s) passed."; tput sgr0

		echo "Finished checking parameter(s) at $(date)"
		echo ""
	else 
		tput setaf 1; echo "One or more parameters are incorrect."; tput sgr0
		
		echo "Finished checking parameter(s) at $(date)"
		echo ""

		exit 1
	fi
}

check_desktop_app() {
	printf "\nCheck desktop app on Mac.\n\n"
	check_os_for_mac
	
	get_desktop_app
	check_parameters
	
	start=$(date +%s)
	echo "Started checking $desktopApp at $(date)"
	
	if open -Ra "$desktopApp"; then  
		tput setaf 2; echo "$desktopApp is installed."
		echo "Successfully checked $desktopApp."; tput sgr0

		end=$(date +%s)
		echo "Finished checking $desktopApp at $(date)"
		
		duration=$(( $end - $start ))
		echo "Total execution time: $duration second(s)"
		echo ""
	else
		tput setaf 1; echo "$desktopApp is not installed."; tput sgr0
		tput setaf 2; echo "Successfully checked $desktopApp."; tput sgr0
		
		end=$(date +%s)
		echo "Finished checking $desktop App at $(date)"
		
		duration=$(( $end - $start ))
		echo "Total execution time: $duration second(s)"
		echo ""
		
		exit 1
	fi
}

check_desktop_app
