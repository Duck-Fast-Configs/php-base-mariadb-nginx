#!/bin/bash

# Extra vars
## There should be no '/' at the end 
dfc_project_main_folder="../../../.."

# Header of script
. $dfc_project_main_folder/Scripts/Dependencies/dfc-script-header.sh

# General process
message_info "$(date '+%H:%M:%S (%m/%d/%y)')" 2
message_space 2

docker-compose -p $dfc_global__project_name exec -u root dfc-host-mariadb ash -c "apk add mariadb"

(cd $dfc_project_main_folder/Scripts/Containers/dfc-host-mariadb/Setup && sh dfc-mariadb_common.sh -d1) >&3
(cd $dfc_project_main_folder/Scripts/Containers/dfc-host-mariadb/Setup && sh dfc-mariadb_client.sh -d1) >&3

docker cp $dfc_project_main_folder/Scripts/Containers/dfc-host-mariadb/Setup/Load/Files/mariadb-server.cnf $dfc_global__project_name--dfc-host-mariadb:/tmp >&1

docker-compose -p $dfc_global__project_name exec -u root dfc-host-mariadb ash -c "rm -f /etc/my.cnf.d/mariadb-server.cnf" >&1
docker-compose -p $dfc_global__project_name exec -u root dfc-host-mariadb ash -c "mv /tmp/mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf" >&1
docker-compose -p $dfc_global__project_name exec -u root dfc-host-mariadb ash -c "chmod 744 /etc/my.cnf.d/mariadb-server.cnf" >&1
docker-compose -p $dfc_global__project_name exec -u root dfc-host-mariadb ash -c "chown root:root /etc/my.cnf.d/mariadb-server.cnf" >&1

docker-compose -p $dfc_global__project_name exec -u root dfc-host-mariadb ash -c "/etc/init.d/mariadb setup"

(cd $dfc_project_main_folder/Scripts/Containers/dfc-host-mariadb/Services/Enable && sh dfc-mariadb.sh -d1) >&3
(cd $dfc_project_main_folder/Scripts/Containers/dfc-host-mariadb/Services/Start && sh dfc-mariadb.sh -d1) >&3

docker-compose -p $dfc_global__project_name exec -u root dfc-host-mariadb ash -c "mysql_secure_installation <<EOF

y
y
$dfc_global__project_mariadb_pass
$dfc_global__project_mariadb_pass
y
n
y
y
EOF"
docker-compose -p $dfc_global__project_name exec -u root dfc-host-mariadb ash -c "mysql -u root -p'$dfc_global__project_mariadb_pass' -e \"create database db_base\"" >&3

(cd $dfc_project_main_folder/Scripts/Containers/dfc-host-mariadb/DB && sh dfc-import-db.sh -d1) >&3
(cd $dfc_project_main_folder/Scripts/Containers/dfc-host-mariadb/DB/Cron && sh dfc-clean.sh -d1) >&3
(cd $dfc_project_main_folder/Scripts/Containers/dfc-host-mariadb/DB/Cron/Add && sh dfc-db-export.sh -d1) >&3
(cd $dfc_project_main_folder/Scripts/Containers/dfc-host-mariadb/DB/Cron/Add && sh dfc-dumps-clean.sh -d1) >&3

docker-compose -p $dfc_global__project_name exec -u root dfc-host-mariadb ash -c "mysql -u root -p'$dfc_global__project_mariadb_pass' -e \"GRANT ALL PRIVILEGES ON *.* TO 'root'@'$dfc_global__project_name--dfc-host-php.dfc-net--dfc-test-4' IDENTIFIED BY '$dfc_global__project_mariadb_pass' WITH GRANT OPTION;\""

message_info "В контейнере 'dfc-host-mariadb' установлен пакет 'mariadb' и готов к работе" 1

# End of script
. $dfc_project_main_folder/Scripts/Dependencies/dfc-script-footer.sh
