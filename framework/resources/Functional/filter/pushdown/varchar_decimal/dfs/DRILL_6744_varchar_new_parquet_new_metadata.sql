select c_custkey, c_name, c_phone, c_phone
from `filter/pushdown/varchar_decimal/new_metadata_file/customer`
where c_name in ('Customer#000000334', 'Customer#000000335');