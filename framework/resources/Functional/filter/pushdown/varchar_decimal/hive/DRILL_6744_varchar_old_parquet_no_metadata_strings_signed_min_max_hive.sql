set `store.hive.optimize_scan_with_native_readers` = true;
set `store.parquet.reader.strings_signed_min_max` = 'true';
select p_name, p_retailprice, p_comment
from `part_old`
where p_name = 'yellow white tan khaki saddle';
reset `store.parquet.reader.strings_signed_min_max`;
reset `store.hive.optimize_scan_with_native_readers`;