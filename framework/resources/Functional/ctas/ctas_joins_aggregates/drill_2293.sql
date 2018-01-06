CREATE TABLE rep_map AS SELECT d.map FROM dfs_test.`/drill/testdata/ctas/drill_2293.json` d;
SELECT * FROM dfs_test.ctas_parquet.`rep_map`;
DROP TABLE dfs_test.ctas_parquet.`rep_map`;
