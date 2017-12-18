set `planner.enable_nljoin_for_scalar_only`=false;
select s.name,v.age,v.registration,v.contributions from student s left join voter v on v.age > 60;
reset `planner.enable_nljoin_for_scalar_only`;
