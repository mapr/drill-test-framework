SELECT c2, AVG(SUM(c1)) OVER ( PARTITION BY c2 ) FROM `tblWnulls.parquet` GROUP BY c2;
