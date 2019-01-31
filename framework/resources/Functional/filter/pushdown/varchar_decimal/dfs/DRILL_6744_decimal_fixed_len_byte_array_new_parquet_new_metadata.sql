select c_nationkey, c_phone, c_comment
from `filter/pushdown/varchar_decimal/new_metadata_file/1.16.0/customer`
where c_acctbal < -980;