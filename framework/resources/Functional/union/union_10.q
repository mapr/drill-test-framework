SELECT c1 FROM `union_01.parquet` WHERE c1 IS NOT null UNION SELECT c1 FROM `union_02.parquet` WHERE exISts (SELECT * FROM `union_01.parquet` WHERE c1 IS null);
