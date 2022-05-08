#!/bin/bash

# DFC get config
. $dfc_project_main_folder/Scripts/Dependencies/dfc-config-get.sh

# DFC output threads
. $dfc_project_main_folder/Scripts/Dependencies/dfc-log.sh

# DFC messages types set
. $dfc_project_main_folder/Scripts/Dependencies/dfc-message-types-set.sh $1 >&3

# DFC check run
. $dfc_project_main_folder/Scripts/Dependencies/dfc-check.sh >&3
