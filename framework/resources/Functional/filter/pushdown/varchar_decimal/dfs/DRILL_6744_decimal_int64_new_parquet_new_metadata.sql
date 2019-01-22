select l_orderkey, l_shipmode, l_tax, l_extendedprice / 4
from `filter/pushdown/varchar_decimal/new_metadata_file/lineitem`
where l_extendedprice > 94700.999;