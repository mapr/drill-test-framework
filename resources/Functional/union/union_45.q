SELECT c5, c6, c9 FROM (SELECT c5, c6, c9 FROM `union_01.parquet` UNION SELECT c5, c6, c9 FROM `union_02.parquet`) tmp WHERE c5 IS NOT null AND c6 IS NOT null AND c9 IS NOT null;
