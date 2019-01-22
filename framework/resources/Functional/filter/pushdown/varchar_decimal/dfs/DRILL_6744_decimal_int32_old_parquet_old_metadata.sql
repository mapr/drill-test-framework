select p_partkey, p_name, p_size
from `filter/pushdown/varchar_decimal/old_metadata_file/part_old`
where p_size in (1) and p_partkey < 100;
