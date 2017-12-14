alter session set `planner.enable_nljoin_for_scalar_only`=false;
alter session set `planner.enable_join_optimization`=false;
select s.student_id,v.name,s.studentnum,s.registered_date from student s left join voter v on s.registered_date between v.timestamp1 and v.timestamp2;
alter session set `planner.enable_nljoin_for_scalar_only`=true;
alter session set `planner.enable_join_optimization`=true;
