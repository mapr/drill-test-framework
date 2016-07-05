select `if`(`year`(l_shipdate) > 2000, 'latest', 'old') from `lineitem_nodate.parquet`;
