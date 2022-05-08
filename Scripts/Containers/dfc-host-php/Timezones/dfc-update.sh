#!/bin/bash

# Extra vars
## There should be no '/' at the end
dfc_project_main_folder="../../../.."

# Header of script
. $dfc_project_main_folder/Scripts/Dependencies/dfc-script-header.sh

# General process
USER_ZONEINFO=""

get_utc() {
    all_utc=("Europe" "America" "Asia" "Australia" "Canada" "Brazil" "Chile" "Cuba" "Hongkong" "Iceland" "Indian" "Iran" "Israel" "Japan" "Jamaica")
    now_utc_global_aim=0

    i=0
    message_info "Выберите то что подходит вам:" 1
    for now_utc_global_aim in ${all_utc[*]}
    do
        i=$(expr $i + 1)
        message_input "${i}. ${now_utc_global_aim}\n" 
    done

    message_space 1
    message_input "=> "
    read -p '' now_utc_global_aim
    message_space 1

    now_utc_local_aim=0
    i=0
    message_info "Выберите то что подходит вам:" 1
    for entry in "/usr/share/zoneinfo/${all_utc[now_utc_global_aim-1]}"/*
    do
        i=$(expr $i + 1)
        message_input "${i}. ${entry:$(expr 20 + ${#all_utc[now_utc_global_aim-1]} + 1)}\n"
    done

    message_space 1
    message_input "=> "
    read -p '' now_utc_local_aim
    message_space 1

    i=0
    for entry in "/usr/share/zoneinfo/${all_utc[now_utc_global_aim-1]}"/*
    do
        i=$(expr $i + 1)

        if [ "${now_utc_local_aim}" == "${i}" ];then
            USER_ZONEINFO="${entry}"
        fi
    done
}

message_info "$(date '+%H:%M:%S (%d/%m/%Y)')" 2
docker-compose -p $dfc_global__project_name exec --privileged -u root dfc-host-php ash -c "apk add tzdata"

datetime_php=$(docker-compose -p $dfc_global__project_name exec --privileged -u root dfc-host-php ash -c "date '+%H:%M:%S (%d/%m/%Y)'")
datetime_local=$(date '+%H:%M:%S (%d/%m/%Y)')

message_space 1
message_info "На пару секунд следующие значения могут отличаться:" 1
message_info "Дата и время локальное - ${datetime_local}" 1
message_info "Дата и время из контейнера 'dfc-host-php' - ${datetime_php}" 1

message_space 1
message_input "Вы хотите исправить дату и время в контейнере 'dfc-host-php'? (y/n)\n"
message_input "=> "
read -p '' input
message_space 1

case $input in
"y")
    get_utc
    docker-compose -p $dfc_global__project_name exec --privileged -u root dfc-host-php ash -c "cp ${USER_ZONEINFO} /etc/localtime" >&1

    datetime_php=$(docker-compose -p $dfc_global__project_name exec --privileged -u root dfc-host-php ash -c "date '+%H:%M:%S (%d/%m/%Y)'")
    datetime_local=$(date '+%H:%M:%S (%d/%m/%Y)')

    message_info "На пару секунд следующие значения могут отличаться:" 1
    message_info "Дата и время локальное - ${datetime_local}" 1
    message_info "Дата и время из контейнера 'dfc-host-php' - ${datetime_php}" 1
    message_space 1
    message_info "Время обновлено в соответствии с регионом" 1
    ;;
esac

# End of script
. $dfc_project_main_folder/Scripts/Dependencies/dfc-script-footer.sh
