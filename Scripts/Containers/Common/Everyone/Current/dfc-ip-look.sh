#!/bin/bash

# Extra vars
## There should be no '/' at the end
dfc_project_main_folder="../../../../.."

# Header of script
. $dfc_project_main_folder/Scripts/Dependencies/dfc-script-header.sh

# General process
message_info "$(date '+%H:%M:%S (%d/%m/%Y)')" 2
message_space 2
message_input "Список контейнеров:\n"
message_input "1. dfc-host-php\n"
message_input "2. dfc-host-mariadb\n"
message_input "3. dfc-host-nginx\n"
message_input "=> "
read -p '' dfc_container
message_space 1

case $dfc_container in
"1")
    message_info "IP адрес"
    message_space_null
    docker-compose -p $dfc_global__project_name exec -u root dfc-host-php ash -c "hostname -i" >&3
    message_space_null
    ;;
"2")
    message_info "IP адрес"
    message_space_null
    docker-compose -p $dfc_global__project_name exec -u root dfc-host-mariadb ash -c "hostname -i" >&3
    message_space_null
    ;;
"3")
    message_info "IP адрес"
    message_space_null
    docker-compose -p $dfc_global__project_name exec -u root dfc-host-nginx ash -c "hostname -i" >&3
    message_space_null
    ;;
esac

# End of script
. $dfc_project_main_folder/Scripts/Dependencies/dfc-script-footer.sh
