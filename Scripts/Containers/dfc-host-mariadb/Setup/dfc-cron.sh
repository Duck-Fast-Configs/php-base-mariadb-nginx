#!/bin/bash

# Extra vars
## There should be no '/' at the end
dfc_project_main_folder="../../../.."

# Header of script
. $dfc_project_main_folder/Scripts/Dependencies/dfc-script-header.sh

# General process
message_info "$(date '+%H:%M:%S (%m/%d/%y)')" 2
message_space 2

docker-compose -p $dfc_global__project_name exec -u dfc-user dfc-host-mariadb ash -c "echo -n "" > /home/dfc-user/.cron" >&1
docker-compose -p $dfc_global__project_name exec -u dfc-user dfc-host-mariadb ash -c "echo '* * * * * zsh /home/dfc-user/.power.sh' >> /home/dfc-user/.cron" >&1
docker-compose -p $dfc_global__project_name exec -u dfc-user dfc-host-mariadb ash -c "echo '0 0 * * * zsh /home/dfc-user/.dumps.sh' >> /home/dfc-user/.cron" >&1

message_info "В контейнере 'dfc-host-mariadb' установлен пакет 'cron' и готов к работе" 1

# End of script
. $dfc_project_main_folder/Scripts/Dependencies/dfc-script-footer.sh
