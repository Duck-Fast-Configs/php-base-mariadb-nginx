#!/bin/bash

exec 3>&1 4>&2
trap 'exec 2>&4 1>&3' 0 1 2 3

# Header of script
if [[ $1 == "-d1" ]]; then
    GLOBAL_LEVEL_DEBUG=1
else
    GLOBAL_LEVEL_DEBUG=2
fi

message_info() {
    text=$1
    level_debug=$2
    Color_Off='\033[0m'
    BIGreen='\033[0;32m'
    
    if [[ $level_debug -le $GLOBAL_LEVEL_DEBUG ]]; then
        printf "${BIGreen}| ⓘ  ${text}${Color_Off}\n" >&3
    elif [[ $level_debug > $GLOBAL_LEVEL_DEBUG ]]; then
        echo "| ${text}\n" &> /dev/null
    fi
}

message_input() {
    text=$1
    Color_Off='\033[0m'
    BIGreen='\033[0;32m'
    printf "${BIGreen}| ${text}${Color_Off}" >&3
}

message_error() {
    text=$1
    Color_Off='\033[0m'
    BIGreen='\033[0;32m'
    printf "${BIGreen}| ⓘ  ${text}${Color_Off}\n"
}

message_space() {
    level_debug=$1
    Color_Off='\033[0m'
    BIGreen='\033[0;32m'

    if [[ $level_debug -le $GLOBAL_LEVEL_DEBUG ]]; then
        printf "${BIGreen}|${Color_Off}\n" >&3
    elif [[ $level_debug > $GLOBAL_LEVEL_DEBUG ]]; then
        echo "| ${text}\n" &> /dev/null
    fi
}

(docker -v &> /dev/null) || {
message_info "Пакет docker не установлен" 1;
message_info "Без него работа dfc-проекта невоможна" 1;
message_info "Процесс остановлен" 1;
exit 1; }

(docker-compose -v &> /dev/null) || {
message_info "Пакет docker-compose не установлен" 1;
message_info "Без него работа dfc-проекта невоможна" 1;
message_info "Процесс остановлен" 1;
exit 1; }

(zip -v &> /dev/null) || {
message_info "Пакет zip не установлен" 1;
message_info "Без него работа dfc-проекта невоможна" 1;
message_info "Процесс остановлен" 1;
exit 1; }

(unzip -v &> /dev/null) || {
message_info "Пакет unzip не установлен" 1;
message_info "Без него работа dfc-проекта невоможна" 1;
message_info "Процесс остановлен" 1;
exit 1; }

(docker ps &> /dev/null) || {
message_info "Пакет docker не запущен" 1;
message_info "Без него работа dfc-проекта невоможна" 1;
message_info "Процесс остановлен" 1;
exit 1; }

($(docker-compose -v \| cut -c 24-24) == "1") 2> /dev/null || {
message_info "Требуется docker-compose v1" 1;
message_info "Без него работа dfc-проекта невоможна" 1;
message_info "Процесс остановлен" 1;
exit 1; }

# General process
message_info "$(date '+%H:%M:%S (%d/%m/%Y)')" 2
message_space 2
message_input "Вы уверены что хотите разархивировать архив со всем dfc-проектом? (y/n)\n"
message_input "=> "
read -p '' input
message_space 1
case $input in
"n")
    message_info "Процесс остановлен" 1
    
    if [[ $1 != "-d1" ]]; then
        message_space 1
        message_input "Нажмите на ENTER чтобы выйти\n"
        message_input "=> "
        read -p '' >&3
    fi

    exit
    ;;
esac

message_space 1
message_input "Путь $(pwd)/* является тем, каким вы хотите его видеть по итогу? (y/n)\n"
message_input "=> "
read -p '' input
message_space 1
case $input in
"n")
    message_info "Процесс остановлен, измените целевую директорию просто переместив архив и файл dfc-unpack вместе с ним" 1
    
    if [[ $1 != "-d1" ]]; then
        message_space 1
        message_input "Нажмите на ENTER чтобы выйти\n"
        message_input "=> "
        read -p '' >&3
    fi

    exit
    ;;
esac

message_info "Запущено разархивирование всего dfc-проекта с помощью архива" 1

message_space 1
message_info "1. Корректно выключаем контейнеры всех проектов" 1
message_info "Ожидайте..." 1
docker stop $(docker ps -a -q) &> /dev/null

message_space 1
message_info "2. Разархивирование dfc-проекта" 1
message_info "Ожидайте..." 1

message_space 1
message_input "Введите пароль для архива\n"
message_input "=> "
read -p '' input
message_space 1

unzip -P $input dfc-share.zip &> /dev/null
rm -f dfc-share.zip dfc-unpack.sh &> /dev/null

message_info "Архив был разархивирован" 1

message_space 1
message_input "Вы хотите установить проект прямо сейчас? (y/n)\n"
message_input "=> "
read -p '' input
message_space 1
case $input in
"y")
    sh dfc-create.sh >&3

    exit
    ;;
esac

# End of script
if [[ $1 != "-d1" ]]; then
    message_space 1
    message_input "Нажмите на ENTER чтобы выйти\n"
    message_input "=> "
    read -p '' >&3
fi

exit
