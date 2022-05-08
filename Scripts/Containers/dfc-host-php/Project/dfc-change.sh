#!/bin/bash

# Extra vars
## There should be no '/' at the end
dfc_project_main_folder="../../../.."

# Header of script
. $dfc_project_main_folder/Scripts/Dependencies/dfc-script-header.sh

# General process
message_info "$(date '+%H:%M:%S (%m/%d/%y)')" 2
message_space 2

message_input "Варианты проекта:\n"
message_input "1. Стандартный проект\n"
message_input "2. Moodle проект\n"
message_input "3. PHPBB проект\n"
message_input "4. Пропустить выбор варианта проекта\n"
message_input "=> "
read -p '' dfc_project_input_choice

case $dfc_project_input_choice in
"1")
    message_space 1
    message_input "Варианты разворачивания:\n"
    message_input "1. Начать новый 'стандартный' проект\n"
    message_input "2. Скачать проект типа 'стандартный' с помощью git (только https)\n"
    message_input "3. Проектом типа 'стандартный' поделился другой человек\n"
    message_input "4. Выйти\n"
    message_input "=> "
    read -p '' dfc_project_container
    message_space 1

    case $dfc_project_container in
    "1")
        message_info "Ожидайте..." 1
        docker-compose -p $dfc_global__project_name exec -u dfc-user dfc-host-php zsh -c "rm -rf *" >&1
        docker-compose -p $dfc_global__project_name exec -u dfc-user dfc-host-php zsh -c "rm -rf .*" >&1
        docker-compose -p $dfc_global__project_name exec -u dfc-user dfc-host-php zsh -c "echo \"<?php \necho 'Hello world';\" > index.php" >&1
        ;;
    "2")
        message_info "Ожидайте..." 1
        (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-mariadb/DB && sh dfc-import-db.sh -d1) >&3
        message_info "В контейнере 'dfc-host-mariadb' произведен импорт БД" 1
        ;;
    "3")
        message_info "Ожидайте..." 1
        (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-mariadb/DB && sh dfc-import-db.sh -d1) >&3
        message_info "В контейнере 'dfc-host-mariadb' произведен импорт БД" 1
        ;;
    "4")
        . $dfc_project_main_folder/Scripts/Dependencies/dfc-message-exit.sh >&3
        ;;
    *)
        . $dfc_project_main_folder/Scripts/Dependencies/dfc-message-exit.sh >&3
        ;;
    esac
    ;;
