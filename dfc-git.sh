#!/bin/bash

# Extra vars
## There should be no '/' at the end
dfc_project_main_folder="."

# Header of script
. $dfc_project_main_folder/Scripts/Dependencies/dfc-script-header.sh

# General process
message_info "$(date '+%H:%M:%S (%d/%m/%Y)')" 2
message_space 2

message_info "Менеджер управления Git" 2
message_space 1
message_info "Активный контейнер 'dfc-host-php'" 1
message_space 1
message_input "Список команд:\n"
message_input "1. git branch\n"
message_input "2. git pull\n"
message_input "3. git add specific\n"
message_input "4. git add all\n"
message_input "5. git commit\n"
message_input "6. git status\n"
message_input "7. git push\n"
message_input "8. git checkout\n"
message_input "9. Выйти\n"
message_input "=> "
read -p '' dfc_project_git_choice

case $dfc_project_git_choice in
"1")
    message_space 1

    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Git && sh dfc-branch.sh -d1) >&3
    ;;
"2")
    message_space 1
    
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Git && sh dfc-pull.sh -d1) >&3
    ;;
"3")
    message_space 1
    
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Git && sh dfc-add-specific.sh -d1) >&3
    ;;
"4")
    message_space 1
    
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Git && sh dfc-add-all.sh -d1) >&3
    ;;
"5")
    message_space 1
    
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Git && sh dfc-commit.sh -d1) >&3
    ;;
"6")
    message_space 1
    
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Git && sh dfc-status.sh -d1) >&3
    ;;
"7")
    message_space 1
    
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Git && sh dfc-push.sh -d1) >&3
    ;;
"8")
    message_space 1
    
    (cd $dfc_project_main_folder/Scripts/Containers/dfc-host-php/Git && sh dfc-checkout.sh -d1) >&3
    ;;
"9")
    . $dfc_project_main_folder/Scripts/Dependencies/dfc-message-exit.sh >&3
    ;;
*)
    . $dfc_project_main_folder/Scripts/Dependencies/dfc-message-exit.sh >&3
    ;;
esac

# End of script
. $dfc_project_main_folder/Scripts/Dependencies/dfc-script-footer.sh
