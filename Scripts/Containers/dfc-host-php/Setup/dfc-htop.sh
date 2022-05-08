#!/bin/bash

# Extra vars
## There should be no '/' at the end
dfc_project_main_folder="../../../.."

# Header of script
. $dfc_project_main_folder/Scripts/Dependencies/dfc-script-header.sh

# General process
message_info "$(date '+%H:%M:%S (%m/%d/%y)')" 2
message_space 2

docker-compose -p $dfc_global__project_name exec -u root dfc-host-php ash -c "apk add htop" >&1
docker-compose -p $dfc_global__project_name exec -u root dfc-host-php ash -c "mkdir -p /home/dfc-user/.config/htop && echo 'color_scheme=1' >> /home/dfc-user/.config/htop/htoprc" >&1

message_info "В контейнере 'dfc-host-php' установлен пакет 'htop' и готов к работе" 1

# End of script
. $dfc_project_main_folder/Scripts/Dependencies/dfc-script-footer.sh
