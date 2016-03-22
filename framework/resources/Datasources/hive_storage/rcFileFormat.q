set hive.map.aggr.hash.percentmemory = 0.3;
set hive.mapred.local.mem = 256;

DROP TABLE IF EXISTS KV_RC;
DROP TABLE IF EXISTS columnTable_Bigdata;
DROP TABLE IF EXISTS rcformat_dp;
create table kv_rc (key string, value string) stored as textfile;
load data local inpath 'framework/resources/Datasources/hive_storage/kv1.txt' into table kv_rc;

add file framework/resources/Datasources/hive_storage/dumpdata_script.py;

CREATE table columnTable_Bigdata (key STRING, value STRING)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.columnar.ColumnarSerDe'
STORED AS
  INPUTFORMAT 'org.apache.hadoop.hive.ql.io.RCFileInputFormat'
  OUTPUTFORMAT 'org.apache.hadoop.hive.ql.io.RCFileOutputFormat';

FROM (FROM kv_rc MAP kv_rc.key,kv_rc.value USING 'python dumpdata_script.py' AS (key,value) WHERE kv_rc.key = 10) subq
INSERT OVERWRITE TABLE columnTable_Bigdata SELECT subq.key, subq.value;


CREATE external table rcformat_dp (value STRING)
PARTITIONED BY (key int)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.columnar.ColumnarSerDe'
STORED AS
  INPUTFORMAT 'org.apache.hadoop.hive.ql.io.RCFileInputFormat'
  OUTPUTFORMAT 'org.apache.hadoop.hive.ql.io.RCFileOutputFormat'
LOCATION '/drill/testdata/hive_testing/rcformat_dp';

set hive.exec.dynamic.partition.mode=true;
SET hive.exec.max.dynamic.partitions=1000;
SET hive.exec.max.dynamic.partitions.pernode=500;
INSERT OVERWRITE TABLE rcformat_dp PARTITION (key)
select value, key from kv_rc;
set hive.exec.dynamic.partition.mode=true;
describe columnTable_Bigdata;
