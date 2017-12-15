set `planner.enable_nljoin_for_scalar_only`=false;
select s.name,s.age,v.age,v.registration,v.contributions from voter v left join student s on v.age >= s.age;
reset `planner.enable_nljoin_for_scalar_only`;
