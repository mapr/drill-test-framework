explain plan for select * from (
select cast(s.twocf.age as integer) as age, cast(s.threecf.gpa as float) as gpa from student s where s.row_key <= '800' and s.row_key > '750') t limit 0;
