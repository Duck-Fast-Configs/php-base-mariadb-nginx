#!/bin/bash

# Extra vars
## There should be no '/' at the end
dfc_project_main_folder="."

# Header of script
. $dfc_project_main_folder/Scripts/Dependencies/dfc-script-header.sh

# General process
message_info "$(date '+%H:%M:%S (%d/%m/%Y)')" 2
message_space 2

message_info "Менеджер пакетов" 2
message_space 1
message_input "Список задач\n"
message_input "1. Очистить мусор во всех контейнерах\n"
message_input "2. Установить пакет\n"
message_input "3. Запустить пакет\n"
message_input "4. Выйти\n"
message_input "=> "
read -p '' dfc_project_container

case $dfc_project_container in
"1")
    message_space 1

    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Setup && sh dfc-clean.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-mariadb/Setup && sh dfc-clean.sh -d1) >&3
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-nginx/Setup && sh dfc-clean.sh -d1) >&3
    ;;
"2")
    message_space 1
    message_input "Список контейнеров:\n"
    message_input "1. dfc-host-php\n"
    message_input "2. dfc-host-mariadb\n"
    message_input "3. dfc-host-nginx\n"
    message_input "4. Выйти\n"
    message_input "=> "
    read -p '' dfc_project_container_choice

    case $dfc_project_container_choice in
    "1")
        message_space 1
        message_input "Список пакетов:\n"
        message_input "1. Очистить мусор\n"
        message_input "2. Очистить все источники пакетов\n"
        message_input "3. Список источников пакетов\n"
        message_input "4. Добавить источник пакетов 'main'\n"
        message_input "5. Добавить источник пакетов 'community'\n"
        message_input "6. Добавить источник пакетов 'testing'\n"
        message_input "7. Обновить список пакетов\n"
        message_input "8. Список установленных пакетов\n"
        message_input "9. Обновить установленные пакеты\n"
        message_input "10. Поиск выбранного пакета\n"
        message_input "11. Установка выбранного пакета\n"
        message_input "12. Выйти\n"
        message_input "=> "
        read -p '' dfc_project_container

        case $dfc_project_container in
        "1")
            message_space 1

            (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Setup && sh dfc-clean.sh -d1) >&3
            ;;
        "2")
            message_space 1

            (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Setup/Repositories && sh dfc-clean.sh -d1) >&3
            ;;
        "3")
            message_space 1

            (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Setup/Repositories && sh dfc-info.sh -d1) >&3
            ;;
        "4")
            message_space 1

            (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Setup/Repositories/Add && sh dfc-main.sh -d1) >&3
            ;;
        "5")
            message_space 1

            (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Setup/Repositories/Add && sh dfc-community.sh -d1) >&3
            ;;
        "6")
            message_space 1

            (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Setup/Repositories/Add && sh dfc-testing.sh -d1) >&3
            ;;
        "7")
            message_space 1

            (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Setup/Repositories && sh dfc-update.sh -d1) >&3
            ;;
        "8")
            message_space 1

            (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Setup && sh dfc-info.sh -d1) >&3
            ;;
        "9")
            message_space 1

            (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Setup && sh dfc-upgrade.sh -d1) >&3
            ;;
        "10")
            message_space 1

            (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Setup/Repositories && sh dfc-search.sh -d1) >&3
            ;;
        "11")
            message_space 1
            
            (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Setup && sh dfc-other.sh -d1) >&3
            ;;
        "12")
            . $dfc_project_main_folder/Scripts/Dependencies/dfc-message-exit.sh >&3
            ;;
        *)
            . $dfc_project_main_folder/Scripts/Dependencies/dfc-message-exit.sh >&3
            ;;
        esac
        ;;
    "2")
        message_space 1
        message_input "Список пакетов:\n"
        message_input "1. Очистить мусор\n"
        message_input "2. Очистить все источники пакетов\n"
        message_input "3. Список источников пакетов\n"
        message_input "4. Добавить источник пакетов 'main'\n"
        message_input "5. Добавить источник пакетов 'community'\n"
        message_input "6. Добавить источник пакетов 'testing'\n"
        message_input "7. Обновить список пакетов\n"
        message_input "8. Список установленных пакетов\n"
        message_input "9. Обновить установленные пакеты\n"
        message_input "10. Поиск выбранного пакета\n"
        message_input "11. Установка выбранного пакета\n"
        message_input "12. Выйти\n"
        message_input "=> "
        read -p '' dfc_project_container

        case $dfc_project_container in
        "1")
            message_space 1

            (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-mariadb/Setup && sh dfc-clean.sh -d1) >&3
            ;;
        "2")
            message_space 1

            (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-mariadb/Setup/Repositories && sh dfc-clean.sh -d1) >&3
            ;;
        "3")
            message_space 1

            (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-mariadb/Setup/Repositories && sh dfc-info.sh -d1) >&3
            ;;
        "4")
            message_space 1

            (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-mariadb/Setup/Repositories/Add && sh dfc-main.sh -d1) >&3
            ;;
        "5")
            message_space 1

            (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-mariadb/Setup/Repositories/Add && sh dfc-community.sh -d1) >&3
            ;;
        "6")
            message_space 1

            (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-mariadb/Setup/Repositories/Add && sh dfc-testing.sh -d1) >&3
            ;;
        "7")
            message_space 1

            (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-mariadb/Setup/Repositories && sh dfc-update.sh -d1) >&3
            ;;
        "8")
            message_space 1

            (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-mariadb/Setup && sh dfc-info.sh -d1) >&3
            ;;
        "9")
            message_space 1

            (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-mariadb/Setup && sh dfc-upgrade.sh -d1) >&3
            ;;
        "10")
            message_space 1

            (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-mariadb/Setup/Repositories && sh dfc-search.sh -d1) >&3
            ;;
        "11")
            message_space 1
            
            (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-mariadb/Setup && sh dfc-other.sh -d1) >&3
            ;;
        "12")
            . $dfc_project_main_folder/Scripts/Dependencies/dfc-message-exit.sh >&3
            ;;
        *)
            . $dfc_project_main_folder/Scripts/Dependencies/dfc-message-exit.sh >&3
            ;;
        esac
        ;;
    "3")
        message_space 1
        message_input "Список пакетов:\n"
        message_input "1. Очистить мусор\n"
        message_input "2. Очистить все источники пакетов\n"
        message_input "3. Список источников пакетов\n"
        message_input "4. Добавить источник пакетов 'main'\n"
        message_input "5. Добавить источник пакетов 'community'\n"
        message_input "6. Добавить источник пакетов 'testing'\n"
        message_input "7. Обновить список пакетов\n"
        message_input "8. Список установленных пакетов\n"
        message_input "9. Обновить установленные пакеты\n"
        message_input "10. Поиск выбранного пакета\n"
        message_input "11. Установка выбранного пакета\n"
        message_input "12. Выйти\n"
        message_input "=> "
        read -p '' dfc_project_container

        case $dfc_project_container in
        "1")
            message_space 1

            (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-nginx/Setup && sh dfc-clean.sh -d1) >&3
            ;;
        "2")
            message_space 1

            (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-nginx/Setup/Repositories && sh dfc-clean.sh -d1) >&3
            ;;
        "3")
            message_space 1

            (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-nginx/Setup/Repositories && sh dfc-info.sh -d1) >&3
            ;;
        "4")
            message_space 1

            (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-nginx/Setup/Repositories/Add && sh dfc-main.sh -d1) >&3
            ;;
        "5")
            message_space 1

            (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-nginx/Setup/Repositories/Add && sh dfc-community.sh -d1) >&3
            ;;
        "6")
            message_space 1

            (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-nginx/Setup/Repositories/Add && sh dfc-testing.sh -d1) >&3
            ;;
        "7")
            message_space 1

            (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-nginx/Setup/Repositories && sh dfc-update.sh -d1) >&3
            ;;
        "8")
            message_space 1

            (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-nginx/Setup && sh dfc-info.sh -d1) >&3
            ;;
        "9")
            message_space 1

            (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-nginx/Setup && sh dfc-upgrade.sh -d1) >&3
            ;;
        "10")
            message_space 1

            (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-nginx/Setup/Repositories && sh dfc-search.sh -d1) >&3
            ;;
        "11")
            message_space 1
            
            (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-nginx/Setup && sh dfc-other.sh -d1) >&3
            ;;
        "12")
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
    *)
        . $dfc_project_main_folder/Scripts/Dependencies/dfc-message-exit.sh >&3
        ;;
    esac
    ;;
