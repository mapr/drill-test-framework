DROP TABLE IF EXISTS dfs.drillTestDir.t1_tmp;
DROP TABLE IF EXISTS dfs.tmp.t1_tmp;
CREATE TABLE dfs.drillTestDir.t1_tmp AS SELECT * FROM typeall_l;
CREATE TEMPORARY TABLE dfs.tmp.t1_tmp AS SELECT * FROM typeall_l;
--@test
SELECT COUNT(*) FROM dfs.tmp.t1_tmp;
DROP TABLE dfs.tmp.t1_tmp;
DROP TABLE dfs.drillTestDir.t1_tmp;
