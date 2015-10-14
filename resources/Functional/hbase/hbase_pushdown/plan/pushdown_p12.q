explain plan for select cast(s.twocf.age as integer) as age, cast(s.threecf.gpa as float) as gpa from student s where s.row_key <= '800' and s.row_key > '750';
