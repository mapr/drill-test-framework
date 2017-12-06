alter system reset all;
alter system set `planner.enable_decimal_data_type` = true;
alter system set `new_view_default_permissions` = '777';
alter system set `planner.enable_limit0_optimization` = true;
alter system set `exec.errors.verbose` = true;
alter system set `planner.memory.max_query_memory_per_node` = 10737418240;
alter system set `drill.exec.hashagg.fallback.enabled` = true;
alter system set `planner.in_subquery_threshold` = 100;
alter system set `planner.index.noncovering_selectivity_threshold` = 0.25;
select * from sys.version;
select * from sys.drillbits;
select * from sys.options where status = 'CHANGED';

