#!/bin/bash

# Extra vars
## There should be no '/' at the end 
dfc_project_main_folder="../../../../.."

# Header of script
. $dfc_project_main_folder/Scripts/Dependencies/dfc-script-header.sh

# General process
message_info "$(date '+%H:%M:%S (%m/%d/%y%)')" 2
message_space 2

docker-compose -p $dfc_global__project_name exec -u root dfc-host-nginx ash -c "rc-update add nginx boot" >&1

($dfc_project_main_folder/Scripts/Containers/dfc-host-nginx/Services/Enable && sh dfc-nginx.sh -d1) >&3
($dfc_project_main_folder/Scripts/Containers/dfc-host-nginx/Services/Start && sh dfc-nginx.sh -d1) >&3

message_info "В контейнере 'dfc-host-nginx' сервис 'nginx' включен в автозапуск" 1

# End of script
. $dfc_project_main_folder/Scripts/Dependencies/dfc-script-footer.sh
