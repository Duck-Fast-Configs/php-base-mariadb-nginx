#!/bin/bash

# Extra vars
## There should be no '/' at the end
dfc_project_main_folder="../../../.."

# Header of script
. $dfc_project_main_folder/Scripts/Dependencies/dfc-script-header.sh

# General process
message_info "$(date '+%H:%M:%S (%m/%d/%y)')" 2
message_space 2

message_info "Ожидайте..." 2
docker-compose -p $dfc_global__project_name exec --privileged -u root dfc-host-mariadb ash -c "clamscan -r -i --remove --exclude-dir='/sys|/proc|/dev' /" >&3
docker-compose -p $dfc_global__project_name exec --privileged -u root dfc-host-mariadb ash -c "echo ''" >&3

message_info "В контейнере 'dfc-host-mariadb' все файлы проверены на вирусы" 1

# End of script
. $dfc_project_main_folder/Scripts/Dependencies/dfc-script-footer.sh
