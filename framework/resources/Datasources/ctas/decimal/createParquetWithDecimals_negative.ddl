DROP TABLE IF EXISTS dfs.drillTestDir.`CTAS_CSV_PARQUET_DECIMAL28_NEGATIVE`;
CREATE TABLE dfs.drillTestDir.`CTAS_CSV_PARQUET_DECIMAL28_NEGATIVE`
AS SELECT
  CASE WHEN columns[0] = '' THEN NULL ELSE CAST(columns[0] AS INT) END id_int,
  CASE WHEN columns[1] = '' THEN NULL ELSE CAST(columns[1] AS DECIMAL(28, 0)) END decimal_28_0,
  CASE WHEN columns[2] = '' THEN NULL ELSE CAST(columns[2] AS DECIMAL(28, 1)) END decimal_28_1,
  CASE WHEN columns[3] = '' THEN NULL ELSE CAST(columns[3] AS DECIMAL(28, 4)) END decimal_28_4,
  CASE WHEN columns[4] = '' THEN NULL ELSE CAST(columns[4] AS DECIMAL(28, 4)) END decimal_without_null_28_4,
  CASE WHEN columns[5] = '' THEN NULL ELSE CAST(columns[5] AS DECIMAL(28, 4)) END decimal_with_null_28_4,
  CASE WHEN columns[6] = '' THEN NULL ELSE CAST(columns[6] AS DECIMAL(28, 27)) END decimal_28_27
FROM dfs.drillTestDir.`decimal/DRILL_6094/decimal28.csv`;
DROP TABLE IF EXISTS dfs.drillTestDir.`CTAS_CSV_PARQUET_DECIMAL38_NEGATIVE`;
CREATE TABLE dfs.drillTestDir.`CTAS_CSV_PARQUET_DECIMAL38_NEGATIVE`
AS SELECT
  CASE WHEN columns[0] = '' THEN NULL ELSE CAST(columns[0] AS INT) END id_int,
  CASE WHEN columns[1] = '' THEN NULL ELSE CAST(columns[1] AS DECIMAL(38, 0)) END decimal_38_0,
  CASE WHEN columns[2] = '' THEN NULL ELSE CAST(columns[2] AS DECIMAL(38, 1)) END decimal_38_1,
  CASE WHEN columns[3] = '' THEN NULL ELSE CAST(columns[3] AS DECIMAL(38, 4)) END decimal_38_4,
  CASE WHEN columns[4] = '' THEN NULL ELSE CAST(columns[4] AS DECIMAL(38, 4)) END decimal_without_null_38_4,
  CASE WHEN columns[5] = '' THEN NULL ELSE CAST(columns[5] AS DECIMAL(38, 4)) END decimal_with_null_38_4,
  CASE WHEN columns[6] = '' THEN NULL ELSE CAST(columns[6] AS DECIMAL(38, 37)) END decimal_38_37
FROM dfs.drillTestDir.`decimal/DRILL_6094/decimal38.csv`;
