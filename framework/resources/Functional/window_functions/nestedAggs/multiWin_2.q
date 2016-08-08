SELECT 
    col7,
    AVG(SUM(col0)) OVER ( PARTITION BY col7 ORDER BY col8 ) avg_sum_c0,
    AVG(MIN(col1)) OVER ( PARTITION BY col7 ORDER BY col8 ) avg_min_c1,
    AVG(SUM(col2)) OVER ( PARTITION BY col7 ORDER BY col8 ) avg_sum_c3,
    AVG(SUM(col3)) OVER ( PARTITION BY col7 ORDER BY col8 ) avg_sum_c3,
    MAX(MIN(col4)) OVER ( PARTITION BY col7 ORDER BY col4,col8 ) mx_min_c4,
    MAX(MIN(col5)) OVER ( PARTITION BY col7 ORDER BY col8 ) mx_min_c5,
    MAX(MIN(col6)) OVER ( PARTITION BY col7 ORDER BY col8 ) mx_min_c6,
    COUNT(count(col7)) OVER ( PARTITION BY col7 ORDER BY col8 ) count_c7,
    MAX(MIN(col8)) OVER ( PARTITION BY col7 ORDER BY col4,col8 ) mx_min_c8,
    MAX(MIN(col9)) OVER ( PARTITION BY col7 ORDER BY col8 ) mx_min_c9
FROM `allTypsUniq.parquet`
GROUP BY col4,col7,col8;
