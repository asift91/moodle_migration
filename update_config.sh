#!/bin/bash

# It will dynamically replace source DB and URL with target

config_path=/home/azureadmin/storage/${5}/config.php

update_target_info() {
    sudo sed -i "s~dbhost    = 'mysql-vc2grz.mysql.database.azure.com';~dbhost    = '${1}';~" ${config_path}
    sudo sed -i "s~dbname    = 'moodle';~dbname    = '${4}';~" ${config_path}
    sudo sed -i "s~dbuser    = 'dbadmin@mysql-vc2grz';~dbuser    = '${2}';~" ${config_path}
    sudo sed -i "s~dbpass    = 'iTalent@27';~dbpass    = '${3}';~" ${config_path}
    sudo sed -i "s~lb-vc2grz.eastus.cloudapp.azure.com~${5}~" ${config_path}
    sudo sed -i "s~dataroot  = '/azlamp/moodledata';~dataroot  = '${6}';~" ${config_path}
}

update_target_info ${1} ${2} ${3} ${4} ${5} ${6}
