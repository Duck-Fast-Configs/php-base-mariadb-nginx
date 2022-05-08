#!/bin/bash

# Extra vars
## There should be no '/' at the end
dfc_project_main_folder="../../../../.."

# Header of script
. $dfc_project_main_folder/Scripts/Dependencies/dfc-script-header.sh

# General process
message_info "$(date '+%H:%M:%S (%d/%m/%Y)')" 2
message_space 2
message_info "Короткая информация:" 1
message_space_null
docker system df >&3
message_space_null
docker ps -as >&3
message_space_null

# End of script
. $dfc_project_main_folder/Scripts/Dependencies/dfc-script-footer.sh
