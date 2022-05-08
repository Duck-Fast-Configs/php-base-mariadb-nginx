#!/bin/bash

# Extra vars
## There should be no '/' at the end
dfc_project_main_folder="../../../.."

# Header of script
. $dfc_project_main_folder/Scripts/Dependencies/dfc-script-header.sh

# General process
message_info "$(date '+%H:%M:%S (%m/%d/%y)')" 2
message_space 2

message_input "Название пакета\n"
message_input "=> "
read -p '' dfc_project_package_name
message_space 1

docker-compose -p $dfc_global__project_name exec -u dfc-user dfc-host-php zsh -c "echo ''" >&3
docker-compose -p $dfc_global__project_name exec -u dfc-user dfc-host-php zsh -c "${dfc_project_package_name}" >&3
docker-compose -p $dfc_global__project_name exec -u dfc-user dfc-host-php zsh -c "echo ''" >&3
message_info "В контейнере 'dfc-host-php' осуществлена попытка запуска пакета '${dfc_project_package_name}'" 1

# End of script
. $dfc_project_main_folder/Scripts/Dependencies/dfc-script-footer.sh
