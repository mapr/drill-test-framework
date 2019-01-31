set `store.hive.optimize_scan_with_native_readers` = true;
select p_name, p_retailprice, p_comment
from `part`
where p_name = 'yellow white tan khaki saddle';
reset `store.hive.optimize_scan_with_native_readers`;