alter session set `planner.enable_multiphase_agg` = false;
alter session set `planner.enable_hashagg` = false;
select cast(c_groupby as varchar(4)), count(distinct(c_int)), count(distinct(c_bigint)), count(distinct(c_float4)), count(distinct(c_float8)) from data group by c_groupby;
alter session set `planner.enable_hashagg` = true;
alter session set `planner.enable_multiphase_agg` = true;
