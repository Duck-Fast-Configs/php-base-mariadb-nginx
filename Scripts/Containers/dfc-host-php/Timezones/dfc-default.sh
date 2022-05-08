#!/bin/bash

# Extra vars
## There should be no '/' at the end
dfc_project_main_folder="../../../.."

# Header of script
. $dfc_project_main_folder/Scripts/Dependencies/dfc-script-header.sh

# General process
docker-compose -p $dfc_global__project_name exec --privileged -u root dfc-host-php ash -c "apk add tzdata"
docker-compose -p $dfc_global__project_name exec --privileged -u root dfc-host-php ash -c "cp /usr/share/zoneinfo/Europe/Minsk /etc/localtime" >&1

message_info "В контейнере 'dfc-host-php' время обновлено в соответствии с регионом Минск" 1

# End of script
. $dfc_project_main_folder/Scripts/Dependencies/dfc-script-footer.sh
