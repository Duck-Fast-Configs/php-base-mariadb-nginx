#!/bin/bash

# Extra vars
## There should be no '/' at the end
dfc_project_main_folder="../../../.."

# Header of script
. $dfc_project_main_folder/Scripts/Dependencies/dfc-script-header.sh

# General process
message_info "$(date '+%H:%M:%S (%m/%d/%y)')" 2
message_space 2

message_input "Введите название ветки\n"
message_info "Откатить изменения в файле 'ФАЙЛ .'" 1
message_input "=> "
read -p '' branch_name

message_space_null
docker-compose -p $dfc_global__project_name exec -u dfc-user dfc-host-nginx zsh -c "git checkout ${branch_name}" >&3
message_space_null

message_info "Ветка обновлена обновлена в соответствии с той, которую вы указали" 1

# End of script
. $dfc_project_main_folder/Scripts/Dependencies/dfc-script-footer.sh
