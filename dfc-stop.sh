#!/bin/bash

# Extra vars
## There should be no '/' at the end
dfc_project_main_folder="."

# Header of script
. $dfc_project_main_folder/Scripts/Dependencies/dfc-script-header.sh

# General process
message_info "$(date '+%H:%M:%S (%d/%m/%Y)')" 2
message_space 2

(cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Services/Stop && sh dfc-crond.sh -d1) >&3
(cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Firewall/Transfer && sh dfc-export.sh -d1) >&3

(cd $dfc_project_main_folder/Scripts/Containers/dfc-host-mariadb/Services/Stop && sh dfc-crond.sh -d1) >&3
(cd $dfc_project_main_folder/Scripts/Containers/dfc-host-mariadb/Firewall/Transfer && sh dfc-export.sh -d1) >&3

(cd $dfc_project_main_folder/Scripts/Containers/dfc-host-nginx/Services/Stop && sh dfc-crond.sh -d1) >&3
(cd $dfc_project_main_folder/Scripts/Containers/dfc-host-nginx/Firewall/Transfer && sh dfc-export.sh -d1) >&3
docker-compose -p $dfc_global__project_name stop >&1
message_space 2

message_info "Все контейнеры dfc-проекта остановлены" 1

# End of script
. $dfc_project_main_folder/Scripts/Dependencies/dfc-script-footer.sh
