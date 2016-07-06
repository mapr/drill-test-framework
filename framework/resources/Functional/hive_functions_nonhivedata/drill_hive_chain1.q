select char_length(`if`(`year`(l_shipdate) > 2000, 'latest', 'old')) from `lineitem_nodate.parquet` order by l_orderkey limit 1;
