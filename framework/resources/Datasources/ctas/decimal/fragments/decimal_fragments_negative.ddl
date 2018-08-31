SET planner.width.max_per_node=100;
SET planner.slice_target=1;
SET planner.enable_multiphase_agg=false;

DROP TABLE IF EXISTS dfs.drillTestDir.`decimal/fragments/negative/T_DECIMAL_BIG_ZERO_SCALE_NEGATIVE`;
CREATE TABLE dfs.drillTestDir.`decimal/fragments/negative/T_DECIMAL_BIG_ZERO_SCALE_NEGATIVE` (ID, STR_FIELD, DECIMAL_18_0, DECIMAL_2_0, DECIMAL_15_0)
PARTITION BY (DECIMAL_18_0)
AS SELECT
  CAST(columns[0] as INT) ID,
  columns[1] STR_FIELD,
  CAST(columns[2] as DECIMAL(18, 0)) DECIMAL_18_0,
  CAST(columns[3] as DECIMAL(2, 0)) DECIMAL_2_0,
  CAST(columns[4] as DECIMAL(15, 0)) DECIMAL_15_0
FROM dfs.drillTestDir.`decimal/fragments/negative/decimal_big_zero_scale.tsv`;

RESET planner.width.max_per_node;
RESET planner.slice_target;
RESET planner.enable_multiphase_agg;
