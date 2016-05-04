create or replace view v1_hive_limit0_plan_plan as select voter_id,name,age,registration,contributions,voterzone,create_time from `hive.default`.voter;
explain plan for select * from (select  count(*) from v1_hive_limit0_plan_plan) t limit 0;
drop view v1_hive_limit0_plan_plan;
