DROP TABLE IF EXISTS KV_SEQINPUT;
DROP TABLE IF EXISTS dest4_sequencefile;
create table kv_seqinput (key string, value string) stored as textfile;
load data local inpath 'resources/Datasources/hive_storage/kv1.txt' into table kv_seqinput;

CREATE TABLE dest4_sequencefile(key INT, value STRING) STORED AS SEQUENCEFILE;

FROM kv_seqinput
INSERT OVERWRITE TABLE dest4_sequencefile SELECT kv_seqinput.key, kv_seqinput.value;