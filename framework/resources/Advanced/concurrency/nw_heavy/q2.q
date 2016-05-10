select count(*) 
from (
    select l_orderkey, l_partkey, l_suppkey 
    from lineitem_nocompression_256
    group by l_orderkey, l_partkey, l_suppkey
) s;
