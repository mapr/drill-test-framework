create or replace view v1_hive as select voter_id,name,age,registration,contributions,voterzone,create_time from `hive.default`.voter;
select count(*) from v1_hive;
drop view v1_hive;
