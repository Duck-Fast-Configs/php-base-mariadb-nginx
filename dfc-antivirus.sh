#!/bin/bash

# Extra vars
## There should be no '/' at the end
dfc_project_main_folder="."

# Header of script
. $dfc_project_main_folder/Scripts/Dependencies/dfc-script-header.sh

# General process
message_info "$(date '+%H:%M:%S (%d/%m/%Y)')" 2
message_space 2

message_info "Менеджер режимов антивируса" 2
message_space 1
message_input "Общие настройки:\n"
message_input "1. Проверить на вирусы все контейнеры\n"
message_input "2. Индивидуальный режим для контейнеров\n"
message_input "3. Важная информация о базах данных антивируса\n"
message_input "4. Выйти\n"
message_input "=> "
read -p '' dfc_project_general_choice

case $dfc_project_general_choice in
"1")
    message_space 1
    
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Antivirus && sh dfc-scan.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-mariadb/Antivirus && sh dfc-scan.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-nginx/Antivirus && sh dfc-scan.sh -d1) >&3
    
    . $dfc_project_main_folder/Scripts/Dependencies/dfc-message-exit.sh >&3
    ;;
"2")
    continue
    ;;
"3")
    message_space 1
    
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Antivirus && sh dfc-update.sh -d1) >&3
    
    . $dfc_project_main_folder/Scripts/Dependencies/dfc-message-exit.sh >&3
    ;;
"4")
    . $dfc_project_main_folder/Scripts/Dependencies/dfc-message-exit.sh >&3
    ;;
*)
    . $dfc_project_main_folder/Scripts/Dependencies/dfc-message-exit.sh >&3
    ;;
esac

message_space 1
message_input "Список контейнеров:\n"
message_input "1. dfc-host-php\n"
message_input "2. dfc-host-mariadb\n"
message_input "3. dfc-host-nginx\n"
message_input "4. Выйти\n"
message_input "=> "
read -p '' dfc_project_container_choice

case $dfc_project_container_choice in
"1")
    message_space 1
    message_input "Список режимов работы контейнера:\n"
    message_input "1. Просканировать контейнер на вирусы\n"
    message_input "2. Выйти\n"
    message_input "=> "
    read -p '' dfc_project_firewall_choice

    case $dfc_project_firewall_choice in
    "1")
        message_space 1

        (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Antivirus && sh dfc-scan.sh -d1) >&3
        ;;
    "2")
        . $dfc_project_main_folder/Scripts/Dependencies/dfc-message-exit.sh >&3
        ;;
    *)
        . $dfc_project_main_folder/Scripts/Dependencies/dfc-message-exit.sh >&3
        ;;
    esac
    ;;
"2")
    message_space 1
    message_input "Список режимов работы контейнера:\n"
    message_input "1. Просканировать контейнер на вирусы\n"
    message_input "2. Выйти\n"
    message_input "=> "
    read -p '' dfc_project_firewall_choice

    case $dfc_project_firewall_choice in
    "1")
        message_space 1

        (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-mariadb/Antivirus && sh dfc-scan.sh -d1) >&3
        ;;
    "2")
        . $dfc_project_main_folder/Scripts/Dependencies/dfc-message-exit.sh >&3
        ;;
    *)
        . $dfc_project_main_folder/Scripts/Dependencies/dfc-message-exit.sh >&3
        ;;
    esac
    ;;
"3")
    message_space 1
    message_input "Список режимов работы контейнера:\n"
    message_input "1. Просканировать контейнер на вирусы\n"
    message_input "2. Выйти\n"
    message_input "=> "
    read -p '' dfc_project_firewall_choice

    case $dfc_project_firewall_choice in
    "1")
        message_space 1

        (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-nginx/Antivirus && sh dfc-scan.sh -d1) >&3
        ;;
    "2")
        . $dfc_project_main_folder/Scripts/Dependencies/dfc-message-exit.sh >&3
        ;;
    *)
        . $dfc_project_main_folder/Scripts/Dependencies/dfc-message-exit.sh >&3
        ;;
    esac
    ;;
"4")
    . $dfc_project_main_folder/Scripts/Dependencies/dfc-message-exit.sh >&3
    ;;
*)
    . $dfc_project_main_folder/Scripts/Dependencies/dfc-message-exit.sh >&3
    ;;
esac

# End of script
. $dfc_project_main_folder/Scripts/Dependencies/dfc-script-footer.sh
