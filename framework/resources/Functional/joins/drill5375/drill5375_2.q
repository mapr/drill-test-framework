alter session set `planner.enable_nljoin_for_scalar_only`=false;
select * from voter v left join student s on v.age < s.age;
alter session set `planner.enable_nljoin_for_scalar_only`=true;
