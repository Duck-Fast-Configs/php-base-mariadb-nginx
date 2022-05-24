#!/bin/bash

# Extra vars
## There should be no '/' at the end 
export dfc_project_main_folder="../../../.."

# Header of script
. $dfc_project_main_folder/Scripts/Dependencies/dfc-script-header.sh

# General process
message_info "$(date '+%H:%M:%S (%d/%m/%Y)')" 2
message_space 2

message_info "Идет экспорт дефолтной базы данных db_base" 1
file_sql="$(echo dump--db_name=db_base--time=$(date '+%H_%M_%S--date=%d_%m_%Y').sql)"
message_info "Итого экспортированный файл БД будет в ./WorkFolder/Containers/dfc-host-mariadb/Dumps/Exported/Unscheduled/${file_sql}" 1
docker-compose -p $dfc_global__project_name exec -u root dfc-host-mariadb ash -c "mkdir -p /dfc-project/dumps/exported/unscheduled" >&1
docker-compose -p $dfc_global__project_name exec -u root dfc-host-mariadb ash -c "mysqldump -u root -p'$dfc_global__project_mariadb_pass' db_base > /dfc-project/dumps/exported/unscheduled/db_base.sql" >&1
message_info "В контейнере 'dfc-host-mariadb' база данных была экспортирована" 1

# End of script
. $dfc_project_main_folder/Scripts/Dependencies/dfc-script-footer.sh
