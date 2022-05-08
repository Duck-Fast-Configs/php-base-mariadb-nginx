#!/bin/bash

# Extra vars
## There should be no '/' at the end
dfc_project_main_folder="."

# Header of script
. $dfc_project_main_folder/Scripts/Dependencies/dfc-script-header.sh

# General process
message_info "$(date '+%H:%M:%S (%d/%m/%Y)')" 2
message_space 2

message_info "Менеджер передачи файлов" 2
message_space 1
message_input "Отправка dfc-проекта:\n"
message_input "1. Подготовить необходимые файлы\n"
message_input "2. Прочитать инструкцию по отправке\n"
message_input "3. Выйти\n"
message_input "=> "
read -p '' dfc_project_container

case $dfc_project_container in
"1")
    message_space 1
    message_info "Целевые архив 'dfc-share.zip' и файл 'dfc-unpack.sh' располагаются в директории ./Share" 1

    message_space 1
    message_input "Вы прочитали информацию выше {↑} (y/n)?\n"
    message_input "=> "
    read -p '' input
    case $input in
    "y")
        continue
        ;;
    *)
        message_space 1
        message_info "Процесс остановлен"
        . $dfc_project_main_folder/Scripts/Dependencies/dfc-message-exit.sh >&3
        ;;
    esac

    (cd $dfc_project_main_folder/Scripts/Containers/Common/Share && sh dfc-pack.sh -d1) >&3
    ;;
"2")
    message_space 1
    message_info "Что нужно предпринять вам и пользователю с которым вы хотите поделиться dfc-проектом ↓" 1
    message_info "Целевые архив 'dfc-share.zip' и файл 'dfc-unpack.sh' располагаются в директории ./Share" 1

    message_space 1

    message_info "Ваши действия:" 1
    message_info "1. Отправить другому пользователю архив 'dfc-share.zip' и файл 'dfc-unpack.sh'" 1
    message_info "2. Заставить другого пользователя действовать четко по его инструкции" 1

    message_space 1

    message_info "Его действия:" 1
    message_info "1. Переместить архив 'dfc-share.zip' и файл 'dfc-unpack.sh' в любую директорию" 1
    message_info "2. Выполнить команду в этой директории 'sh dfc-unpack.sh' и отвечать на вопросы" 1
    ;;
"3")
    . $dfc_project_main_folder/Scripts/Dependencies/dfc-message-exit.sh >&3
    ;;
*)
    . $dfc_project_main_folder/Scripts/Dependencies/dfc-message-exit.sh >&3
    ;;
esac

# End of script
. $dfc_project_main_folder/Scripts/Dependencies/dfc-script-footer.sh
