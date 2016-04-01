explain plan for select * from (
select sum(cast(fourcf['studentnum'] as bigint)) from student) t limit 0;
