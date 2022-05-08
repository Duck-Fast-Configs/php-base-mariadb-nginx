#!/bin/bash

# Extra vars
## There should be no '/' at the end
dfc_project_main_folder="../../../../.."

# Header of script
. $dfc_project_main_folder/Scripts/Dependencies/dfc-script-header.sh

# General process
message_info "$(date '+%H:%M:%S (%m/%d/%y%)')" 2
message_space 2

docker-compose -p $dfc_global__project_name exec -u root dfc-host-php ash -c "rc-update del php-fpm8 boot" >&1

message_info "Для деактивации сервиса требуется перезапустить dfc-проект" 1
message_info "В контейнере 'dfc-host-php' сервис 'php-fpm' удален из автозапуска" 1

# End of script
. $dfc_project_main_folder/Scripts/Dependencies/dfc-script-footer.sh
