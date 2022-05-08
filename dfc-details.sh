#!/bin/bash

# Extra vars
## There should be no '/' at the end
dfc_project_main_folder="."

# Header of script
. $dfc_project_main_folder/Scripts/Dependencies/dfc-script-header.sh

# General process
message_info "$(date '+%H:%M:%S (%d/%m/%Y)')" 2
message_space 2

message_info "Менеджер проектов" 2
message_space 1
message_input "Целевой проект:\n"
message_input "1. Текущий\n"
message_input "2. Другой\n"
message_input "3. Выйти\n"
message_input "=> "
read -p '' dfc_project_container

case $dfc_project_container in
"1")
    message_space 1
    message_input "Список действий:\n"
    message_input "1. Узнать IP\n"
    message_input "2. Узнать MAC\n"
    message_input "3. Просмотреть журналы\n"
    message_input "4. Выйти\n"
    message_input "=> "
    read -p '' dfc_project_container_package_name

    case $dfc_project_container_package_name in
    "1")
        message_space 1

        cd Scripts/Containers/Common/Everyone/Current && sh dfc-ip-look.sh -d1 >&3 && cd -
        ;;
    "2")
        message_space 1
        
        cd Scripts/Containers/Common/Everyone/Current && sh dfc-mac-look.sh -d1 >&3 && cd -
        ;;
    "3")
        message_space 1
        
        cd Scripts/Containers/Common/Everyone/Current && sh dfc-logs-look.sh -d1 >&3 && cd -
        ;;
    "4")
        . $dfc_project_main_folder/Scripts/Dependencies/dfc-message-exit.sh >&3
        ;;
    *)
        . $dfc_project_main_folder/Scripts/Dependencies/dfc-message-exit.sh >&3
        ;;
    esac
    ;;
"2")
    message_space 1
    message_input "Список действий:\n"
    message_input "1. Просмотреть монитор контейнеров\n"
    message_input "2. Просмотреть короткую информацию\n"
    message_input "3. Просмотреть полную информацию\n"
    message_input "4. Просмотреть список контейнеров\n"
    message_input "5. Просмотреть список изображений\n"
    message_input "6. Просмотреть список сетей\n"
    message_input "7. Просмотреть список томов\n"
    message_input "8. Остановить все контейнеры\n"
    message_input "9. Удалить конкретный проект\n"
    message_input "10. Удалить все проекты\n"
    message_input "11. Выйти\n"
    message_input "=> "
    read -p '' dfc_project_container_package_name

    case $dfc_project_container_package_name in
    "1")
        message_space 1

        cd Scripts/Containers/Common/Everyone/Projects && sh monitor.sh -d1 >&3 && cd -
        ;;
    "2")
        message_space 1
        
        cd Scripts/Containers/Common/Everyone/Projects && sh info-short.sh -d1 >&3 && cd -
        ;;
    "3")
        message_space 1
        
        cd Scripts/Containers/Common/Everyone/Projects && sh info-full.sh -d1 >&3 && cd -
        ;;
    "4")
        message_space 1
        
        cd Scripts/Containers/Common/Everyone/Projects && sh container-list.sh -d1 >&3 && cd -
        ;;
    "5")
        message_space 1
        
        cd Scripts/Containers/Common/Everyone/Projects && sh image-list.sh -d1 >&3 && cd -
        ;;
    "6")
        message_space 1
        
        cd Scripts/Containers/Common/Everyone/Projects && sh networks-list.sh -d1 >&3 && cd -
        ;;
    "7")
        message_space 1
        
        cd Scripts/Containers/Common/Everyone/Projects && sh volumes-list.sh -d1 >&3 && cd -
        ;;
    "8")
        message_space 1
        
        cd Scripts/Containers/Common/Everyone/Projects && sh stop-hard.sh -d1 >&3 && cd -
        ;;
    "9")
        message_space 1
        
        cd Scripts/Containers/Common/Everyone/Projects && sh remove-special.sh -d1 >&3 && cd -
        ;;
    "10")
        message_space 1
        
        cd Scripts/Containers/Common/Everyone/Projects && sh remove-all.sh -d1 >&3 && cd -
        ;;
    "11")
        . $dfc_project_main_folder/Scripts/Dependencies/dfc-message-exit.sh >&3
        ;;
    *)
        . $dfc_project_main_folder/Scripts/Dependencies/dfc-message-exit.sh >&3
        ;;
    esac
    ;;
"3")
    . $dfc_project_main_folder/Scripts/Dependencies/dfc-message-exit.sh >&3
    ;;
*)
    . $dfc_project_main_folder/Scripts/Dependencies/dfc-message-exit.sh >&3
    ;;
esac

# End of script
. $dfc_project_main_folder/Scripts/Dependencies/dfc-script-footer.sh
