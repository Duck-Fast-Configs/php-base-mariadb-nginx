#!/bin/bash

# Extra vars
## There should be no '/' at the end
dfc_project_main_folder="../../../.."

# Header of script
. $dfc_project_main_folder/Scripts/Dependencies/dfc-script-header.sh

# General process
message_info "$(date '+%H:%M:%S (%m/%d/%y)')" 2
message_space 2
message_info "Информация о базах данных антивируса:" 1
message_info "В случае потребности, вы можете установить отсутствующие базы данных вирусов, но можно этого и не делать" 1
message_info "Базы данных весят много, что может не подойти для некоторых устройств" 1
message_info "Ядро Linux, дистрибутив Alpine и проект DFC совместно минимизируют огромное количество возможных угроз" 1
message_info "Инструкция по установке - https://mega.nz/file/rVpH3LLJ#bk8Xq24IP3HTY7pjNk0c9K6Q7V8xZBiNf6zmcJZvYvc" 1
message_info "Скачайте базы данных вирусов по этой ссылке - https://mega.nz/folder/OFJXwYxD#O_uBTrdtFQ41ZmhojqQImQ" 1

# End of script
. $dfc_project_main_folder/Scripts/Dependencies/dfc-script-footer.sh
