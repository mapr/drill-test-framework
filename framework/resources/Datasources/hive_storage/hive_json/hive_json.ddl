drop table if exists hive_json;
create table hive_json(json string);
load data local inpath 'framework/resources/Datasources/hive_storage/hive_json/hive_json.json' into table hive_json;
