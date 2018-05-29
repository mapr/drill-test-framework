DROP TABLE IF EXISTS dfs.drillTestDir.`CTAS_ROUND_FUNC`;
CREATE TABLE dfs.drillTestDir.`CTAS_ROUND_FUNC`
AS SELECT
  CAST('999999999.9999999995678' AS DECIMAL(38,18)) val
FROM dfs.drillTestDir.`decimal/DRILL_6094/decimal38.csv`;

--@test
SELECT
  ROUND(val, 9) val_to_9,
  typeOf(ROUND(val, 9)) tOfval_to_9,
  ROUND(val, 11) val_to_11,
  typeOf(ROUND(val, 11)) tOfval_to_11
FROM dfs.drillTestDir.`CTAS_ROUND_FUNC` LIMIT 1;
