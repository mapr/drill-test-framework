SELECT COUNT(c2), COUNT(DISTINCT c2), COUNT(c2) OVER (), MIN(COUNT(DISTINCT c2)) OVER() FROM `tblWnulls.parquet` GROUP BY c2;