#!/usr/bin/env bash

# script adapted from https://gist.github.com/carlosefonseca/8334277

# obtains all data tables from database
TABLES=`sqlite3 $1 "SELECT tbl_name FROM sqlite_master WHERE type='table' and tbl_name not like 'sqlite_%';"`

# exports each table to csv
for TABLE in $TABLES; do

sqlite3 $1 <<!
.headers on
.mode csv
.output $TABLE.csv
select * from $TABLE;
!

done
