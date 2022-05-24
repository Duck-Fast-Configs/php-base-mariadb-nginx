#!/bin/bash

# Extra vars
## There should be no '/' at the end
dfc_project_main_folder="."

# Header of script
. $dfc_project_main_folder/Scripts/Dependencies/dfc-script-header.sh

# General process
gitDownload() {
    git clone https://github.com/Duck-Fast-Configs/php-base-mariadb-nginx.git ./.temp/
    rm -rf $dfc_project_main_folder/.temp/.git
    rm -rf $dfc_project_main_folder/.temp/WorkFolder/Containers/dfc-host-php/Files
    cp -a $dfc_project_main_folder/.temp/. $dfc_project_main_folder/
    rm -rf $dfc_project_main_folder/.temp
}

removeProject() {
    docker-compose -p $dfc_global__project_name exec -u root dfc-host-mariadb ash -c "mkdir -p /dfc-project/dumps/exported/unscheduled/db_base" >&1
    docker-compose -p $dfc_global__project_name exec -u root dfc-host-mariadb ash -c "mysqldump -u root -p'$dfc_global__project_mariadb_pass' db_base > /dfc-project/dumps/exported/unscheduled/db_base.sql" >&1
    docker-compose -p $dfc_global__project_name down -v --rmi all --remove-orphans >&1
}

