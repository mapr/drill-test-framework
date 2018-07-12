DROP TABLE IF EXISTS dfs.drillTestDir.`CASE_EMPTY_STR_TO_NULL`;

CREATE TABLE dfs.drillTestDir.`CASE_EMPTY_STR_TO_NULL`
AS SELECT
  CAST(columns[0] AS INT) id_int,
  CASE
    WHEN columns[3] = ''
    THEN NULL
    ELSE CAST(columns[3] AS DECIMAL(9,4))
  END decimal_9_4
FROM dfs.drillTestDir.`decimal/DRILL_6094/decimal9.csv`;

--@test
SELECT
  id_int,
  decimal_9_4,
  typeOf(decimal_9_4)
FROM dfs.drillTestDir.`CASE_EMPTY_STR_TO_NULL`;
