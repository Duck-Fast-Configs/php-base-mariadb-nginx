#!/bin/bash

(docker -v >&2) || {
message_info "Пакет docker не установлен" 1;
message_info "Без него работа dfc-проекта невоможна" 1;
message_info "Процесс остановлен" 1;
exit 1; }

(docker-compose -v >&2) || {
message_info "Пакет docker-compose не установлен" 1;
message_info "Без него работа dfc-проекта невоможна" 1;
message_info "Процесс остановлен" 1;
exit 1; }

(zip -v >&2) || {
message_info "Пакет zip не установлен" 1;
message_info "Без него работа dfc-проекта невоможна" 1;
message_info "Процесс остановлен" 1;
exit 1; }

(unzip -v >&2) || {
message_info "Пакет unzip не установлен" 1;
message_info "Без него работа dfc-проекта невоможна" 1;
message_info "Процесс остановлен" 1;
exit 1; }

(docker ps >&2) || {
message_info "Пакет docker не запущен" 1;
message_info "Без него работа dfc-проекта невоможна" 1;
message_info "Процесс остановлен" 1;
exit 1; }

($(docker-compose -v \| cut -c 24-24) == "1") 2> /dev/null || {
message_info "Требуется docker-compose v1" 1;
message_info "Без него работа dfc-проекта невоможна" 1;
message_info "Процесс остановлен" 1;
exit 1; }

if
[ $dfc_global__project_containers_counts_created != $dfc_global__project_containers_counts_all ] &&
([ $dfc_project_main_folder != "." ] || ([ $dfc_project_main_folder == "." ] && [ $dfc_global__project_script_name != "dfc-create.sh" ]))
then
    message_info "dfc-проект не развернут" 1;
    message_info "Используйте файл 'dfc-create.sh'" 1;
    message_info "Процесс остановлен" 1;
    exit 1;
fi

if
[ $dfc_global__project_containers_counts_created == $dfc_global__project_containers_counts_all ] &&
([ $dfc_project_main_folder == "." ] && [ $dfc_global__project_script_name == "dfc-create.sh" ])
then
    message_info "dfc-проект уже развернут" 1;
    message_info "Используйте файл 'dfc-remove.sh'" 1;
    message_info "Процесс остановлен" 1;
    exit 1;
fi

if
[ $dfc_global__project_containers_counts_created == $dfc_global__project_containers_counts_all ] &&
[ $dfc_global__project_containers_counts_runned != $dfc_global__project_containers_counts_all ] &&
([ $dfc_project_main_folder != "." ] ||
([ $dfc_project_main_folder == "." ] && [ $dfc_global__project_script_name != "dfc-start.sh" ] && [ $dfc_global__project_script_name != "dfc-create.sh" ]))
then
    message_info "dfc-проект не запущен" 1;
    message_info "Используйте файл 'dfc-start.sh'" 1;
    message_info "Процесс остановлен" 1;
    exit 1;
fi

if
[ $dfc_global__project_containers_counts_created == $dfc_global__project_containers_counts_all ] &&
[ $dfc_global__project_containers_counts_runned == $dfc_global__project_containers_counts_all ] &&
([ $dfc_project_main_folder == "." ] && [ $dfc_global__project_script_name == "dfc-start.sh" ])
then
    message_info "dfc-проект уже запущен" 1;
    message_info "Используйте файл 'dfc-stop.sh'" 1;
    message_info "Процесс остановлен" 1;
    exit 1;
fi
