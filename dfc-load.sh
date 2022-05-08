#!/bin/bash

# Extra vars
## There should be no '/' at the end
dfc_project_main_folder="."

# Header of script
. $dfc_project_main_folder/Scripts/Dependencies/dfc-script-header.sh

# General process
message_info "$(date '+%H:%M:%S (%d/%m/%Y)')" 2
message_space 2

message_info "Менеджер стресс-тестирования" 2
message_space 1
message_input "Список режимов тестирования:\n"
message_input "1. Максимальный режим стресс-тестирования без ограничений для всех контейнеров\n"
message_input "2. Минимальный режим стресс-тестирования без ограничений для всех контейнеров\n"
message_input "3. Максимальный режим стресс-тестирования с указанным ограничением для всех контейнеров\n"
message_input "4. Минимальный режим стресс-тестирования с указанным ограничением для всех контейнеров\n"
message_input "5. Остановить стресс-тестирование для всех контейнеров\n"
message_input "6. Выйти\n"
message_input "=> "
read -p '' dfc_project_container

case $dfc_project_container in
"1")
    message_space 1

    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Load && sh dfc-stop.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Load && sh dfc-high.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-mariadb/Load && sh dfc-stop.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-mariadb/Load && sh dfc-high.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-nginx/Load && sh dfc-stop.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-nginx/Load && sh dfc-high.sh -d1) >&3
    ;;
"2")
    message_space 1
    
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Load && sh dfc-stop.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Load && sh dfc-low.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-mariadb/Load && sh dfc-stop.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-mariadb/Load && sh dfc-low.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-nginx/Load && sh dfc-stop.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-nginx/Load && sh dfc-low.sh -d1) >&3
    ;;
"3")
    message_space 1
    
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Load && sh dfc-stop.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Load && sh dfc-high.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-mariadb/Load && sh dfc-stop.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-mariadb/Load && sh dfc-high.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-nginx/Load && sh dfc-stop.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-nginx/Load && sh dfc-high.sh -d1) >&3
    message_space 1
    (cd $dfc_project_main_folder && sh dfc-power.sh -d1) >&3
    ;;
"4")
    message_space 1
    
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Load && sh dfc-stop.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Load && sh dfc-low.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-mariadb/Load && sh dfc-stop.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-mariadb/Load && sh dfc-low.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-nginx/Load && sh dfc-stop.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-nginx/Load && sh dfc-low.sh -d1) >&3
    message_space 1
    (cd $dfc_project_main_folder && sh dfc-power.sh -d1) >&3
    ;;
"5")
    message_space 1
    
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Load && sh dfc-stop.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-mariadb/Load && sh dfc-stop.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-nginx/Load && sh dfc-stop.sh -d1) >&3
    message_space 1
    (cd $dfc_project_main_folder && sh dfc-power.sh -d1) >&3
    ;;
"6")
    . $dfc_project_main_folder/Scripts/Dependencies/dfc-message-exit.sh >&3
    ;;
*)
    . $dfc_project_main_folder/Scripts/Dependencies/dfc-message-exit.sh >&3
    ;;
esac

# End of script
. $dfc_project_main_folder/Scripts/Dependencies/dfc-script-footer.sh