"3")
    message_space 1
    message_input "Список контейнеров:\n"
    message_input "1. dfc-host-php\n"
    message_input "2. dfc-host-mariadb\n"
    message_input "3. dfc-host-nginx\n"
    message_input "4. Выйти\n"
    message_input "=> "
    read -p '' dfc_project_container_choice

    case $dfc_project_container_choice in
    "1")
        message_space 1
        message_input "Список пакетов:\n"
        message_input "1. Список установленных пакетов\n"
        message_input "2. htop\n"
        message_input "3. tmux\n"
        message_input "4. dust\n"
        message_input "5. nload\n"
        message_input "6. Другой\n"
        message_input "7. Выйти\n"
        message_input "=> "
        read -p '' dfc_project_container_package_name

        case $dfc_project_container_package_name in
        "1")
            message_space 1

            cd Scripts/Containers/dfc-host-php/Setup && sh dfc-info.sh -d1 >&3 && cd -
            ;;
        "2")
            message_space 1
            
            cd Scripts/Containers/dfc-host-php/Run && sh dfc-htop.sh -d1 >&3 && cd -
            ;;
        "3")
            message_space 1
            
            cd Scripts/Containers/dfc-host-php/Run && sh dfc-tmux.sh -d1 >&3 && cd -
            ;;
        "4")
            message_space 1
            
            cd Scripts/Containers/dfc-host-php/Run && sh dfc-dust.sh -d1 >&3 && cd -
            ;;
        "5")
            message_space 1
            
            cd Scripts/Containers/dfc-host-php/Run && sh dfc-nload.sh -d1 >&3 && cd -
            ;;
        "6")
            message_space 1
            
            cd Scripts/Containers/dfc-host-php/Run && sh dfc-other.sh -d1 >&3 && cd -
            ;;
        "7")
            . $dfc_project_main_folder/Scripts/Dependencies/dfc-message-exit.sh >&3
            ;;
        *)
            . $dfc_project_main_folder/Scripts/Dependencies/dfc-message-exit.sh >&3
            ;;
        esac
        ;;
    "2")
        message_space 1
        message_input "Список пакетов:\n"
        message_input "1. Список установленных пакетов\n"
        message_input "2. htop\n"
        message_input "3. tmux\n"
        message_input "4. dust\n"
        message_input "5. nload\n"
        message_input "6. Другой\n"
        message_input "7. Выйти\n"
        message_input "=> "
        read -p '' dfc_project_container_package_name

        case $dfc_project_container_package_name in
        "1")
            message_space 1

            cd Scripts/Containers/dfc-host-mariadb/Setup && sh dfc-info.sh -d1 >&3 && cd -
            ;;
        "2")
            message_space 1
            
            cd Scripts/Containers/dfc-host-mariadb/Run && sh dfc-htop.sh -d1 >&3 && cd -
            ;;
        "3")
            message_space 1
            
            cd Scripts/Containers/dfc-host-mariadb/Run && sh dfc-tmux.sh -d1 >&3 && cd -
            ;;
        "4")
            message_space 1
            
            cd Scripts/Containers/dfc-host-mariadb/Run && sh dfc-dust.sh -d1 >&3 && cd -
            ;;
        "5")
            message_space 1
            
            cd Scripts/Containers/dfc-host-mariadb/Run && sh dfc-nload.sh -d1 >&3 && cd -
            ;;
        "6")
            message_space 1
            
            cd Scripts/Containers/dfc-host-mariadb/Run && sh dfc-other.sh -d1 >&3 && cd -
            ;;
        "7")
            . $dfc_project_main_folder/Scripts/Dependencies/dfc-message-exit.sh >&3
            ;;
        *)
            . $dfc_project_main_folder/Scripts/Dependencies/dfc-message-exit.sh >&3
            ;;
        esac
        ;;
    "3")
        message_space 1
        message_input "Список пакетов:\n"
        message_input "1. Список установленных пакетов\n"
        message_input "2. htop\n"
        message_input "3. tmux\n"
        message_input "4. dust\n"
        message_input "5. nload\n"
        message_input "6. Другой\n"
        message_input "7. Выйти\n"
        message_input "=> "
        read -p '' dfc_project_container_package_name

        case $dfc_project_container_package_name in
        "1")
            message_space 1

            cd Scripts/Containers/dfc-host-php/Setup && sh dfc-info.sh -d1 >&3 && cd -
            ;;
        "2")
            message_space 1
            
            cd Scripts/Containers/dfc-host-php/Run && sh dfc-htop.sh -d1 >&3 && cd -
            ;;
        "3")
            message_space 1
            
            cd Scripts/Containers/dfc-host-php/Run && sh dfc-tmux.sh -d1 >&3 && cd -
            ;;
        "4")
            message_space 1
            
            cd Scripts/Containers/dfc-host-php/Run && sh dfc-dust.sh -d1 >&3 && cd -
            ;;
        "5")
            message_space 1
            
            cd Scripts/Containers/dfc-host-php/Run && sh dfc-nload.sh -d1 >&3 && cd -
            ;;
        "6")
            message_space 1
            
            cd Scripts/Containers/dfc-host-php/Run && sh dfc-other.sh -d1 >&3 && cd -
            ;;
        "7")
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
    *)
        . $dfc_project_main_folder/Scripts/Dependencies/dfc-message-exit.sh >&3
        ;;
    esac
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
