alter system set `planner.enable_decimal_data_type` = false;
alter system set `new_view_default_permissions` = '700';
alter system set `planner.enable_limit0_optimization` = false;
alter system set `exec.errors.verbose` = false;
select * from sys.drillbits;
