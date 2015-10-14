SELECT max(c2) max_c2, c3 FROM (SELECT c2, c1,c3 FROM `union_01.parquet` UNION SELECT c1, c2,c3 FROM `union_02.parquet`) tmp group BY c3;
