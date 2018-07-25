SET planner.width.max_per_node=100;
SET planner.slice_target=1;
SET planner.enable_multiphase_agg=false;
SELECT
  max(DECIMAL_18_0),
  max(DECIMAL_2_0),
  max(DECIMAL_15_0)
FROM dfs.drillTestDir.`decimal/fragments/T_DECIMAL_BIG_ZERO_SCALE`;
RESET planner.width.max_per_node;
RESET planner.slice_target;
RESET planner.enable_multiphase_agg;
