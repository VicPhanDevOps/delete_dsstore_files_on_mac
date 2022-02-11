#!/bin/bash

# check cmatrix on Mac

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

check_cmatrix() {
    printf "\nCheck cmatrix on Mac.\n\n"
    check_os_for_mac

    start=$(date +%s)
    echo "Started checking cmatrix at $(date)"

    which -s cmatrix
    if [[ $? != 0 ]]; then 
        tput setaf 1; echo "cmatrix is not installed."; echo tput sgr0

        end=$(date +%s)
        echo "Finished checking cmatrix at $(date)"

        duration=$(( $end - $start ))
        echo "Total execution time: $duration second(s)"
        echo ""

        exit 1
    else 
        tput setaf 2; echo "cmatrix is installed."; tput sgr0
        
        echo "Do you want to run cmatrix now?"
        read -p "Please type \"Y\" or \"N\" and press \"return\" key: " answer

        if [[ $answer == 'Y' ]]; then 
            cmatrix -s
        fi
        
        end=$(date +%s)
        echo "Finished checking cmatrix at $(date)"

        duration=$(( $end - $start ))
        echo "Total execution time: $duration second(s)"
        echo ""
    fi
}

check_cmatrix
