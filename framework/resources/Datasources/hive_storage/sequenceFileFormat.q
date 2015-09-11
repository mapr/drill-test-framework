DROP TABLE IF EXISTS KV_SEQFILEFORMAT;
DROP TABLE IF EXISTS dest1;
create table kv_seqfileformat (key string, value string) stored as textfile;
load data local inpath 'resources/Datasources/hive_storage/kv1.txt' into table kv_seqfileformat;

CREATE TABLE dest1(key INT, value STRING) STORED AS
INPUTFORMAT 'org.apache.hadoop.mapred.SequenceFileInputFormat'
OUTPUTFORMAT 'org.apache.hadoop.mapred.SequenceFileOutputFormat';
  
FROM kv_seqfileformat
INSERT OVERWRITE TABLE dest1 SELECT kv_seqfileformat.key, kv_seqfileformat.value WHERE kv_seqfileformat.key < 10;