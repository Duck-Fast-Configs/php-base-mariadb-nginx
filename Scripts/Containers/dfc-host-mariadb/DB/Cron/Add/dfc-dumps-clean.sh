#!/bin/bash

# Extra vars
## There should be no '/' at the end 
export dfc_project_main_folder="../../../../../.."

# Header of script
. $dfc_project_main_folder/Scripts/Dependencies/dfc-script-header.sh

# General process
message_info "$(date '+%H:%M:%S (%d/%m/%Y)')" 2
message_space 2

docker-compose -p $dfc_global__project_name exec -u dfc-user dfc-host-mariadb ash -c "echo \"find '/dfc-project/dumps/exported/scheduled' -maxdepth 5 -mtime +14 -delete\" >> /home/dfc-user/.dumps.sh" >&1

message_info "В контейнере 'dfc-host-mariadb' добавлена новая задача автоматической очистки старых дампов БД в Cron" 1

# End of script
. $dfc_project_main_folder/Scripts/Dependencies/dfc-script-footer.sh
