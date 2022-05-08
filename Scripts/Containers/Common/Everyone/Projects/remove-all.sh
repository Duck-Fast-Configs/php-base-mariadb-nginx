#!/bin/bash

# Extra vars
## There should be no '/' at the end
dfc_project_main_folder="../../../../.."

# Header of script
. $dfc_project_main_folder/Scripts/Dependencies/dfc-script-header.sh

# General process
message_info "$(date '+%H:%M:%S (%d/%m/%Y)')" 2
message_space 2
message_input "Вы точно хотите удалить все docker и dfc проекты? (y/n)\n"
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
bash -c "docker stop $(docker ps -a -q)" >&1
bash -c "docker rm $(docker ps -a -q)" >&1
bash -c "docker rmi $(docker images -a -q)" >&1
bash -c "docker container prune -f" >&1
bash -c "docker image prune -f" >&1
bash -c "docker volume prune -f" >&1
bash -c "docker network prune -f" >&1
(cd $dfc_project_main_folder/Scripts/Containers/Common/Everyone/Current && sh dfc-logs-remove.sh -d1) >&3
message_info "Все dfc-проекты на вашем ПК были удалены" 1

# End of script
. $dfc_project_main_folder/Scripts/Dependencies/dfc-script-footer.sh
