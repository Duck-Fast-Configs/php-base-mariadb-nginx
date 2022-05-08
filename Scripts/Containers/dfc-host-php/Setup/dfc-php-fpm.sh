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
docker-compose -p $dfc_global__project_name exec -u root dfc-host-php ash -c "apk add php8-fpm" >&1

docker cp $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Setup/Load/Files/www.conf $dfc_global__project_name--dfc-host-php:/tmp >&1

docker-compose -p $dfc_global__project_name exec -u root dfc-host-php ash -c "rm -f /etc/php8/php-fpm.d/www.conf" >&1
docker-compose -p $dfc_global__project_name exec -u root dfc-host-php ash -c "mv /tmp/www.conf /etc/php8/php-fpm.d/www.conf" >&1
docker-compose -p $dfc_global__project_name exec -u root dfc-host-php ash -c "chmod 0700 /etc/php8/php-fpm.d/www.conf" >&1
docker-compose -p $dfc_global__project_name exec -u root dfc-host-php ash -c "chown dfc-user:dfc-user /etc/php8/php-fpm.d/www.conf" >&1

(cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Services/Enable && sh dfc-php-fpm.sh -d1) >&3

message_info "В контейнере 'dfc-host-php' установлен пакет 'php8-fpm' и готов к работе" 1

# End of script
. $dfc_project_main_folder/Scripts/Dependencies/dfc-script-footer.sh
