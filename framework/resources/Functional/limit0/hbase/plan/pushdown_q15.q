explain plan for select * from (
select cast(s.row_key as varchar(20)), cast(s.onecf.name as varchar(30)) name from student s where s.row_key like '1%') t limit 0;
