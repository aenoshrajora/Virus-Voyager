#!/bin/bash

# Colors
cyan='\e[96m'
red='\e[91m'
green='\e[92m'
default='\e[0m'
yellow='\e[93m'

# Legends
info="${cyan}[${yellow}*${cyan}]${default}"
success="${cyan}[${green}+${cyan}]${default}"
error="${cyan}[${red}!${cyan}]${default}"

# Get sc0pe_path variable as an argument
sc0pe_path=$1

# Get username
normal_user=$2

# Check permissions
echo -en "$info Checking user privileges...\n"
user_str=$(whoami)
if [[ $user_str != *"root"* ]];then
    echo -en "$error You must be a root user to use installer!\n"
    exit 1
fi

installer(){
    echo -en "\n$info Looks like we have permission to install. Let's begin...\n"

    # Install python modules
    echo -en "$info Installing Python dependencies...\n"
    pip3 install -r requirements.txt

    # Configurating virusvoyager's config file
    echo -en "$info Creating configuration file in ${green}/etc${default} directory\n"
    echo -en "[virusvoyager_PATH]\n" > /etc/virusvoyager.conf
    echo -en "sc0pe = /opt/virusvoyager\n" >> /etc/virusvoyager.conf
    chown $normal_user:$normal_user /etc/virusvoyager.conf

    # Copying virusvoyager's to /opt directory
    echo -en "$info Copying files to ${green}/opt${default} directory.\n"
    cd "$sc0pe_path/../" && cp -r virusvoyager /opt/
    chown $normal_user:$normal_user /opt/virusvoyager

    # Configurating libScanner.conf
    echo -en "[Rule_PATH]\n" > /opt/virusvoyager/Systems/Android/libScanner.conf
    echo -en "rulepath = /opt/virusvoyager/Systems/Android/YaraRules/\n\n" >> /opt/virusvoyager/Systems/Android/libScanner.conf
    echo -en "[Decompiler]\n" >> /opt/virusvoyager/Systems/Android/libScanner.conf
    if [ -d "/home/$normal_user/sc0pe_Base" ];then
        echo -en "decompiler = /home/$normal_user/sc0pe_Base/jadx/bin/jadx\n" >> /opt/virusvoyager/Systems/Android/libScanner.conf
    else
        echo -en "decompiler = /usr/bin/jadx\n" >> /opt/virusvoyager/Systems/Android/libScanner.conf
    fi

    # Copying virusvoyager.py file into /usr/bin/
    echo -en "$info Copying ${green}virusvoyager.py${default} to ${green}/usr/bin/${default} directory.\n"
    cd $sc0pe_path && cp virusvoyager.py /usr/bin/virusvoyager && chmod +x /usr/bin/virusvoyager
    chown $normal_user:$normal_user /usr/bin/virusvoyager

    # Check dos2unix
    dos2unix /usr/bin/virusvoyager

    echo -en "$success Installation completed.\n"
}

uninstaller(){
    echo -en "\n$info Looks like we have permission to uninstall. Let's begin...\n"
    echo -en "$info Removing ${green}/usr/bin/virusvoyager${default} file.\n"
    rm -rf /usr/bin/virusvoyager
    echo -en "$info Removing ${green}/etc/virusvoyager.conf${default} file.\n"
    rm -rf /etc/virusvoyager.conf
    echo -en "$info Removing ${green}/opt/virusvoyager${default} directory.\n"
    rm -rf /opt/virusvoyager
    echo -en "$success Uninstallation completed.\n"
}

menu(){
    echo -en "$info User:$green $normal_user\n\n"
    echo -en "${cyan}[${red}1${cyan}]$default Install virusvoyager\n"
    echo -en "${cyan}[${red}2${cyan}]$default Uninstall virusvoyager\n\n"
    echo -en "$green>>>>$default "
    read choice
    case $choice in
        1) installer ;;
        2) uninstaller ;;
        *) echo -en "$error Wrong choice :(\n"
           exit 1 ;;
    esac
}

# Execution
menu