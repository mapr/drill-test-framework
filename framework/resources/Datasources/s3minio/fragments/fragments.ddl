SET planner.width.max_per_node=100;
SET planner.slice_target=1;
SET planner.enable_multiphase_agg=false;

DROP TABLE IF EXISTS s3minio.tmp.`/big_files/T_DECIMAL_BIG`;
CREATE TABLE s3minio.tmp.`big_files/T_DECIMAL_BIG` (ID, STR_FIELD, DECIMAL_18_8, DECIMAL_2_1, DECIMAL_15_5)
PARTITION BY (DECIMAL_18_8)
AS SELECT
  CAST(columns[0] as INT) ID,
  columns[1] STR_FIELD,
  CAST(columns[2] as DECIMAL(18, 8)) DECIMAL_18_8,
  CAST(columns[3] as DECIMAL(2, 1)) DECIMAL_2_1,
  CAST(columns[4] as DECIMAL(15, 5)) DECIMAL_15_5
FROM s3minio.tmp.`big_files/decimal_big.tsv`;

DROP TABLE IF EXISTS s3minio.tmp.`big_files/T_DECIMAL_BIG_ZERO_PREC`;
CREATE TABLE s3minio.tmp.`/big_files/T_DECIMAL_BIG_ZERO_PREC` (ID, STR_FIELD, DECIMAL_18_18, DECIMAL_2_2, DECIMAL_15_15)
PARTITION BY (DECIMAL_18_18)
AS SELECT
  CAST(columns[0] as INT) ID,
  columns[1] STR_FIELD,
  CAST(columns[2] as DECIMAL(18, 18)) DECIMAL_18_18,
  CAST(columns[3] as DECIMAL(2, 2)) DECIMAL_2_2,
  CAST(columns[4] as DECIMAL(15, 15)) DECIMAL_15_15
FROM s3minio.tmp.`big_files/decimal_big_zero_prec.tsv`;

DROP TABLE IF EXISTS s3minio.tmp.`big_files/T_DECIMAL_BIG_ZERO_SCALE`;
CREATE TABLE s3minio.tmp.`big_files/T_DECIMAL_BIG_ZERO_SCALE` (ID, STR_FIELD, DECIMAL_18_0, DECIMAL_2_0, DECIMAL_15_0)
PARTITION BY (DECIMAL_18_0)
AS SELECT
  CAST(columns[0] as INT) ID,
  columns[1] STR_FIELD,
  CAST(columns[2] as DECIMAL(18, 0)) DECIMAL_18_0,
  CAST(columns[3] as DECIMAL(2, 0)) DECIMAL_2_0,
  CAST(columns[4] as DECIMAL(15, 0)) DECIMAL_15_0
FROM s3minio.tmp.`big_files/decimal_big_zero_scale.tsv`;

RESET planner.width.max_per_node;
RESET planner.slice_target;
RESET planner.enable_multiphase_agg;
