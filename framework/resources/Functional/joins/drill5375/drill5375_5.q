set `planner.enable_nljoin_for_scalar_only`=false;
set `planner.enable_join_optimization`=false;
select s.name,s.gpa,v.registration from student s left join voter v on v.registration not in ('independent','republican','green');
reset `planner.enable_nljoin_for_scalar_only`;
reset `planner.enable_join_optimization`;