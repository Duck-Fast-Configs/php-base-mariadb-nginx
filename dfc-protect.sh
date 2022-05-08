#!/bin/bash

# Extra vars
## There should be no '/' at the end
dfc_project_main_folder="."

# Header of script
. $dfc_project_main_folder/Scripts/Dependencies/dfc-script-header.sh

# General process
message_info "$(date '+%H:%M:%S (%d/%m/%Y)')" 2
message_space 2

message_input "Вы уверены что хотите включить режим защиты? (y/n)\n"
message_input "=> "
read -p '' dfc_project_protect
message_space 1

case $dfc_project_protect in
"y")
    message_info "Режим защиты активированы" 1
    message_space 1

    message_info "1. Корректно запускаем контейнеры dfc-проекта" 1
    message_info "Ожидайте..." 1
    docker stop $(docker ps -a -q)
    docker-compose -p $dfc_global__project_name start
    message_space 1

    message_info "2. Активация увеличения производительности" 1
    message_info "Ожидайте..." 1
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Power && sh dfc-highest.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-mariadb/Power && sh dfc-highest.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-nginx/Power && sh dfc-highest.sh -d1) >&3
    message_info "Если нужно будет изменить режим энергопотребления и производительности воспользуйтесь файлом 'dfc-power.sh'" 1
    message_space 1

    message_info "3. Активация режима опасности для брандмауэра" 1
    message_info "Ожидайте..." 1
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-nginx/Firewall/Block && sh dfc-incoming.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-nginx/Firewall/Block && sh dfc-outcoming.sh -d1) >&3
    message_space 1

    message_info "4. Экспорт состояний контейнеров проекта" 1
    message_info "Ожидайте..." 1

    datetime_year=$(date '+%Y')
    datetime_month=$(date '+%m')
    datetime_day=$(date '+%d')
    datetime_time=$(date '+%H_%M_%S')

    rm -rf ./Protect/$datetime_year/$datetime_month/$datetime_day/$datetime_time

    mkdir -p ./Protect/$datetime_year/$datetime_month/$datetime_day/$datetime_time/dfc-host-php
    cp -r ./WorkFolder/Containers/dfc-host-php/Logs ./Protect/$datetime_year/$datetime_month/$datetime_day/$datetime_time/dfc-host-php
    cp -r ./Logs ./Protect/$datetime_year/$datetime_month/$datetime_day/$datetime_time
    docker-compose -p $dfc_global__project_name logs dfc-host-php >> ./Protect/$datetime_year/$datetime_month/$datetime_day/$datetime_time/dfc-host-php/Logs/dfc-container.log
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Antivirus && sh dfc-scan.sh -d1) >> ./Protect/$datetime_year/$datetime_month/$datetime_day/$datetime_time/dfc-host-php/Logs/dfc-antivirus.log
    docker export ${dfc_global__project_name}--dfc-host-php > ./Protect/$datetime_year/$datetime_month/$datetime_day/$datetime_time/dfc-host-php/${dfc_global__project_name}--dfc-host-php.zip >&3

    mkdir -p ./Protect/$datetime_year/$datetime_month/$datetime_day/$datetime_time/dfc-host-mariadb
    cp -r ./WorkFolder/Containers/dfc-host-mariadb/Logs ./Protect/$datetime_year/$datetime_month/$datetime_day/$datetime_time/dfc-host-mariadb
    cp -r ./Logs ./Protect/$datetime_year/$datetime_month/$datetime_day/$datetime_time
    docker-compose -p $dfc_global__project_name logs dfc-host-mariadb >> ./Protect/$datetime_year/$datetime_month/$datetime_day/$datetime_time/dfc-host-mariadb/Logs/dfc-container.log
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-mariadb/Antivirus && sh dfc-scan.sh -d1) >> ./Protect/$datetime_year/$datetime_month/$datetime_day/$datetime_time/dfc-host-mariadb/Logs/dfc-antivirus.log
    docker export ${dfc_global__project_name}--dfc-host-mariadb > ./Protect/$datetime_year/$datetime_month/$datetime_day/$datetime_time/dfc-host-mariadb/${dfc_global__project_name}--dfc-host-mariadb.zip >&3

    mkdir -p ./Protect/$datetime_year/$datetime_month/$datetime_day/$datetime_time/dfc-host-nginx
    cp -r ./WorkFolder/Containers/dfc-host-nginx/Logs ./Protect/$datetime_year/$datetime_month/$datetime_day/$datetime_time/dfc-host-nginx
    cp -r ./Logs ./Protect/$datetime_year/$datetime_month/$datetime_day/$datetime_time
    docker-compose -p $dfc_global__project_name logs dfc-host-nginx >> ./Protect/$datetime_year/$datetime_month/$datetime_day/$datetime_time/dfc-host-nginx/Logs/dfc-container.log
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-nginx/Antivirus && sh dfc-scan.sh -d1) >> ./Protect/$datetime_year/$datetime_month/$datetime_day/$datetime_time/dfc-host-nginx/Logs/dfc-antivirus.log
    docker export ${dfc_global__project_name}--dfc-host-nginx > ./Protect/$datetime_year/$datetime_month/$datetime_day/$datetime_time/dfc-host-nginx/${dfc_global__project_name}--dfc-host-nginx.zip >&3
    
    message_space 1

    message_info "5. Корректно останавливаем контейнеры dfc-проекта" 1
    message_info "Ожидайте..." 1
    docker stop $(docker ps -a -q)
    message_space 1

    message_info "Режим защиты отключен" 1
    ;;
*)
    message_info "Процесс остановлен"
    
    . $dfc_project_main_folder/Scripts/Dependencies/dfc-message-exit.sh >&3
    ;;
esac

# End of script
. $dfc_project_main_folder/Scripts/Dependencies/dfc-script-footer.sh
