#!/bin/bash

# Extra vars
## There should be no '/' at the end
dfc_project_main_folder="../../../.."

# Header of script
. $dfc_project_main_folder/Scripts/Dependencies/dfc-script-header.sh

# General process
message_info "$(date '+%H:%M:%S (%d/%m/%Y)')" 2

message_space 1
message_input "Вы уверены что хотите создать архив со всем dfc-проектом? (y/n)\n"
message_input "=> "
read -p '' input
message_space 1
case $input in
"y")
    continue
    ;;
*)
    message_info "Процесс остановлен" 1
    
    . $dfc_project_main_folder/Scripts/Dependencies/dfc-message-exit.sh >&3
    ;;
esac

message_info "Начато создание архива всего dfc-проекта" 1

message_space 1
message_info "1. Корректно выключаем контейнеры проекта" 1
message_info "Ожидайте..." 1
docker stop $(docker ps -a -q)

message_space 1
message_info "2. Клонирование dfc-проекта" 1
message_info "Ожидайте..." 1
docker-compose -p $dfc_global__project_name exec -u postgres dfc-host-mariadb ash -c "rm -f /dfc-project/dumps/exported/unscheduled/db_base/db_base.sql" >&1
docker-compose -p $dfc_global__project_name exec -u postgres dfc-host-mariadb ash -c "mysqldump -u root -p'$dfc_global__project_mariadb_pass' db_base > /dfc-project/dumps/exported/unscheduled/db_base/db_base.sql" >&1

rm -f dfc-share.zip
rm -rf /tmp/dfc
mkdir -p /tmp/dfc
mkdir -p $dfc_project_main_folder/Share
rm -rf $dfc_project_main_folder/Share/*
cp -r -p $dfc_project_main_folder/* /tmp/dfc/

message_space 1
message_info "3. Архивация dfc-проекта" 1

message_space 1
message_input "Введите пароль для архива\n"
message_input "=> "
read -p '' input
message_space 1

message_info "Запомните пароль, его нужно передать другому пользователю" 1
message_space 1

(cd /tmp/dfc && zip -e -9 --password $input /tmp/dfc-share.zip -r ./*) >&1
mv /tmp/dfc-share.zip $dfc_project_main_folder/Share
cp $dfc_project_main_folder/Scripts/Containers/Common/Share/dfc-unpack.sh $dfc_project_main_folder/Share
rm -rf /tmp/dfc
rm -rf /tmp/dfc-share.zip

message_info "Архив был создан" 1


message_space 1

message_info "Что нужно предпринять вам и пользователю с которым вы хотите поделиться dfc-проектом информация ниже {↓}" 1

message_space 1

message_info "Ваши действия:" 1
message_info "1. Отправить другому пользователю архив 'dfc-share.zip' и файл 'dfc-unpack.sh'" 1
message_info "2. Заставить другого пользователя действовать четко по инструкции" 1

message_space 1

message_info "Его действия:" 1
message_info "1. Переместить архив 'dfc-share.zip' и файл 'dfc-unpack.sh' в любую директорию" 1
message_info "2. Выполнить команду в этой директории 'sh dfc-unpack.sh' и отвечать на вопросы" 1

# End of script
. $dfc_project_main_folder/Scripts/Dependencies/dfc-script-footer.sh
