CREATE TEMPORARY TABLE dfs.tmp.temptbl_11b PARTITION BY ( col_int )
AS
SELECT DISTINCT col_int FROM typeall_l ORDER BY col_int;
SELECT MAX( col_int )  FROM dfs.tmp.temptbl_11b;
DROP TABLE dfs.tmp.temptbl_11b;
