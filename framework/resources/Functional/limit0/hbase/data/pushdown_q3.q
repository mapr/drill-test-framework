select cast(s.twocf.age as integer)/cast(s.threecf.gpa as float) from student s where s.row_key < '800' and s.row_key > '750';
