create or replace view v1_hive_limit0 as select voter_id,name,age,registration,contributions,voterzone,create_time from `hive.default`.voter;
select count(*) from v1_hive_limit0;
drop view v1_hive_limit0;
