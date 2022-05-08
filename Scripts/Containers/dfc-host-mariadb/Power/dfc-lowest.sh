#!/bin/bash

# Extra vars
## There should be no '/' at the end
dfc_project_main_folder="../../../.."

# Header of script
. $dfc_project_main_folder/Scripts/Dependencies/dfc-script-header.sh

# General process
message_info "$(date '+%H:%M:%S (%m/%d/%y)')" 2
docker-compose -p $dfc_global__project_name exec -u dfc-user dfc-host-mariadb ash -c "echo -n "" > /home/dfc-user/.power.sh" >&1
docker-compose -p $dfc_global__project_name exec -u root dfc-host-mariadb ash -c "echo 'pkill -f cpulimit' >> /home/dfc-user/.power.sh" >&1
docker-compose -p $dfc_global__project_name exec -u root dfc-host-mariadb ash -c "echo 'for process in \$(echo \"\$(ps -eo pid)\" |  sed s/\" \"//g); do zsh -c \"cpulimit --pid=\$process --limit=\$(echo '\$((\$(nproc --all) * 8))')\" & done' >> /home/dfc-user/.power.sh" >&1
docker-compose -p $dfc_global__project_name exec --detach -u root dfc-host-mariadb ash -c "/usr/bin/crontab /home/dfc-user/.cron" >&1
message_info "В контейнере 'dfc-host-mariadb' установлен режим минимальной производительности и максимальной экономии энергии" 1

# End of script
. $dfc_project_main_folder/Scripts/Dependencies/dfc-script-footer.sh
