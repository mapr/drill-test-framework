
CREATE EXTERNAL TABLE IF NOT EXISTS mktevents(
  event_id INT,
  user_id INT,
  add_id INT,
  add_date INT,
  add_hour INT
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY "|"
STORED AS TEXTFILE
LOCATION '/drill/testdata/hive_storage/mktevents.tbl';

CREATE TABLE IF NOT EXISTS dpp_compressed_mktevents
(event_id INT,user_id INT) 
PARTITIONED BY (add_id INT, add_date INT, add_hour INT) STORED AS PARQUET TBLPROPERTIES ("parquet.compress"="SNAPPY", "parquet.stripe.size"="67108864","parquet.row.index.stride"="50000");

SET hive.exec.dynamic.partition.mode=dynamic;

insert overwrite table dpp_compressed_mktevents partition (add_id, add_date, add_hour) 
select event_id, user_id, add_id, add_date, add_hour from mktevents;

