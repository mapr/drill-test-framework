select lineitem.l_partkey, lineitem.l_suppkey, part.p_name
from `filter/pushdown/varchar_decimal/no_metadata_file/lineitem` lineitem left join
     `filter/pushdown/varchar_decimal/no_metadata_file/part_old` part on lineitem.l_partkey = part.p_partkey
where lineitem.l_quantity <= 1 and lineitem.l_discount between 0.08 and 0.09 and lineitem.l_tax = 0 and part.p_size < 5;