#!/bin/bash

# Extra vars
## There should be no '/' at the end
dfc_project_main_folder="../../../../.."

# Header of script
. $dfc_project_main_folder/Scripts/Dependencies/dfc-script-header.sh

# General process
message_info "$(date '+%H:%M:%S (%d/%m/%Y)')" 2
message_space 2
message_info "Монитор работы контейнеров" 1
message_space 1
message_info "Ctrl+C -- Выйти из монитора" 1
message_space 1
message_input "Вы прочитали информацию выше? (y/n)\n"
message_input "=> "
read -p '' dfc_project_input_choice
message_space 1

case $dfc_project_input_choice in
"y")
    continue
    ;;
*)
    message_info "Процесс остановлен" 1
    . $dfc_project_main_folder/Scripts/Dependencies/dfc-message-exit.sh >&3
    ;;
esac

message_space_null
docker stats --all --format "table {{.Name}}\t{{.CPUPerc}}\t{{.MemUsage}}" >&3
message_space_null
message_space_null

# End of script
. $dfc_project_main_folder/Scripts/Dependencies/dfc-script-footer.sh
