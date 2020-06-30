#!/bin/bash

# It will dynamically replace source DB and URL with target

config_path=/home/azureadmin/storage/${5}/config.php

update_target_info() {
    sudo sed -i "s~dbhost    = '${7}';~dbhost    = '${1}';~" ${config_path}
    sudo sed -i "s~dbname    = '${8}';~dbname    = '${4}';~" ${config_path}
    sudo sed -i "s~dbuser    = '${9}';~dbuser    = '${2}';~" ${config_path}
    sudo sed -i "s~dbpass    = '${10}';~dbpass    = '${3}';~" ${config_path}
    sudo sed -i "s~${11}~${5}~" ${config_path}
    sudo sed -i "s~dataroot  = '/azlamp/moodledata';~dataroot  = '${6}';~" ${config_path}
}

update_target_info ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8} ${9} ${10} ${11}