setupProject() {
    message_info "$(date '+%H:%M:%S (%d/%m/%Y)')" 2
    message_space 2

    message_input "Введите название dfc-проекта\n"
    message_input "=> "
    read -p '' dfc_global__project_name >&3
    message_space 1

    message_info "Поле опциональное" 1
    message_input "Введите описание dfc-проекта\n"
    message_input "=> "
    read -p '' dfc_global__project_description >&3
    message_space 1

    dfc_global__project_type="php-base-mariadb-nginx"
    dfc_global__project_create_time="$(date '+%H:%M:%S (%d/%m/%Y)')"
    dfc_global__project_cpu_type=$(uname -m)

    [ "$OSTYPE" == "linux-gnu" ] && 
    dfc_global__project_os="linux" || 
    dfc_global__project_os="macOS"

    [ "$OSTYPE" == "linux-gnu" ] && 
    dfc_global__project_host="unix:///run/docker.sock" || 
    dfc_global__project_host="unix:///var/run/docker.sock"

    dfc_global__project_mariadb_pass=$(openssl rand -base64 32)
    dfc_global__project_nginx_login=$(openssl rand -base64 32)
    dfc_global__project_nginx_pass=$(openssl rand -base64 32)

    message_info "Поле опциональное" 1
    message_input "Введите ваше имя\n"
    message_input "=> "
    read -p '' dfc_project_creator_name >&3
    message_space 1

    message_info "Поле опциональное" 1
    message_input "Введите вашу фамилию\n"
    message_input "=> "
    read -p '' dfc_project_creator_surname >&3
    message_space 1

    dfc_global__project_creator="$dfc_project_creator_name $dfc_project_creator_surname"

    message_info "Ожидайте..." 1
    docker stop $(docker ps -a -q) >&1

    # Include
    . $dfc_project_main_folder/Scripts/Dependencies/dfc-config-set.sh >&3
    . $dfc_project_main_folder/Scripts/Dependencies/dfc-config-get.sh $1 >&3

    # General process
    docker-compose -p $dfc_global__project_name up --build -d >&1
    docker-compose -p $dfc_global__project_name restart >&1

    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Setup/Users && sh dfc-default.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Setup && sh dfc-sudo.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Setup && sh dfc-zsh.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Setup/Repositories && sh dfc-clean.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Setup/Repositories/Add && sh dfc-main.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Setup/Repositories/Add && sh dfc-community.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Setup/Repositories && sh dfc-update.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Setup && sh dfc-upgrade.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Setup && sh dfc-neofetch.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Setup && sh dfc-cputool.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Setup && sh dfc-clamav.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Setup && sh dfc-stress_ng.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Setup && sh dfc-curl.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Setup && sh dfc-iptables.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Setup && sh dfc-ipset.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Setup && sh dfc-nano.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Setup && sh dfc-wget.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Setup && sh dfc-zip.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Setup && sh dfc-unzip.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Setup && sh dfc-git.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Setup && sh dfc-dust.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Setup && sh dfc-tmux.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Setup && sh dfc-nload.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Setup && sh dfc-viu.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Setup && sh dfc-htop.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Setup && sh dfc-php.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Setup && sh dfc-php-mysqli.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Setup && sh dfc-php-fpm.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Timezones && sh dfc-default.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Timezones && sh dfc-update.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Setup && sh dfc-clean.sh -d1) >&3

    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-mariadb/Setup/Users && sh dfc-default.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-mariadb/Setup && sh dfc-sudo.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-mariadb/Setup && sh dfc-zsh.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-mariadb/Setup && sh dfc-cron.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-mariadb/Setup/Repositories && sh dfc-clean.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-mariadb/Setup/Repositories/Add && sh dfc-main.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-mariadb/Setup/Repositories/Add && sh dfc-community.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-mariadb/Setup/Repositories && sh dfc-update.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-mariadb/Setup && sh dfc-upgrade.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-mariadb/Setup && sh dfc-neofetch.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-mariadb/Setup && sh dfc-cputool.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-mariadb/Setup && sh dfc-clamav.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-mariadb/Setup && sh dfc-stress_ng.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-mariadb/Setup && sh dfc-curl.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-mariadb/Setup && sh dfc-iptables.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-mariadb/Setup && sh dfc-ipset.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-mariadb/Setup && sh dfc-nano.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-mariadb/Setup && sh dfc-wget.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-mariadb/Setup && sh dfc-zip.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-mariadb/Setup && sh dfc-unzip.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-mariadb/Setup && sh dfc-dust.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-mariadb/Setup && sh dfc-tmux.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-mariadb/Setup && sh dfc-nload.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-mariadb/Setup && sh dfc-viu.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-mariadb/Setup && sh dfc-htop.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-mariadb/Setup && sh dfc-mariadb.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-mariadb/Timezones && sh dfc-default.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-mariadb/Timezones && sh dfc-update.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-mariadb/Setup && sh dfc-clean.sh -d1) >&3

    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-nginx/Setup/Users && sh dfc-default.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-nginx/Setup && sh dfc-sudo.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-nginx/Setup && sh dfc-zsh.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-nginx/Setup/Repositories && sh dfc-clean.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-nginx/Setup/Repositories/Add && sh dfc-main.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-nginx/Setup/Repositories/Add && sh dfc-community.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-nginx/Setup/Repositories && sh dfc-update.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-nginx/Setup && sh dfc-upgrade.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-nginx/Setup && sh dfc-neofetch.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-nginx/Setup && sh dfc-cputool.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-nginx/Setup && sh dfc-clamav.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-nginx/Setup && sh dfc-stress_ng.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-nginx/Setup && sh dfc-curl.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-nginx/Setup && sh dfc-iptables.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-nginx/Setup && sh dfc-ipset.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-nginx/Setup && sh dfc-nano.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-nginx/Setup && sh dfc-wget.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-nginx/Setup && sh dfc-zip.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-nginx/Setup && sh dfc-unzip.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-nginx/Setup && sh dfc-dust.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-nginx/Setup && sh dfc-tmux.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-nginx/Setup && sh dfc-nload.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-nginx/Setup && sh dfc-viu.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-nginx/Setup && sh dfc-htop.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-nginx/Setup && sh dfc-nginx.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-nginx/Timezones && sh dfc-default.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-nginx/Timezones && sh dfc-update.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-nginx/Setup && sh dfc-clean.sh -d1) >&3
    message_space 1
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Antivirus && sh dfc-update.sh -d1) >&3
    message_space 1
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Project && sh dfc-change.sh -d1) >&3

    docker-compose -p $dfc_global__project_name stop >&1
    docker-compose -p $dfc_global__project_name start >&1

    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-nginx/Firewall/Block && sh dfc-insecure.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Power && sh dfc-high.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-mariadb/Power && sh dfc-high.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-nginx/Power && sh dfc-high.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Services/Start && sh dfc-crond.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-mariadb/Services/Start && sh dfc-crond.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-nginx/Services/Start && sh dfc-crond.sh -d1) >&3
    message_space 1
    message_info "Установка завершена" 1
}

message_info "$(date '+%H:%M:%S (%d/%m/%Y)')" 2
message_info "После обновления dfc-проект может не запуститься и все ваши изменения могут быть отменены, кроме тех изменений, которые были сделаны в самих файлах вашего проекта" 1
message_space 1
message_input "Вы точно хотите обновиться? (y/n)\n"
message_input "=> "
read -p '' dock
message_space 1

case $dock in
"n")
    message_info "Процесс остановлен" 1

    . $dfc_project_main_folder/Scripts/Dependencies/dfc-message-exit.sh >&3
    ;;
esac

message_info "Обновление началось" 1
removeProject
gitDownload
setupProject
message_info "Проект развернут" 1
message_info "Обновление завершено" 1

# End of script
. $dfc_project_main_folder/Scripts/Dependencies/dfc-script-footer.sh
