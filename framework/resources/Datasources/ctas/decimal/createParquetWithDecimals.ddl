DROP TABLE IF EXISTS dfs.drillTestDir.`CTAS_CSV_PARQUET_DECIMAL9`;
CREATE TABLE dfs.drillTestDir.`CTAS_CSV_PARQUET_DECIMAL9`
AS SELECT
  CASE WHEN columns[0] = '' THEN NULL ELSE CAST(columns[0] AS INT) END id_int,
  CASE WHEN columns[1] = '' THEN NULL ELSE CAST(columns[1] AS DECIMAL(9, 0)) END decimal_9_0,
  CASE WHEN columns[2] = '' THEN NULL ELSE CAST(columns[2] AS DECIMAL(9, 1)) END decimal_9_1,
  CASE WHEN columns[3] = '' THEN NULL ELSE CAST(columns[3] AS DECIMAL(9, 4)) END decimal_9_4,
  CASE WHEN columns[4] = '' THEN NULL ELSE CAST(columns[4] AS DECIMAL(9, 4)) END decimal_without_null_9_4,
  CASE WHEN columns[5] = '' THEN NULL ELSE CAST(columns[5] AS DECIMAL(9, 4)) END decimal_with_null_9_4,
  CASE WHEN columns[6] = '' THEN NULL ELSE CAST(columns[6] AS DECIMAL(9, 8)) END decimal_9_8
FROM dfs.drillTestDir.`decimal/DRILL_6094/decimal9.csv`;
DROP TABLE IF EXISTS dfs.drillTestDir.`CTAS_CSV_PARQUET_DECIMAL18`;
CREATE TABLE dfs.drillTestDir.`CTAS_CSV_PARQUET_DECIMAL18`
AS SELECT
  CASE WHEN columns[0] = '' THEN NULL ELSE CAST(columns[0] AS INT) END id_int,
  CASE WHEN columns[1] = '' THEN NULL ELSE CAST(columns[1] AS DECIMAL(18, 0)) END decimal_18_0,
  CASE WHEN columns[2] = '' THEN NULL ELSE CAST(columns[2] AS DECIMAL(18, 1)) END decimal_18_1,
  CASE WHEN columns[3] = '' THEN NULL ELSE CAST(columns[3] AS DECIMAL(18, 4)) END decimal_18_4,
  CASE WHEN columns[4] = '' THEN NULL ELSE CAST(columns[4] AS DECIMAL(18, 4)) END decimal_without_null_18_4,
  CASE WHEN columns[5] = '' THEN NULL ELSE CAST(columns[5] AS DECIMAL(18, 4)) END decimal_with_null_18_4,
  CASE WHEN columns[6] = '' THEN NULL ELSE CAST(columns[6] AS DECIMAL(18, 17)) END decimal_18_17
FROM dfs.drillTestDir.`decimal/DRILL_6094/decimal18.csv`;
DROP TABLE IF EXISTS dfs.drillTestDir.`CTAS_CSV_PARQUET_DECIMAL28`;
CREATE TABLE dfs.drillTestDir.`CTAS_CSV_PARQUET_DECIMAL28`
AS SELECT
  CASE WHEN columns[0] = '' THEN NULL ELSE CAST(columns[0] AS INT) END id_int,
  CASE WHEN columns[1] = '' THEN NULL ELSE CAST(columns[1] AS DECIMAL(28, 0)) END decimal_28_0,
  CASE WHEN columns[2] = '' THEN NULL ELSE CAST(columns[2] AS DECIMAL(28, 1)) END decimal_28_1,
  CASE WHEN columns[3] = '' THEN NULL ELSE CAST(columns[3] AS DECIMAL(28, 4)) END decimal_28_4,
  CASE WHEN columns[4] = '' THEN NULL ELSE CAST(columns[4] AS DECIMAL(28, 4)) END decimal_without_null_28_4,
  CASE WHEN columns[5] = '' THEN NULL ELSE CAST(columns[5] AS DECIMAL(28, 4)) END decimal_with_null_28_4,
  CASE WHEN columns[6] = '' THEN NULL ELSE CAST(columns[6] AS DECIMAL(28, 27)) END decimal_28_27
FROM dfs.drillTestDir.`decimal/DRILL_6094/decimal28.csv`;
DROP TABLE IF EXISTS dfs.drillTestDir.`CTAS_CSV_PARQUET_DECIMAL38`;
CREATE TABLE dfs.drillTestDir.`CTAS_CSV_PARQUET_DECIMAL38`
AS SELECT
  CASE WHEN columns[0] = '' THEN NULL ELSE CAST(columns[0] AS INT) END id_int,
  CASE WHEN columns[1] = '' THEN NULL ELSE CAST(columns[1] AS DECIMAL(38, 0)) END decimal_38_0,
  CASE WHEN columns[2] = '' THEN NULL ELSE CAST(columns[2] AS DECIMAL(38, 1)) END decimal_38_1,
  CASE WHEN columns[3] = '' THEN NULL ELSE CAST(columns[3] AS DECIMAL(38, 4)) END decimal_38_4,
  CASE WHEN columns[4] = '' THEN NULL ELSE CAST(columns[4] AS DECIMAL(38, 4)) END decimal_without_null_38_4,
  CASE WHEN columns[5] = '' THEN NULL ELSE CAST(columns[5] AS DECIMAL(38, 4)) END decimal_with_null_38_4,
  CASE WHEN columns[6] = '' THEN NULL ELSE CAST(columns[6] AS DECIMAL(38, 37)) END decimal_38_37
FROM dfs.drillTestDir.`decimal/DRILL_6094/decimal38.csv`;
