#!/bin/bash

# Extra vars
## There should be no '/' at the end
dfc_project_main_folder="../../../.."

# Header of script
. $dfc_project_main_folder/Scripts/Dependencies/dfc-script-header.sh

# General process
message_info "$(date '+%H:%M:%S (%m/%d/%y)')" 2
message_space 2

docker-compose -p $dfc_global__project_name exec -u root dfc-host-php ash -c "apk add nano" >&1
docker-compose -p $dfc_global__project_name exec -u dfc-user dfc-host-php ash -c "echo 'set linenumbers' >> /home/dfc-user/.nanorc" >&1
docker-compose -p $dfc_global__project_name exec -u dfc-user dfc-host-php ash -c "echo 'set softwrap' >> /home/dfc-user/.nanorc" >&1

message_info "В контейнере 'dfc-host-php' установлен пакет 'nano' и готов к работе" 1

# End of script
. $dfc_project_main_folder/Scripts/Dependencies/dfc-script-footer.sh
