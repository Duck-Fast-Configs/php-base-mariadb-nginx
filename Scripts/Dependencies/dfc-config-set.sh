#!/bin/bash

echo "project_name=\"$dfc_global__project_name\"" > $dfc_project_main_folder/dfc.ini
echo "project_description=\"$dfc_global__project_description\"" >> $dfc_project_main_folder/dfc.ini
echo "project_type=\"$dfc_global__project_type\"" >> $dfc_project_main_folder/dfc.ini
echo "project_create_time=\"$dfc_global__project_create_time\"" >> $dfc_project_main_folder/dfc.ini
echo "project_os=\"$dfc_global__project_os\"" >> $dfc_project_main_folder/dfc.ini
echo "project_cpu_type=\"$dfc_global__project_cpu_type\"" >> $dfc_project_main_folder/dfc.ini
echo "project_host=\"$dfc_global__project_host\"" >> $dfc_project_main_folder/dfc.ini
echo "project_creator=\"$dfc_global__project_creator\"" >> $dfc_project_main_folder/dfc.ini
echo "project_mariadb_pass=\"$dfc_global__project_mariadb_pass\"" >> $dfc_project_main_folder/dfc.ini
echo "project_nginx_login=\"$dfc_global__project_nginx_login\"" >> $dfc_project_main_folder/dfc.ini
echo "project_nginx_pass=\"$dfc_global__project_nginx_pass\"" >> $dfc_project_main_folder/dfc.ini
