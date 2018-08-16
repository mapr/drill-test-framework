SET planner.width.max_per_node=100;
SET planner.slice_target=1;
SET planner.enable_multiphase_agg=false;
SELECT
  max(DECIMAL_18_8),
  max(DECIMAL_2_1),
  max(DECIMAL_15_5)
FROM dfs.drillTestDir.`decimal/fragments/T_DECIMAL_BIG`;
RESET planner.width.max_per_node;
RESET planner.slice_target;
RESET planner.enable_multiphase_agg;
