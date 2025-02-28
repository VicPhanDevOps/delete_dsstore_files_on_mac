#!/bin/python

# check OS for Mac

import colorama, os, sys
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
        raise Exception("Sorry this script only runs on macOS.")


checkOsForMac()
