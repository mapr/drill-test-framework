SELECT 
    col7,
    AVG(SUM(col0)) OVER W4,
    AVG(MIN(col1)) OVER W,
    AVG(SUM(col2)) OVER W3,
    AVG(SUM(col3)) OVER W,
    MAX(MIN(col4)) OVER W2,
    MAX(MIN(col5)) OVER W3,
    MAX(MIN(col6)) OVER W4,
    COUNT(count(col7)) OVER W,
    MAX(MIN(col8)) OVER W2,
    MAX(MIN(col9)) OVER W4
FROM `allTypsUniq.parquet`
GROUP BY col7,col8
    WINDOW W AS ( PARTITION BY col7 ORDER BY col8 ),
    W2 AS ( PARTITION BY col7 ),
    W3 AS (),
    W4 AS (ORDER BY col8);
