select l_orderkey, l_shipmode, l_tax, l_extendedprice / 4
from `filter/pushdown/varchar_decimal/new_metadata_file/1.16.0/lineitem`
where l_extendedprice > 94700.999;