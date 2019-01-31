select p_partkey, p_name, p_size
from `filter/pushdown/varchar_decimal/new_metadata_file/1.14.0/part`
where p_size in (1) and p_partkey < 100;
