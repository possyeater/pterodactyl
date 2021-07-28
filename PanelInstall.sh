#!/bin/bash



output(){

    echo -e '\e[36m'$1'\e[0m';

}



warn(){

    echo -e '\e[31m'$1'\e[0m';

}



PANEL=v1.4.2

WINGS=v1.4.4

PANEL_LEGACY=v0.7.19

DAEMON_LEGACY=v0.6.13

PHPMYADMIN=5.1.1



preflight(){

    output "Pterodactyl Installation & Upgrade Script"

  

    output "Please join our  Discord if you aren't already in: https://https://discord.gg/DmBCndPTgt"

    output ""



    output "Please note that this script is meant to be installed on a fresh OS. Installing it on a non-fresh OS may cause problems."

    output "Automatic operating system detection initialized..."



    os_check



    if [ "$EUID" -ne 0 ]; then

        output "Please run as root."

        exit 3

    fi



    output "Automatic architecture detection initialized..."

    MACHINE_TYPE=`uname -m`

    if [ ${MACHINE_TYPE} == 'x86_64' ]; then

        output "64-bit server detected! Good to go."

        output ""

    else

        output "Unsupported architecture detected! Please switch to 64-bit (x86_64)."

        exit 4

    fi



    output "Automatic virtualization detection initialized..."

    if [ "$lsb_dist" =  "ubuntu" ]; then

        apt-get update --fix-missing

        apt-get -y install software-properties-common

