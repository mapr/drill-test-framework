CREATE TABLE rep_map AS SELECT d.map FROM dfs.`/drill/testdata/ctas/drill_2293.json` d;
SELECT * FROM dfs.ctas_parquet.`rep_map`;
DROP TABLE dfs.ctas_parquet.`rep_map`;
