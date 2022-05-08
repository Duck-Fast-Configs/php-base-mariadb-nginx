#!/bin/bash

# Extra vars
## There should be no '/' at the end
dfc_project_main_folder="."

# Header of script
. $dfc_project_main_folder/Scripts/Dependencies/dfc-script-header.sh

# General process
message_info "$(date '+%H:%M:%S (%d/%m/%Y)')" 2
message_space 2

message_input "Вы точно хотите удалить dfc-проект? (y/n)\n"
message_input "=> "
read -p '' dock
message_space 1

case $dock in
"y")
    continue
    ;;
*)
    message_info "Процесс остановлен" 1
    . $dfc_project_main_folder/Scripts/Dependencies/dfc-message-exit.sh >&3
    ;;
esac

message_info "Ожидайте..." 1
docker-compose -p $dfc_global__project_name down -v --rmi all --remove-orphans >&1
(cd $dfc_project_main_folder/Scripts/Containers/Common/Everyone/Current && sh dfc-logs-remove.sh -d1) >&3

message_info "Процесс удаления dfc-проекта закончен" 1

# End of script
. $dfc_project_main_folder/Scripts/Dependencies/dfc-script-footer.sh
