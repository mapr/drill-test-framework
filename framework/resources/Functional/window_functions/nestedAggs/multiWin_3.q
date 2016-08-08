SELECT 
    col7,
    AVG(SUM(col0)) OVER W,
    AVG(MIN(col1)) OVER W,
    AVG(SUM(col2)) OVER W,
    AVG(SUM(col3)) OVER W,
    MAX(MIN(col4)) OVER W,
    MAX(MIN(col5)) OVER W,
    MAX(MIN(col6)) OVER W,
    COUNT(count(col7)) OVER W,
    MAX(MIN(col8)) OVER W,
    MAX(MIN(col9)) OVER W
FROM `allTypsUniq.parquet`
GROUP BY col7,col8
    WINDOW W AS ( PARTITION BY col7 ORDER BY col8 );
