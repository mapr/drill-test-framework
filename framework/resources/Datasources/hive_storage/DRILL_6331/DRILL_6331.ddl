set hive.exec.dynamic.partition.mode=nonstrict;

drop table if exists DRILL_6331_temp;
create table DRILL_6331_temp (
  id int,
  part_col string,
  int_col int,
  bool_col boolean,
  date_col date,
  float_col float,
  ts_col timestamp
)
row format delimited 
fields terminated by ','
stored as textfile
tblproperties ('serialization.null.format'='');

load data inpath '/drill/testdata/hive_storage/DRILL_6331/DRILL_6331_test_data.csv' 
overwrite into table DRILL_6331_temp;

drop table if exists DRILL_6331_managed_table;
create table DRILL_6331_managed_table (
  id int,
  int_col int,
  bool_col boolean,
  date_col date,
  float_col float,
  ts_col timestamp
)
partitioned by (part_col string)
stored as parquet
tblproperties ('serialization.null.format'='');

insert overwrite table DRILL_6331_managed_table partition (part_col) select id, int_col, bool_col, date_col, float_col, ts_col, part_col from DRILL_6331_temp;

drop table if exists DRILL_6331_external_table;
create external table DRILL_6331_external_table(
  id int,
  int_col int,
  boolean_col boolean,
  date_col date,
  float_col float,
  ts_col timestamp
)
partitioned by (part_col string)
stored as parquet
location '/drill/testdata/hive_storage/DRILL_6331/DRILL_6331_external_table';

alter table DRILL_6331_external_table add partition (part_col='Partition_three') location '/drill/testdata/hive_storage/DRILL_6331/DRILL_6331_external_table_outer_partition/part_col=Partition_three';
alter table DRILL_6331_external_table add partition (part_col='Partition_four') location '/drill/testdata/hive_storage/DRILL_6331/DRILL_6331_external_table/part_col=Partition_four';

insert overwrite table DRILL_6331_external_table partition (part_col) select id, int_col, bool_col, date_col, float_col, ts_col, part_col from DRILL_6331_temp;

drop table if exists DRILL_6331_managed_empty_table;
create table DRILL_6331_managed_empty_table (
  id int,
  int_col int,
  bool_col boolean,
  date_col date,
  float_col float,
  ts_col timestamp
)
partitioned by (part_col string)
stored as parquet
tblproperties ('serialization.null.format'='');

drop table if exists DRILL_6331_external_empty_table;
create external table DRILL_6331_external_empty_table(
  id int,
  int_col int,
  boolean_col boolean,
  date_col date,
  float_col float,
  ts_col timestamp
)
partitioned by (part_col string)
stored as parquet
location '/drill/testdata/hive_storage/DRILL_6331/DRILL_6331_external_empty_table';