explain plan for select * from (
select from_utc_timestamp(timestamp_col, 'PST') from hive.crosssources.fewtypes_null_hive) t limit 0;
