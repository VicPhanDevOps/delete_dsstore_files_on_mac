#!/bin/python

# check XCode command line tools on Mac

import colorama, os, sys, subprocess, traceback
from colorama import Fore, Style
from datetime import datetime
colorama.init()


def checkOsForMac():
    print("Started checking operating system at", datetime.now().strftime("%m-%d-%Y %I:%M %p"))

    if sys.platform == "darwin": 
        print(Fore.GREEN + "Operating System: ")
        os.system('sw_vers')
        print(Style.RESET_ALL, end="")
        
        print("Finished checking operating system at", datetime.now().strftime("%m-%d-%Y %I:%M %p"))

        print("")

    else: 
        raise Exception("Sorry but this script only runs on Mac.")


def checkXCodeCommandLineTools(): 
    print("\nCheck XCode command line tools on Mac.\n")
    checkOsForMac()

    try:
        startDateTime = datetime.now()
        
        print("Started checking XCode command line tools at", startDateTime.strftime("%m-%d-%Y %I:%M %p"))

        FNULL = open(os.devnull,  'w')

        checkAnsibleOnMacOrLinux = subprocess.call(['which', 'xcode-select'], stdout=FNULL) 

        if checkAnsibleOnMacOrLinux == 0:
            print(Fore.GREEN + "XCode command line tools are installed."+ Style.RESET_ALL)
            os.system('xcode-select --version')
            print(Fore.GREEN + "Successfully checked XCode command line tools." + Style.RESET_ALL)

            finishedDateTime = datetime.now()

            print("Finished checking XCode command line tools at", finishedDateTime.strftime("%m-%d-%Y %I:%M %p"))

            duration = finishedDateTime - startDateTime
            print("Total execution time: {0} second(s)".format(duration.seconds))
            print("")

        else: 
            raise Exception("XCode command line tools are not installed.")

        
    except Exception: 
        print(Fore.RED + "Failed to check XCode command line tools.")
        traceback.print_exc()
        exit("" + Style.RESET_ALL)
        

checkXCodeCommandLineTools()
