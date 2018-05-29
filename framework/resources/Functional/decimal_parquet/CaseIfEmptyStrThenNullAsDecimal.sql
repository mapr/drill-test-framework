DROP TABLE IF EXISTS dfs.drillTestDir.`CASE_EMPTY_STR_TO_NULL_AS_DECIMAL`;

CREATE TABLE dfs.drillTestDir.`CASE_EMPTY_STR_TO_NULL_AS_DECIMAL`
AS SELECT
  CAST(columns[0] AS INT) id_int,
  CASE 
    WHEN columns[3] = ''
    THEN CAST(NULL AS DECIMAL(9, 4))
    ELSE CAST(columns[3] AS DECIMAL(9, 4))
  END decimal_9_4
FROM dfs.drillTestDir.`decimal/DRILL_6094/decimal9.csv`;

--@test
SELECT
  decimal_9_4,
  typeOf(decimal_9_4) decimal_9_4
FROM dfs.drillTestDir.`CASE_EMPTY_STR_TO_NULL_AS_DECIMAL`;
