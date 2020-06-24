#!/bin/bash

# It will dynamically replace source DB and URL with target

config_path=/home/azureadmin/storage/${5}/config.php

update_target_info() {

dbhost    = 'mysql-24qd5n.mysql.database.azure.com';
dbname    = 'moodle';
dbuser    = 'dbadmin@mysql-24qd5n';
dbpass    = 'iTalent@27';
https://lb-24qd5n.eastus.cloudapp.azure.com';
dataroot  = '/azlamp/moodledata';

sudo sed -i "s~dbhost    = 'mysql-24qd5n.mysql.database.azure.com';~dbhost    = '${1}';~" ${config_path}
sudo sed -i "s~dbname    = 'moodle';~dbname    = '${4}';~" ${config_path}
sudo sed -i "s~dbuser    = 'dbadmin@mysql-24qd5n';~dbuser    = '${2}';~" ${config_path}
sudo sed -i "s~dbpass    = 'iTalent@27';~dbpass    = '${3}';~" ${config_path}
sudo sed -i "s~lb-24qd5n.eastus.cloudapp.azure.com~${5}~" ${config_path}
sudo sed -i "s~~~" ${config_path}


  sudo sed -i "s~mysql-3lvmnp.mysql.database.azure.com~${1}~" ${config_path}
  sudo sed -i "s~dbadmin@mysql-3lvmnp~${2}~" ${config_path}
  sudo sed -i "s~'DB_PASSWORD', 'iTalent@27'~'DB_PASSWORD', '${3}'~" ${config_path}
  sudo sed -i "s~define('DB_NAME', 'wordpress');~define('DB_NAME', '${4}';~" ${config_path}
}

update_target_info ${1} ${2} ${3} ${4} ${5} ${6}