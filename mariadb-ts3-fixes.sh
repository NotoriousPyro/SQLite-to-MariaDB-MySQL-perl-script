#!/usr/bin/env bash

# For TS3 only

file="$1"

if [ -z "$file" ]; then
	echo "No filename specified. Aborted."
	exit 1
fi

sed -i "/TABLE channel_properties/,/);/d" $file
sed -i "/TABLE server_properties/,/);/d" $file
sed -i "/TABLE clients/,/);/d" $file
sed -i "/TABLE servers/,/);/d" $file

printf "CREATE TABLE channel_properties(
  server_id int unsigned,
  id     int unsigned,
  ident  varchar(255) NOT NULL,
  value  varchar(8192)
)  CHARACTER SET 'utf8mb4';
CREATE TABLE clients(
  client_id               int PRIMARY KEY AUTO_INCREMENT NOT NULL,
  server_id               int unsigned,
  client_unique_id        varchar(40),
  client_nickname         varchar(100),
  client_login_name       varchar(20) UNIQUE,
  client_login_password   varchar(40),
  client_lastconnected    int unsigned,
  client_totalconnections int unsigned default 0,
  client_month_upload     bigint unsigned default 0,
  client_month_download   bigint unsigned default 0,
  client_total_upload     bigint unsigned default 0,
  client_total_download   bigint unsigned default 0,
  client_lastip           varchar(45),
  org_client_id           int
) CHARACTER SET 'utf8mb4';
CREATE TABLE server_properties(
  server_id int unsigned,
  id     int unsigned,
  ident  varchar(100) NOT NULL,
  value  varchar(2048)
) CHARACTER SET 'utf8mb4';
CREATE TABLE servers(
  server_id             int PRIMARY KEY AUTO_INCREMENT NOT NULL,
  server_port           int unsigned,
  server_autostart      int unsigned,
  server_machine_id     varchar(50),
  server_month_upload   bigint unsigned default 0,
  server_month_download bigint unsigned default 0,
  server_total_upload   bigint unsigned default 0,
  server_total_download bigint unsigned default 0
) CHARACTER SET 'utf8mb4';\n$(cat $file)\n" > $file
