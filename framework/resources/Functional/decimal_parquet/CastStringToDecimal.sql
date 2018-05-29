DROP TABLE IF EXISTS dfs.drillTestDir.`CAST_STRING_TO_DECIMAL`;

CREATE TABLE dfs.drillTestDir.`CAST_STRING_TO_DECIMAL`
AS SELECT
  CAST('99999.9999' AS DECIMAL(9, 4)) decimal_9_4
FROM dfs.drillTestDir.`decimal/DRILL_6094/decimal9.csv`;

--@test
SELECT
  decimal_9_4,
  typeOf(decimal_9_4) decimal_9_4
FROM dfs.drillTestDir.`CAST_STRING_TO_DECIMAL`;
