set `store.hive.optimize_scan_with_native_readers` = true;
select ps_availqty, ps_supplycost, ps_comment
from `partsupp_old`
where ps_supplycost > 999.9;
reset `store.hive.optimize_scan_with_native_readers`;