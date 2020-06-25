#!/bin/bash

target_db_server_name=mysql-43enuc.mysql.database.azure.com
target_db_login_name=dbadmin@mysql-43enuc
target_db_pass=iTalent@27
target_db_name=${1}
user_name=azureadmin

# Above values should be input to the script but for testing we are passing the variables as hardcoded values

dbname=$(mysql -h $target_db_server_name -u $target_db_login_name -p$target_db_pass -e "show databases;"| grep $target_db_name)

if [ $target_db_name = "$dbname" ]; then
  echo database is already exist.. now it will take the existing db backup and imports to target
  mysqldump -h $target_db_server_name -u $target_db_login_name -p$target_db_pass $target_db_name > /home/$user_name/storage/db_target_target.sql
  mysql -h $target_db_server_name -u $target_db_login_name -p$target_db_pass $dbname < /home/$user_name/storage/database.sql
else
  echo database does not exist.. now it will create a new db and imports to target
  mysql -h $target_db_server_name -u $target_db_login_name -p$target_db_pass -e "CREATE DATABASE $target_db_name CHARACTER SET utf8;"
  mysql -h $target_db_server_name -u $target_db_login_name -p$target_db_pass $target_db_name < /home/$user_name/storage/database.sql
fi
43enuc