#!/bin/bash

# Include
source $dfc_project_main_folder/dfc.ini

# Global vars
## Specific
dfc_global__project_containers_counts_all=3
## Docker
export project_name=${project_name}
export DOCKER_HOST=${project_host}
## Standart
dfc_global__project_name=${project_name}
dfc_global__project_description=${project_description}
dfc_global__project_type=${project_type}
dfc_global__project_create_time=${project_create_time}
dfc_global__project_os=${project_os}
dfc_global__project_cpu_type=${project_cpu_type}
dfc_global__project_host=${project_host}
dfc_global__project_creator=${project_creator}
dfc_global__project_containers_counts_created=$(docker ps -a -f "name=${dfc_global__project_name}" | sed '1d' | wc -l)
dfc_global__project_containers_counts_runned=$(docker container ls -f "name=${dfc_global__project_name}" | sed '1d' | wc -l)
dfc_global__project_script_name=${0##*/}
dfc_global__project_script_path=$(find $dfc_project_main_folder -name "$dfc_global__project_script_name" | head -n 1)
dfc_global__project_script_full_path="$PWD/${dfc_global__project_script_name}"
dfc_global__project_mariadb_pass=${project_mariadb_pass}
dfc_global__project_nginx_login=${project_nginx_login}
dfc_global__project_nginx_pass=${project_nginx_pass}

for dfc_project_script_path_temp in $(find $dfc_project_main_folder -name "$dfc_global__project_script_name"); do
    dfc_project_script_path_temp=$(echo $dfc_project_script_path_temp)
    dfc_project_script_path_temp_short=$(echo $dfc_project_script_path_temp | sed 's/\.\.\///g')

    if [[ "$dfc_project_script_full_path" == *"$dfc_project_script_path_temp_short"* ]]; then
        dfc_global__project_script_path=$dfc_project_script_path_temp
    fi
done

dfc_global__project_script_path_non_ext=${dfc_global__project_script_path%.*}
