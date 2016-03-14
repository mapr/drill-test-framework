DROP TABLE IF EXISTS KV_SEQFILEFORMAT;
DROP TABLE IF EXISTS dest1;
create table kv_seqfileformat (key string, value string) stored as textfile;
load data local inpath 'framework/resources/Datasources/hive_storage/kv1.txt' into table kv_seqfileformat;

CREATE TABLE dest1(key INT, value STRING) STORED AS
INPUTFORMAT 'org.apache.hadoop.mapred.SequenceFileInputFormat'
OUTPUTFORMAT 'org.apache.hadoop.mapred.SequenceFileOutputFormat';
  
FROM kv_seqfileformat
INSERT OVERWRITE TABLE dest1 SELECT kv_seqfileformat.key, kv_seqfileformat.value WHERE kv_seqfileformat.key < 10;

SET hive.exec.dynamic.partition.mode=true;
SET hive.exec.max.dynamic.partitions=1000;
SET hive.exec.max.dynamic.partitions.pernode=500;
CREATE EXTERNAL TABLE IF NOT EXISTS dest2(value STRING) PARTITIONED BY (key INT) STORED AS
INPUTFORMAT 'org.apache.hadoop.mapred.SequenceFileInputFormat'
OUTPUTFORMAT 'org.apache.hadoop.mapred.SequenceFileOutputFormat'
LOCATION "/drill/testdata/hive_storage/dest2";

INSERT OVERWRITE TABLE dest2 partition (key) 
select value, key from kv_seqfileformat;

SET hive.exec.dynamic.partition.mode=strict;
