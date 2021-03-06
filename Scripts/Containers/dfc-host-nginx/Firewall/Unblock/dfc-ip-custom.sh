#!/bin/bash

# Extra vars
## There should be no '/' at the end
dfc_project_main_folder="../../../../.."

# Header of script
. $dfc_project_main_folder/Scripts/Dependencies/dfc-script-header.sh

# General process
message_info "$(date '+%H:%M:%S (%m/%d/%y)')" 2
message_space 2

message_input "IP адрес\n"
message_input "=> "
read -p '' dfc_project_firewall_custom_ip
message_space 1

docker-compose -p $dfc_global__project_name exec --privileged -u root dfc-host-nginx ash -c "iptables -I INPUT -s $dfc_project_firewall_custom_ip -j ACCEPT" >&1

message_info "В контейнере 'dfc-host-nginx' IP адрес '$dfc_project_firewall_custom_ip' разблокирован" 1

# End of script
. $dfc_project_main_folder/Scripts/Dependencies/dfc-script-footer.sh
