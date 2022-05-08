#!/bin/bash

# Extra vars
## There should be no '/' at the end
dfc_project_main_folder="../../../../.."

# Header of script
. $dfc_project_main_folder/Scripts/Dependencies/dfc-script-header.sh

# General process
message_info "$(date '+%H:%M:%S (%d/%m/%Y)')" 2
message_space 2
message_input "Вы точно хотите удалить docker или dfc проект? (y/n)\n"
message_input "=> "
read -p '' dfc_project_input_choice
message_space 1

case $dfc_project_input_choice in
"y")
    continue
    ;;
*)
    message_info "Процесс остановлен" 1
    . $dfc_project_main_folder/Scripts/Dependencies/dfc-message-exit.sh >&3
    ;;
esac

message_input "Название проекта\n"
message_input "=> "
read -p '' dfc_project_other_name
message_space 1

message_input "Вы точно хотите удалить проект ${dfc_project_other_name}? (y/n)\n"
message_input "=> "
read -p '' dfc_project_input_choice
message_space 1

case $dfc_project_input_choice in
"y")
    continue
    ;;
*)
    message_info "Процесс остановлен" 1
    . $dfc_project_main_folder/Scripts/Dependencies/dfc-message-exit.sh >&3
    ;;
esac

message_info "Ожидайте..." 1
bash -c "docker stop $(docker ps -a -q -f "name=${dfc_project_other_name}")" >&1
bash -c "docker rm $(docker ps -a -q -f "name=${dfc_project_other_name}")" >&1
bash -c "docker volume rm $(docker volume ls -qf dangling=true)" >&1
message_info "Проект удален" 1

# End of script
. $dfc_project_main_folder/Scripts/Dependencies/dfc-script-footer.sh
