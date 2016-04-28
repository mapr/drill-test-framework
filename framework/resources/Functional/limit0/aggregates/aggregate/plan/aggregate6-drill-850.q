alter session set `planner.enable_multiphase_agg` = false;
alter session set `planner.enable_hashagg` = false;
explain plan for select * from ( select cast(c_groupby as varchar(4)), count(distinct(cast(c_int as int))), count(distinct(cast(c_bigint as bigint))), count(distinct(cast(c_float4 as float))), count(distinct(cast(c_float8 as double))) from data group by c_groupby ) t limit 0;
alter session set `planner.enable_hashagg` = true;
alter session set `planner.enable_multiphase_agg` = true;