"2")
    message_space 1
    message_input "Варианты разворачивания:\n"
    message_input "1. Начать новый 'Moodle' проект\n"
    message_input "2. Скачать проект типа 'Moodle' с помощью git (только https)\n"
    message_input "3. Проектом типа 'Moodle' поделился другой человек\n"
    message_input "4. Выйти\n"
    message_input "=> "
    read -p '' dfc_project_container
    message_space 1

    case $dfc_project_container in
    "1")
        message_info "Ожидайте..." 1
        (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Setup && sh dfc-php-opcache.sh -d1) >&3
        (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Setup && sh dfc-php-curl.sh -d1) >&3
        (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Setup && sh dfc-php-zip.sh -d1) >&3
        (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Setup && sh dfc-php-iconv.sh -d1) >&3
        (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Setup && sh dfc-php-ctype.sh -d1) >&3
        (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Setup && sh dfc-php-xmlrpc.sh -d1) >&3
        (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Setup && sh dfc-php-mbstring.sh -d1) >&3
        (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Setup && sh dfc-php-gd.sh -d1) >&3
        (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Setup && sh dfc-php-simplexml.sh -d1) >&3
        (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Setup && sh dfc-php-dom.sh -d1) >&3
        (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Setup && sh dfc-php-xmlreader.sh -d1) >&3
        (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Setup && sh dfc-php-intl.sh -d1) >&3
        (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Setup && sh dfc-php-fileinfo.sh -d1) >&3
        (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Setup && sh dfc-php-tokenizer.sh -d1) >&3
        (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Setup && sh dfc-php-xmlrpc.sh -d1) >&3
        (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Setup && sh dfc-php-soap.sh -d1) >&3
        (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Setup && sh dfc-php-sodium.sh -d1) >&3
        (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Setup && sh dfc-php-session.sh -d1) >&3
        (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Setup && sh dfc-php-openssl.sh -d1) >&3
        (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Setup && sh dfc-php-exif.sh -d1) >&3

        message_info "В контейнере 'dfc-host-nginx' вносим изменения в Nginx" 1
        (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-nginx/Services/Stop && sh dfc-nginx.sh -d1) >&3
        docker cp $dfc_project_main_folder/Scripts/Containers/dfc-host-nginx/Project/moodle/nginx.conf $dfc_global__project_name--dfc-host-nginx:/tmp >&1
        docker-compose -p $dfc_global__project_name exec -u root dfc-host-nginx ash -c "rm -f /etc/nginx/nginx.conf" >&1
        docker-compose -p $dfc_global__project_name exec -u root dfc-host-nginx ash -c "mv /tmp/nginx.conf /etc/nginx/nginx.conf" >&1
        docker-compose -p $dfc_global__project_name exec -u root dfc-host-nginx ash -c "chmod 0744 /etc/nginx/nginx.conf" >&1
        docker-compose -p $dfc_global__project_name exec -u root dfc-host-nginx ash -c "chown root:root /etc/nginx/nginx.conf" >&1
        (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-nginx/Services/Start && sh dfc-nginx.sh -d1) >&3

        message_info "В контейнере 'dfc-host-php' очищаем целевую папку" 1
        docker-compose -p $dfc_global__project_name exec -u dfc-user dfc-host-php ash -c "rm -rf /dfc-project/files/*" >&1
        docker-compose -p $dfc_global__project_name exec -u dfc-user dfc-host-php ash -c "rm -rf /dfc-project/files/.*" >&1
        docker-compose -p $dfc_global__project_name exec -u dfc-user dfc-host-php ash -c "mkdir -p /dfc-project/files/moodle" >&1
        docker-compose -p $dfc_global__project_name exec -u dfc-user dfc-host-php ash -c "mkdir -p /dfc-project/files/moodledata" >&1

        message_info "В контейнере 'dfc-host-php' скачиваем Moodle 4.0.0" 1
        docker-compose -p $dfc_global__project_name exec -u dfc-user dfc-host-php ash -c "rm -f /tmp/moodle.zip" >&1
        docker-compose -p $dfc_global__project_name exec -u dfc-user dfc-host-php ash -c "rm -rf /tmp/moodle-4.0.0" >&1
        docker-compose -p $dfc_global__project_name exec -u dfc-user dfc-host-php ash -c "curl -sS https://codeload.github.com/moodle/moodle/zip/refs/tags/v4.0.0 > /tmp/moodle.zip" >&1
        docker-compose -p $dfc_global__project_name exec -u dfc-user dfc-host-php ash -c "unzip /tmp/moodle.zip -d /tmp" >&1
        docker-compose -p $dfc_global__project_name exec -u dfc-user dfc-host-php ash -c "cp -r /tmp/moodle-4.0.0/. /dfc-project/files/moodle" >&1
        docker-compose -p $dfc_global__project_name exec -u dfc-user dfc-host-php ash -c "rm -f /tmp/moodle.zip" >&1
        ;;
    "2")
        message_info "Ожидайте..." 1
        (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Setup && sh dfc-php-opcache.sh -d1) >&3
        (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Setup && sh dfc-php-curl.sh -d1) >&3
        (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Setup && sh dfc-php-zip.sh -d1) >&3
        (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Setup && sh dfc-php-iconv.sh -d1) >&3
        (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Setup && sh dfc-php-ctype.sh -d1) >&3
        (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Setup && sh dfc-php-xmlrpc.sh -d1) >&3
        (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Setup && sh dfc-php-mbstring.sh -d1) >&3
        (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Setup && sh dfc-php-gd.sh -d1) >&3
        (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Setup && sh dfc-php-simplexml.sh -d1) >&3
        (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Setup && sh dfc-php-dom.sh -d1) >&3
        (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Setup && sh dfc-php-xmlreader.sh -d1) >&3
        (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Setup && sh dfc-php-intl.sh -d1) >&3
        (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Setup && sh dfc-php-fileinfo.sh -d1) >&3
        (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Setup && sh dfc-php-tokenizer.sh -d1) >&3
        (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Setup && sh dfc-php-xmlrpc.sh -d1) >&3
        (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Setup && sh dfc-php-soap.sh -d1) >&3
        (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Setup && sh dfc-php-sodium.sh -d1) >&3
        (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Setup && sh dfc-php-session.sh -d1) >&3
        (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Setup && sh dfc-php-openssl.sh -d1) >&3
        (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Setup && sh dfc-php-exif.sh -d1) >&3

        message_info "В контейнере 'dfc-host-nginx' вносим изменения в Nginx" 1
        (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-nginx/Services/Stop && sh dfc-nginx.sh -d1) >&3
        docker cp $dfc_project_main_folder/Scripts/Containers/dfc-host-nginx/Project/moodle/nginx.conf $dfc_global__project_name--dfc-host-nginx:/tmp >&1
        docker-compose -p $dfc_global__project_name exec -u root dfc-host-nginx ash -c "rm -f /etc/nginx/nginx.conf" >&1
        docker-compose -p $dfc_global__project_name exec -u root dfc-host-nginx ash -c "mv /tmp/nginx.conf /etc/nginx/nginx.conf" >&1
        docker-compose -p $dfc_global__project_name exec -u root dfc-host-nginx ash -c "chmod 0744 /etc/nginx/nginx.conf" >&1
        docker-compose -p $dfc_global__project_name exec -u root dfc-host-nginx ash -c "chown root:root /etc/nginx/nginx.conf" >&1
        (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-nginx/Services/Start && sh dfc-nginx.sh -d1) >&3

        message_info "В контейнере 'dfc-host-php' очищаем целевую папку" 1
        docker-compose -p $dfc_global__project_name exec -u dfc-user dfc-host-php ash -c "rm -rf /dfc-project/files/*" >&1
        docker-compose -p $dfc_global__project_name exec -u dfc-user dfc-host-php ash -c "rm -rf /dfc-project/files/.*" >&1
        docker-compose -p $dfc_global__project_name exec -u dfc-user dfc-host-php ash -c "mkdir -p /dfc-project/files/moodle" >&1
        docker-compose -p $dfc_global__project_name exec -u dfc-user dfc-host-php ash -c "mkdir -p /dfc-project/files/moodledata" >&1

        message_info "В контейнере 'dfc-host-php' скачиваем репозиторий" 1
        message_space 1
        message_input "Вставьте ссылку на проект из git (только https)\n"
        message_input "=> "
        read -p '' dfc_project_url
        docker-compose -p $dfc_global__project_name exec -u dfc-user dfc-host-php zsh -c "git clone ${dfc_project_url} /dfc-project/files/moodle" >&1

        message_space 1
        message_info "Путь до дампа - './WorkFolder/Containers/dfc-host-mariadb/Dumps/Exported/Unscheduled/db_base.sql'" 1
        message_space 1
        message_input "Вы поместили дамп базы данных проекта по пути выше? (y/n)\n"
        message_input "=> "
        read -p '' dfc_project_option
        message_space 1

        case $dfc_project_option in
        "y")
            (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-mariadb/DB && sh dfc-import-db.sh -d1) >&3
            ;;
        *)
            message_info "Импорт БД пропущен"
        
            . $dfc_project_main_folder/Scripts/Dependencies/dfc-message-exit.sh >&3
            ;;
        esac
        ;;
    "3")
        message_info "Ожидайте..." 1
        (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-mariadb/DB && sh dfc-import-db.sh -d1) >&3
        message_info "В контейнере 'dfc-host-mariadb' произведен импорт БД" 1
        ;;
    "4")
        . $dfc_project_main_folder/Scripts/Dependencies/dfc-message-exit.sh >&3
        ;;
    *)
        . $dfc_project_main_folder/Scripts/Dependencies/dfc-message-exit.sh >&3
        ;;
    esac
    ;;
