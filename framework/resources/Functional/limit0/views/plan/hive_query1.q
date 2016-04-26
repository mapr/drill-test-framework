create or replace view v1_hive as select voter_id,name,age,registration,contributions,voterzone,create_time from `hive.default`.voter;
explain plan for select * from (select count(*) from v1_hive) t limit 0;
drop view v1_hive;
