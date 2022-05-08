#!/bin/bash

dfc_project_log_path_file=${dfc_project_main_folder}/Logs/${dfc_global__project_script_path_non_ext:${#dfc_project_main_folder}}.log
dfc_project_log_path_folder=$(echo $dfc_project_log_path_file | sed -e 's/\(.*\)\/[^\/]*/\1/g')

mkdir -p $dfc_project_log_path_folder

exec 3>&1 4>&2
trap 'exec 2>&4 1>&3' 0 1 2 3
exec 1>$dfc_project_log_path_file 2>&1
