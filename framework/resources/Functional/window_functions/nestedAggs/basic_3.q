SELECT col2, AVG(SUM(col2)) OVER ( PARTITION BY col7 ORDER BY col0 ) avg_col2, col7 FROM `allTypsUniq.parquet` GROUP BY col0,col2,col7;