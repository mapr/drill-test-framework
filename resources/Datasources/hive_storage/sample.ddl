create database if not exists hive_storage;
CREATE EXTERNAL TABLE IF NOT EXISTS hive_storage.json_table ( json string )
STORED AS TEXTFILE
LOCATION '/drill/testdata/hive_storage/sample.json'; 
