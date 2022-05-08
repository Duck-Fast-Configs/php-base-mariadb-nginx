#!/bin/bash

# Extra vars
## There should be no '/' at the end
dfc_project_main_folder="../../../../.."

# Header of script
. $dfc_project_main_folder/Scripts/Dependencies/dfc-script-header.sh

# General process
message_info "$(date '+%H:%M:%S (%m/%d/%y)')" 2
message_space 2

message_info "Ожидайте..." 2
docker-compose -p $dfc_global__project_name exec --privileged -u root dfc-host-php ash -c "ipset restore < /dfc-project/common/firewall/blocklist-1.dump" >&1
docker-compose -p $dfc_global__project_name exec --privileged -u root dfc-host-php ash -c "iptables -I INPUT -m set --match-set blocklist-1 src -j DROP" >&1

message_info "В контейнере 'dfc-host-php' заблокированы все IP адреса из файла 'blocklist-1.dump'" 1

# End of script
. $dfc_project_main_folder/Scripts/Dependencies/dfc-script-footer.sh
