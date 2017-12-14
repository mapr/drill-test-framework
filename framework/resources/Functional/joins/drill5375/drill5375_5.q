alter session set `planner.enable_nljoin_for_scalar_only`=false;
select s.name,s.gpa,v.registration from student s left join voter v on v.registration not in ('independent','republican','green');
alter session set `planner.enable_nljoin_for_scalar_only`=true;
