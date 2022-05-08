#!/bin/bash

# Extra vars
## There should be no '/' at the end
dfc_project_main_folder="../../../.."

# Header of script
. $dfc_project_main_folder/Scripts/Dependencies/dfc-script-header.sh

# General process
message_info "$(date '+%H:%M:%S (%m/%d/%y)')" 2
docker-compose -p $dfc_global__project_name exec --privileged -u dfc-user dfc-host-php ash -c "echo -n "" > \${ZDOTDIR:-\$HOME}/.power.sh"
docker-compose -p $dfc_global__project_name exec --privileged -u dfc-user dfc-host-php ash -c "echo -n "" > \${ZDOTDIR:-\$HOME}/.power"
docker-compose -p $dfc_global__project_name exec --privileged -u root dfc-host-php ash -c "echo 'pkill -f cpulimit' >> /home/dfc-user/.power.sh" >&1
docker-compose -p $dfc_global__project_name exec --privileged -u root dfc-host-php ash -c "echo 'for process in \$(echo \"\$(ps -eo pid)\" |  sed s/\" \"//g); do zsh -c \"cpulimit --pid=\$process --limit=\$(echo '\$((\$(nproc --all) * (1 * 100 / 3 * 1)))')\" & done' >> /home/dfc-user/.power.sh" >&1
docker-compose -p $dfc_global__project_name exec --privileged -u root dfc-host-php ash -c "echo '* * * * * zsh /home/dfc-user/.power.sh' >> /home/dfc-user/.power" >&1
docker-compose -p $dfc_global__project_name exec --privileged --detach -u root dfc-host-php ash -c "/usr/bin/crontab /home/dfc-user/.power" >&1
message_info "В контейнере 'dfc-host-php' установлен режим низкой производительности и высокой экономии энергии" 1

# End of script
. $dfc_project_main_folder/Scripts/Dependencies/dfc-script-footer.sh
