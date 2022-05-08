#!/bin/bash

# Extra vars
## There should be no '/' at the end
dfc_project_main_folder="."

# Header of script
. $dfc_project_main_folder/Scripts/Dependencies/dfc-script-header.sh

# General process
message_info "$(date '+%H:%M:%S (%d/%m/%Y)')" 2
message_space 2

message_info "Менеджер режимов брандмауэра" 2
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
    
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-nginx/Firewall/Unblock && sh dfc-all.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-nginx/Firewall/Block && sh dfc-insecure.sh -d1) >&3
    
    . $dfc_project_main_folder/Scripts/Dependencies/dfc-script-footer.sh
    ;;
"2")
    continue
    ;;
"3")
    . $dfc_project_main_folder/Scripts/Dependencies/dfc-message-exit.sh >&3
    ;;
*)
    . $dfc_project_main_folder/Scripts/Dependencies/dfc-script-footer.sh
    ;;
esac

message_space 1
message_input "Список контейнеров:\n"
message_input "1. dfc-host-nginx\n"
message_input "2. Выйти\n"
message_input "=> "
read -p '' dfc_project_container_choice

case $dfc_project_container_choice in
"1")
    message_space 1
    message_input "Список режимов работы контейнера:\n"
    message_input "1. Подробная информация\n"
    message_input "2. Оптимизированный режим\n"
    message_input "3. Открыть доступ для всех входящих подключений\n"
    message_input "4. Закрыть доступ для всех входящих подключений\n"
    message_input "5. Открыть доступ для всех исходящих подключений\n"
    message_input "6. Закрыть доступ для всех исходящих подключений\n"
    message_input "7. Разблокировать доступ для всех входящих и исходящих подключений\n"
    message_input "8. Заблокировать доступ для всех известных вредоносных входящих подключений\n"
    message_input "9. Разблокировать определенный IP адрес\n"
    message_input "10. Заблокировать определенный IP адрес\n"
    message_input "11. Разблокировать порт 443\n"
    message_input "12. Заблокировать порт 443\n"
    message_input "13. Выйти\n"
    message_input "=> "
    read -p '' dfc_project_firewall_choice

    case $dfc_project_firewall_choice in
    "1")
        message_space 1

        (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-nginx/Firewall && sh dfc-info.sh -d1) >&3
        ;;
    "2")
        message_space 1

        (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-nginx/Firewall/Unblock && sh dfc-all.sh -d1) >&3
        (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-nginx/Firewall/Block && sh dfc-insecure.sh -d1) >&3
        ;;
    "3")
        message_space 1

        (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-nginx/Firewall/Unblock && sh dfc-incoming.sh -d1) >&3
        ;;
    "4")
        message_space 1

        (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-nginx/Firewall/Block && sh dfc-incoming.sh -d1) >&3
        ;;
    "5")
        message_space 1

        (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-nginx/Firewall/Unblock && sh dfc-outcoming.sh -d1) >&3
        ;;
    "6")
        message_space 1

        (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-nginx/Firewall/Block && sh dfc-outcoming.sh -d1) >&3
        ;;
    "7")
        message_space 1

        (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-nginx/Firewall/Unblock && sh dfc-all.sh -d1) >&3
        ;;
    "8")
        message_space 1

        (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-nginx/Firewall/Block && sh dfc-insecure.sh -d1) >&3
        ;;
    "9")
        message_space 1

        (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-nginx/Firewall/Unblock && sh dfc-ip-custom.sh -d1) >&3
        ;;
    "10")
        message_space 1

        (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-nginx/Firewall/Block && sh dfc-ip-custom.sh -d1) >&3
        ;;
    "11")
        message_space 1

        (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-nginx/Firewall/Unblock && sh dfc-port-443.sh -d1) >&3
        ;;
    "12")
        message_space 1

        (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-nginx/Firewall/Block && sh dfc-port-443.sh -d1) >&3
        ;;
    "13")
        . $dfc_project_main_folder/Scripts/Dependencies/dfc-message-exit.sh >&3
        ;;
    *)
        . $dfc_project_main_folder/Scripts/Dependencies/dfc-script-footer.sh
        ;;
    esac
    ;;
"2")
    . $dfc_project_main_folder/Scripts/Dependencies/dfc-message-exit.sh >&3
    ;;
*)
    . $dfc_project_main_folder/Scripts/Dependencies/dfc-script-footer.sh
    ;;
esac

# End of script
. $dfc_project_main_folder/Scripts/Dependencies/dfc-script-footer.sh
