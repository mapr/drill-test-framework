select p_partkey, p_name, p_size
from `filter/pushdown/varchar_decimal/no_metadata_file/part_old`
where p_size in (1) and p_partkey < 100;
