#!/bin/bash

# Extra vars
## There should be no '/' at the end
dfc_project_main_folder="."

# Header of script
. $dfc_project_main_folder/Scripts/Dependencies/dfc-script-header.sh

# General process
message_info "$(date '+%H:%M:%S (%d/%m/%Y)')" 2
message_space 2

message_info "Менеджер энергопотребления" 1
message_space 1
message_input "Общие настройки:\n"
message_input "1. Оптимизированный режим для всех контейнеров\n"
message_input "2. Индивидуальный режим для контейнеров\n"
message_input "3. Выйти\n"
message_input "=> "
read -p '' dfc_project_general_choice

case $dfc_project_general_choice in
"1")
    message_space 1
    
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Power && sh dfc-high.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-mariadb/Power && sh dfc-high.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-nginx/Power && sh dfc-high.sh -d1) >&3
  
    . $dfc_project_main_folder/Scripts/Dependencies/dfc-message-exit.sh >&3
    ;;
"2")
    continue
    ;;
"3")
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
    message_input "Список режимов работы dfc-проекта:\n"
    message_input "1. Предел мощности, предел потребления ресурсов\n"
    message_input "2. Максимальная производительность, низкая экономия ресурсов\n"
    message_input "3. Средняя производительность, средняя экономия ресурсов\n"
    message_input "4. Низкая производительность, высокая экономия ресурсов\n"
    message_input "5. Предельно низкая производительность, максимальная экономия ресурсов\n"
    message_input "6. Выйти\n"
    message_input "=> "
    read -p '' dfc_project_container

    case $dfc_project_container in
    "1")
        message_space 1

        (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Power && sh dfc-highest.sh -d1) >&3
        ;;
    "2")
        message_space 1
        
        (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Power && sh dfc-high.sh -d1) >&3
        ;;
    "3")
        message_space 1
        
        (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Power && sh dfc-medium.sh -d1) >&3
        ;;
    "4")
        message_space 1
        
        (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Power && sh dfc-low.sh -d1) >&3
        ;;
    "5")
        message_space 1
        
        (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Power && sh dfc-lowest.sh -d1) >&3
        ;;
    "6")
        . $dfc_project_main_folder/Scripts/Dependencies/dfc-message-exit.sh >&3
        ;;
    *)
        . $dfc_project_main_folder/Scripts/Dependencies/dfc-message-exit.sh >&3
        ;;
    esac
    ;;
"2")
    message_space 1
    message_input "Список режимов работы dfc-проекта:\n"
    message_input "1. Предел мощности, предел потребления ресурсов\n"
    message_input "2. Максимальная производительность, низкая экономия ресурсов\n"
    message_input "3. Средняя производительность, средняя экономия ресурсов\n"
    message_input "4. Низкая производительность, высокая экономия ресурсов\n"
    message_input "5. Предельно низкая производительность, максимальная экономия ресурсов\n"
    message_input "6. Выйти\n"
    message_input "=> "
    read -p '' dfc_project_container

    case $dfc_project_container in
    "1")
        message_space 1

        (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-mariadb/Power && sh dfc-highest.sh -d1) >&3
        ;;
    "2")
        message_space 1
        
        (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-mariadb/Power && sh dfc-high.sh -d1) >&3
        ;;
    "3")
        message_space 1
        
        (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-mariadb/Power && sh dfc-medium.sh -d1) >&3
        ;;
    "4")
        message_space 1
        
        (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-mariadb/Power && sh dfc-low.sh -d1) >&3
        ;;
    "5")
        message_space 1
        
        (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-mariadb/Power && sh dfc-lowest.sh -d1) >&3
        ;;
    "6")
        . $dfc_project_main_folder/Scripts/Dependencies/dfc-message-exit.sh >&3
        ;;
    *)
        . $dfc_project_main_folder/Scripts/Dependencies/dfc-message-exit.sh >&3
        ;;
    esac
    ;;
"3")
    message_space 1
    message_input "Список режимов работы dfc-проекта:\n"
    message_input "1. Предел мощности, предел потребления ресурсов\n"
    message_input "2. Максимальная производительность, низкая экономия ресурсов\n"
    message_input "3. Средняя производительность, средняя экономия ресурсов\n"
    message_input "4. Низкая производительность, высокая экономия ресурсов\n"
    message_input "5. Предельно низкая производительность, максимальная экономия ресурсов\n"
    message_input "6. Выйти\n"
    message_input "=> "
    read -p '' dfc_project_container

    case $dfc_project_container in
    "1")
        message_space 1

        (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-nginx/Power && sh dfc-highest.sh -d1) >&3
        ;;
    "2")
        message_space 1
        
        (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-nginx/Power && sh dfc-high.sh -d1) >&3
        ;;
    "3")
        message_space 1
        
        (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-nginx/Power && sh dfc-medium.sh -d1) >&3
        ;;
    "4")
        message_space 1
        
        (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-nginx/Power && sh dfc-low.sh -d1) >&3
        ;;
    "5")
        message_space 1
        
        (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-nginx/Power && sh dfc-lowest.sh -d1) >&3
        ;;
    "6")
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
