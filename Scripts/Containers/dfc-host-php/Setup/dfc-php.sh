#!/bin/bash

# Extra vars
## There should be no '/' at the end 
dfc_project_main_folder="../../../.."

# Header of script
. $dfc_project_main_folder/Scripts/Dependencies/dfc-script-header.sh

# General process
message_info "$(date '+%H:%M:%S (%m/%d/%y)')" 2
message_space 2

docker-compose -p $dfc_global__project_name exec -u root dfc-host-php ash -c "mkdir /var/log/php8" >&1
docker-compose -p $dfc_global__project_name exec -u root dfc-host-php ash -c "apk add php8" >&1
docker-compose -p $dfc_global__project_name exec -u dfc-user dfc-host-php ash -c "echo 'alias php=\"/usr/bin/php8\"' >> \${ZDOTDIR:-\$HOME}/.zshrc" >&1

docker cp $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Setup/Load/Files/php.ini $dfc_global__project_name--dfc-host-php:/tmp >&1

docker-compose -p $dfc_global__project_name exec -u root dfc-host-php ash -c "rm -f /etc/php8/php.ini" >&1
docker-compose -p $dfc_global__project_name exec -u root dfc-host-php ash -c "mv /tmp/php.ini /etc/php8/php.ini" >&1

message_info "В контейнере 'dfc-host-php' установлен пакет 'php8' и готов к работе" 1

# End of script
. $dfc_project_main_folder/Scripts/Dependencies/dfc-script-footer.sh
