explain plan for select cast(s.row_key as integer) student_id, cast(s.onecf.name as varchar(30)) name, cast(s.twocf.age as integer) age, cast(s.threecf.gpa as decimal(4,2)) gpa, cast(s.fourcf.studentnum as bigint) student_num, cast(s.fivecf.create_date as timestamp) create_date from student s where s.row_key like '12%' and s.row_key <> '120';
