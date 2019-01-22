set `store.hive.optimize_scan_with_native_readers` = true;
select c_nationkey, c_phone, c_comment
from `customer`
where c_acctbal < -980;
reset `store.hive.optimize_scan_with_native_readers`;