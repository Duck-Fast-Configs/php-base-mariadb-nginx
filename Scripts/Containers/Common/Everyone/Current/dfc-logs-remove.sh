#!/bin/bash

# Extra vars
## There should be no '/' at the end
dfc_project_main_folder="../../../../.."

# Header of script
# DFC get config
. $dfc_project_main_folder/Scripts/Dependencies/dfc-config-get.sh

# DFC output threads
. $dfc_project_main_folder/Scripts/Dependencies/dfc-log.sh

# DFC messages types set
. $dfc_project_main_folder/Scripts/Dependencies/dfc-message-types-set.sh $1 >&3

# General process
message_info "$(date '+%H:%M:%S (%d/%m/%Y)')" 2
message_info "Удаление файлов журналов dfc-проекта" 2
message_space 1
message_input "Вы точно хотите удалить журналы dfc-проекта? (y/n)\n"
message_input "=> "
read -p '' input
message_space 1

case $input in
"n")
    message_info "Процесс остановлен" 1
    . $dfc_project_main_folder/Scripts/Dependencies/dfc-message-exit.sh >&3
    ;;
esac

bash -c "rm -rf $dfc_project_main_folder/Logs/*" >&1
bash -c "rm -rf $dfc_project_main_folder/Logs/.*" >&1
bash -c "rm -rf $dfc_project_main_folder/WorkFolder/Containers/dfc-host-php/Logs/*" >&1
bash -c "rm -rf $dfc_project_main_folder/WorkFolder/Containers/dfc-host-php/Logs/.*" >&1
bash -c "rm -rf $dfc_project_main_folder/WorkFolder/Containers/dfc-host-mariadb/Logs/*" >&1
bash -c "rm -rf $dfc_project_main_folder/WorkFolder/Containers/dfc-host-mariadb/Logs/.*" >&1
bash -c "rm -rf $dfc_project_main_folder/WorkFolder/Containers/dfc-host-nginx/Logs/*" >&1
bash -c "rm -rf $dfc_project_main_folder/WorkFolder/Containers/dfc-host-nginx/Logs/.*" >&1

message_info "Все файлы журналов dfc-проекта удалены" 1

# End of script
. $dfc_project_main_folder/Scripts/Dependencies/dfc-script-footer.sh