"3")
    message_space 1
    message_input "Варианты разворачивания:\n"
    message_input "1. Начать новый 'PHPBB' проект\n"
    message_input "2. Скачать проект типа 'PHPBB' с помощью git (только https)\n"
    message_input "3. Проектом типа 'PHPBB' поделился другой человек\n"
    message_input "4. Выйти\n"
    message_input "=> "
    read -p '' dfc_project_container
    message_space 1

    case $dfc_project_container in
    "1")
        message_info "Ожидайте..." 1
        (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Setup && sh dfc-php-json.sh -d1) >&3
        (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Setup && sh dfc-php-mbstring.sh -d1) >&3
        (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Setup && sh dfc-php-dom.sh -d1) >&3
        (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Setup && sh dfc-php-tokenizer.sh -d1) >&3
        
        message_info "В контейнере 'dfc-host-nginx' вносим изменения в Nginx" 1
        (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-nginx/Services/Stop && sh dfc-nginx.sh -d1) >&3
        docker cp $dfc_project_main_folder/Scripts/Containers/dfc-host-nginx/Project/phpbb/nginx.conf $dfc_global__project_name--dfc-host-nginx:/tmp >&1
        docker-compose -p $dfc_global__project_name exec -u root dfc-host-nginx ash -c "rm -f /etc/nginx/nginx.conf" >&1
        docker-compose -p $dfc_global__project_name exec -u root dfc-host-nginx ash -c "mv /tmp/nginx.conf /etc/nginx/nginx.conf" >&1
        docker-compose -p $dfc_global__project_name exec -u root dfc-host-nginx ash -c "chmod 0744 /etc/nginx/nginx.conf" >&1
        docker-compose -p $dfc_global__project_name exec -u root dfc-host-nginx ash -c "chown root:root /etc/nginx/nginx.conf" >&1
        (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-nginx/Services/Start && sh dfc-nginx.sh -d1) >&3

        message_info "В контейнере 'dfc-host-php' очищаем целевую папку" 1
        docker-compose -p $dfc_global__project_name exec -u dfc-user dfc-host-php ash -c "rm -rf /dfc-project/files/*" >&1
        docker-compose -p $dfc_global__project_name exec -u dfc-user dfc-host-php ash -c "rm -rf /dfc-project/files/.*" >&1

        message_info "В контейнере 'dfc-host-php' скачиваем PHPBB 3.3.6" 1
        docker-compose -p $dfc_global__project_name exec -u dfc-user dfc-host-php ash -c "rm -f /tmp/phpbb.zip" >&1
        docker-compose -p $dfc_global__project_name exec -u dfc-user dfc-host-php ash -c "rm -rf /tmp/phpBB3" >&1
        docker-compose -p $dfc_global__project_name exec -u dfc-user dfc-host-php ash -c "curl -sS https://download.phpbb.com/pub/release/3.3/3.3.6/phpBB-3.3.6.zip > /tmp/phpbb.zip" >&1
        docker-compose -p $dfc_global__project_name exec -u dfc-user dfc-host-php ash -c "unzip /tmp/phpbb.zip -d /tmp" >&1
        docker-compose -p $dfc_global__project_name exec -u dfc-user dfc-host-php ash -c "cp -r /tmp/phpBB3/. /dfc-project/files" >&1
        docker-compose -p $dfc_global__project_name exec -u dfc-user dfc-host-php ash -c "rm -f /tmp/phpbb.zip" >&1
        ;;
    "2")
        message_info "Ожидайте..." 1
        (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Setup && sh dfc-php-json.sh -d1) >&3
        (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Setup && sh dfc-php-mbstring.sh -d1) >&3
        (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Setup && sh dfc-php-dom.sh -d1) >&3
        (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Setup && sh dfc-php-tokenizer.sh -d1) >&3

        message_info "В контейнере 'dfc-host-nginx' вносим изменения в Nginx" 1
        (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-nginx/Services/Stop && sh dfc-nginx.sh -d1) >&3
        docker cp $dfc_project_main_folder/Scripts/Containers/dfc-host-nginx/Project/phpbb/nginx.conf $dfc_global__project_name--dfc-host-nginx:/tmp >&1
        docker-compose -p $dfc_global__project_name exec -u root dfc-host-nginx ash -c "rm -f /etc/nginx/nginx.conf" >&1
        docker-compose -p $dfc_global__project_name exec -u root dfc-host-nginx ash -c "mv /tmp/nginx.conf /etc/nginx/nginx.conf" >&1
        docker-compose -p $dfc_global__project_name exec -u root dfc-host-nginx ash -c "chmod 0744 /etc/nginx/nginx.conf" >&1
        docker-compose -p $dfc_global__project_name exec -u root dfc-host-nginx ash -c "chown root:root /etc/nginx/nginx.conf" >&1
        (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-nginx/Services/Start && sh dfc-nginx.sh -d1) >&3

        message_info "В контейнере 'dfc-host-php' очищаем целевую папку" 1
        docker-compose -p $dfc_global__project_name exec -u dfc-user dfc-host-php ash -c "rm -rf *" >&1
        docker-compose -p $dfc_global__project_name exec -u dfc-user dfc-host-php ash -c "rm -rf .*" >&1

        message_info "В контейнере 'dfc-host-php' скачиваем репозиторий" 1
        message_space 1
        message_input "Вставьте ссылку на проект из git (только https)\n"
        message_input "=> "
        read -p '' dfc_project_url
        docker-compose -p $dfc_global__project_name exec -u dfc-user dfc-host-php zsh -c "git clone ${dfc_project_url} ." >&1

        message_space 1
        message_info "Путь до дампа - './WorkFolder/Containers/dfc-host-mariadb/Dumps/Exported/Unscheduled/db_base.sql'" 1
        message_space 1
        message_input "Вы поместили дамп базы данных проекта по пути выше? (y/n)\n"
        message_input "=> "
        read -p '' dfc_project_option
        message_space 1

        case $dfc_project_option in
        "y")
            (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-mariadb/DB && sh dfc-import-db.sh -d1) >&3
            ;;
        *)
            message_info "Импорт БД пропущен"
        
            . $dfc_project_main_folder/Scripts/Dependencies/dfc-message-exit.sh >&3
            ;;
        esac
        ;;
    "3")
        message_info "Ожидайте..." 1
        (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-mariadb/DB && sh dfc-import-db.sh -d1) >&3
        ;;
    "4")
        . $dfc_project_main_folder/Scripts/Dependencies/dfc-message-exit.sh >&3
        ;;
    *)
        . $dfc_project_main_folder/Scripts/Dependencies/dfc-message-exit.sh >&3
        ;;
    esac
    ;;
"4")
    . $dfc_project_main_folder/Scripts/Dependencies/dfc-message-exit.sh >&3
    ;;
esac

message_info "В контейнере 'dfc-host-php' целевые файлы проекта изменены" 1

# End of script
. $dfc_project_main_folder/Scripts/Dependencies/dfc-script-footer.sh
