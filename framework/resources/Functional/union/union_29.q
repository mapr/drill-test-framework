SELECT c1, c2, c3, c4, c5, c6, c7, c8, c9 FROM `union_01.parquet` WHERE c1 > 5000 AND c1 < 10000 UNION SELECT c1, c2, c3, c4, c5, c6, c7, c8, c9 FROM `union_02.parquet` WHERE c1 > 0 AND c1 < 10000;
