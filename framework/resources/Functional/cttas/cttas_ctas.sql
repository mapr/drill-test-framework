CREATE TABLE dfs.drillTestDir.t1_tmp AS SELECT * FROM typeall_l;
CREATE TEMPORARY TABLE dfs.tmp.t1_tmp AS SELECT * FROM typeall_l;
SELECT COUNT(*) FROM dfs.tmp.t1_tmp;
DROP TABLE dfs.tmp.t1_tmp;
DROP TABLE dfs.drillTestDir.t1_tmp;
