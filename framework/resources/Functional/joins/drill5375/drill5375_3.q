set `planner.enable_nljoin_for_scalar_only`=false;
set `planner.enable_join_optimization`=false;
select s.student_id,v.name,s.studentnum,s.registered_date from student s left join voter v on s.registered_date between v.timestamp1 and v.timestamp2;
reset `planner.enable_nljoin_for_scalar_only`;
reset `planner.enable_join_optimization`;
