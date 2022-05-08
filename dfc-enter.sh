#!/bin/bash

# Extra vars
## There should be no '/' at the end
dfc_project_main_folder="."

# Header of script
. $dfc_project_main_folder/Scripts/Dependencies/dfc-script-header.sh

# General process
message_info "$(date '+%H:%M:%S (%d/%m/%Y)')" 2
message_space 2

message_info "Точки входа в контейнеры" 1
message_space 1
message_input "Список контейнеров\n"
message_input "1. dfc-host-php\n"
message_input "2. dfc-host-mariadb\n"
message_input "3. dfc-host-nginx\n"
message_input "4. Выйти\n"
message_input "=> "
read -p '' dfc_project_container

case $dfc_project_container in
"1")
    message_space 1
    message_info "Чтобы выйти из контейнера напишите 'exit'" 1
    message_info "Контейнер открывается" 1
    message_space 1
    message_info "Популярные команды: sudo, apk, php, nano, git, htop, dust, curl, viu, neofetch" 1
    docker-compose -p $dfc_global__project_name exec -u dfc-user dfc-host-php zsh -c "echo '|'" >&3
    docker-compose -p $dfc_global__project_name exec -u dfc-user dfc-host-php zsh >&3
    ;;
"2")
    message_space 1
    message_info "Чтобы выйти из контейнера напишите 'exit'" 1
    message_info "Контейнер открывается" 1
    message_space 1
    message_info "Популярные команды: sudo, apk, mysql, nano, htop, dust, curl, viu, neofetch" 1
    docker-compose -p $dfc_global__project_name exec -u dfc-user dfc-host-mariadb zsh -c "echo '|'" >&3
    docker-compose -p $dfc_global__project_name exec -u dfc-user dfc-host-mariadb zsh >&3
    ;;
"3")
    message_space 1
    message_info "Чтобы выйти из контейнера напишите 'exit'" 1
    message_info "Контейнер открывается" 1
    message_space 1
    message_info "Популярные команды: sudo, apk, nano, htop, dust, curl, viu, neofetch" 1
    docker-compose -p $dfc_global__project_name exec -u dfc-user dfc-host-nginx zsh -c "echo '|'" >&3
    docker-compose -p $dfc_global__project_name exec -u dfc-user dfc-host-nginx zsh >&3
    ;;
"4")
    . $dfc_project_main_folder/Scripts/Dependencies/dfc-message-exit.sh >&3
    ;;
*)
    . $dfc_project_main_folder/Scripts/Dependencies/dfc-message-exit.sh >&3
    ;;
esac

# End of script
. $dfc_project_main_folder/Scripts/Dependencies/dfc-script-footer.sh
