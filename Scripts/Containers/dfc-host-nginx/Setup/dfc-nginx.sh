#!/bin/bash

# Extra vars
## There should be no '/' at the end 
dfc_project_main_folder="../../../.."

# Header of script
. $dfc_project_main_folder/Scripts/Dependencies/dfc-script-header.sh

# General process
message_info "$(date '+%H:%M:%S (%m/%d/%y)')" 2
message_space 2

docker-compose -p $dfc_global__project_name exec -u root dfc-host-nginx ash -c "apk add nginx" >&1

(cd $dfc_project_main_folder/Scripts/Containers/dfc-host-nginx/Setup && sh dfc-apache2_utils.sh -d1) >&3

docker-compose -p $dfc_global__project_name exec -u root dfc-host-nginx ash -c "rm -f /etc/nginx/.nginx_auth_passwd" >&1
docker-compose -p $dfc_global__project_name exec -u root dfc-host-nginx ash -c "htpasswd -c -B -b /etc/nginx/.nginx_auth_passwd $dfc_global__project_nginx_login $dfc_global__project_nginx_pass" >&1
docker-compose -p $dfc_global__project_name exec -u root dfc-host-nginx ash -c "chmod 0744 /etc/nginx/.nginx_auth_passwd" >&1
docker-compose -p $dfc_global__project_name exec -u root dfc-host-nginx ash -c "chown root:root /etc/nginx/.nginx_auth_passwd" >&1


docker cp $dfc_project_main_folder/Scripts/Containers/dfc-host-nginx/Setup/Load/Files/nginx.conf $dfc_global__project_name--dfc-host-nginx:/tmp >&1

docker-compose -p $dfc_global__project_name exec -u root dfc-host-nginx ash -c "rm -f /etc/nginx/nginx.conf" >&1
docker-compose -p $dfc_global__project_name exec -u root dfc-host-nginx ash -c "mv /tmp/nginx.conf /etc/nginx/nginx.conf" >&1
docker-compose -p $dfc_global__project_name exec -u root dfc-host-nginx ash -c "chmod 0744 /etc/nginx/nginx.conf" >&1
docker-compose -p $dfc_global__project_name exec -u root dfc-host-nginx ash -c "chown root:root /etc/nginx/nginx.conf" >&1

docker cp $dfc_project_main_folder/Scripts/Containers/dfc-host-nginx/Setup/Load/Files/localhost.crt $dfc_global__project_name--dfc-host-nginx:/tmp >&1

docker-compose -p $dfc_global__project_name exec -u root dfc-host-nginx ash -c "rm -f /etc/nginx/localhost.crt" >&1
docker-compose -p $dfc_global__project_name exec -u root dfc-host-nginx ash -c "mv /tmp/localhost.crt /etc/nginx/localhost.crt" >&1
docker-compose -p $dfc_global__project_name exec -u root dfc-host-nginx ash -c "chmod 0744 /etc/nginx/localhost.crt" >&1
docker-compose -p $dfc_global__project_name exec -u root dfc-host-nginx ash -c "chown root:root /etc/nginx/localhost.crt" >&1

docker cp $dfc_project_main_folder/Scripts/Containers/dfc-host-nginx/Setup/Load/Files/localhost.key $dfc_global__project_name--dfc-host-nginx:/tmp >&1

docker-compose -p $dfc_global__project_name exec -u root dfc-host-nginx ash -c "rm -f /etc/nginx/localhost.key" >&1
docker-compose -p $dfc_global__project_name exec -u root dfc-host-nginx ash -c "mv /tmp/localhost.key /etc/nginx/localhost.key" >&1
docker-compose -p $dfc_global__project_name exec -u root dfc-host-nginx ash -c "chmod 0744 /etc/nginx/localhost.key" >&1
docker-compose -p $dfc_global__project_name exec -u root dfc-host-nginx ash -c "chown root:root /etc/nginx/localhost.key" >&1

(cd $dfc_project_main_folder/Scripts/Containers/dfc-host-nginx/Services/Enable && sh dfc-nginx.sh -d1) >&3
(cd $dfc_project_main_folder/Scripts/Containers/dfc-host-nginx/Services/Start && sh dfc-nginx.sh -d1) >&3

message_info "В контейнере 'dfc-host-nginx' установлен пакет 'nginx' и готов к работе" 1

# End of script
. $dfc_project_main_folder/Scripts/Dependencies/dfc-script-footer.sh
