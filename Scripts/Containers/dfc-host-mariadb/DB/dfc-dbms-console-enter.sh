#!/bin/bash

# Extra vars
## There should be no '/' at the end 
export dfc_project_main_folder="../../../.."

# Header of script
. $dfc_project_main_folder/Scripts/Dependencies/dfc-script-header.sh

# General process
message_info "$(date '+%H:%M:%S (%d/%m/%Y)')" 2
message_space 2

message_info "В контейнере 'dfc-host-mariadb' производится вход в СУБД" 1
docker-compose -p $dfc_global__project_name exec -u postgres dfc-host-mariadb ash -c "mysql -u root -p'$dfc_global__project_mariadb_pass'" >&3

# End of script
. $dfc_project_main_folder/Scripts/Dependencies/dfc-script-footer.sh
