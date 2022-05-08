#!/bin/bash

# Extra vars
## There should be no '/' at the end
dfc_project_main_folder="../../../.."

# Header of script
. $dfc_project_main_folder/Scripts/Dependencies/dfc-script-header.sh

# General process
message_info "$(date '+%H:%M:%S (%m/%d/%y)')" 2
message_space 2

message_info "Перейдите по адресу https://localhost, чтобы увидеть запущенный проект (если это сайт)" 1
message_info "Чтобы выйти -- 'Ctrl + C'" 1
message_space_null
docker-compose -p $dfc_global__project_name exec -u dfc-user dfc-host-php zsh -c "php8 main.php" >&3
message_space_null
message_space_null

message_info "В контейнере 'dfc-host-php' был запущен 'стандартный' проект" 1

# End of script
. $dfc_project_main_folder/Scripts/Dependencies/dfc-script-footer.sh
