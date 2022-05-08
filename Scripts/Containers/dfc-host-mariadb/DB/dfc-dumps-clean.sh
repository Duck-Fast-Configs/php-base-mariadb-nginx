#!/bin/bash

# Extra vars
## There should be no '/' at the end 
export dfc_project_main_folder="../../../.."

# Header of script
. $dfc_project_main_folder/Scripts/Dependencies/dfc-script-header.sh

# General process
message_info "$(date '+%H:%M:%S (%d/%m/%Y)')" 2
message_space 2

docker-compose -p $dfc_global__project_name exec -u root dfc-host-mariadb ash -c "find '/dfc-project/dumps/exported/scheduled' -maxdepth 5 -mtime +14 -delete" >&1
message_info "В контейнере 'dfc-host-mariadb' очищены экспортированные дампы баз данных старше 14 дней" 1

# End of script
. $dfc_project_main_folder/Scripts/Dependencies/dfc-script-footer.sh
