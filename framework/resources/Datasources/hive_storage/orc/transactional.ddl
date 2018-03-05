SET hive.txn.manager = org.apache.hadoop.hive.ql.lockmgr.DbTxnManager;
SET hive.support.concurrency=true;
SET hive.enforce.bucketing=true;
SET hive.exec.dynamic.partition.mode=nonstrict;

create database if not exists hive_orc_transactional;
use hive_orc_transactional;

DROP TABLE IF EXISTS `orc_table_clustered_bucketed`;
CREATE TABLE IF NOT EXISTS `orc_table_clustered_bucketed`(
  `id` int,
  `name` string)
CLUSTERED BY (
  id)
INTO 2 BUCKETS
STORED AS ORC
TBLPROPERTIES (
'transactional'='true'
);

DROP TABLE IF EXISTS `orc_table_partitioned_clustered_bucketed`;
CREATE TABLE IF NOT EXISTS `orc_table_partitioned_clustered_bucketed`(
  `id` int,
  `name` string)
PARTITIONED BY (
  `dt` string)
CLUSTERED BY (
  id)
INTO 2 BUCKETS
STORED AS ORC
TBLPROPERTIES (
'transactional'='true'
);

INSERT INTO TABLE orc_table_clustered_bucketed VALUES (1, 'joe'), (2, 'jdoe'), (2, 'jame');
INSERT INTO TABLE orc_table_partitioned_clustered_bucketed PARTITION (dt = '2015-01-01')  VALUES (1, 'joe'), (2, 'jdoe');
INSERT INTO TABLE orc_table_partitioned_clustered_bucketed PARTITION (dt = '2016-01-01')  VALUES (3, 'joe'), (4, 'jame');