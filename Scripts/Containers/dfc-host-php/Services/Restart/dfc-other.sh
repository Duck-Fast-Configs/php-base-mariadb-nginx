#!/bin/bash

# Extra vars
## There should be no '/' at the end
dfc_project_main_folder="../../../../.."

# Header of script
. $dfc_project_main_folder/Scripts/Dependencies/dfc-script-header.sh

# General process
message_info "$(date '+%H:%M:%S (%m/%d/%y%)')" 2
message_space 2

message_input "Название сервиса\n"
message_input "=> "
read -p '' dfc_project_service_name
message_space 1

docker-compose -p $dfc_global__project_name exec -u root dfc-host-php ash -c "rc-service ${dfc_project_service_name} restart" >&1

message_info "В контейнере 'dfc-host-php' сервис '${dfc_project_service_name}' перезапущен" 1

# End of script
. $dfc_project_main_folder/Scripts/Dependencies/dfc-script-footer.sh
