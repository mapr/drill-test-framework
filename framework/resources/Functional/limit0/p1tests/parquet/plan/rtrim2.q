explain plan for select * from ( select rtrim(student_id,0),rtrim(name,'on'),rtrim(age,2),rtrim(gpa,4),rtrim(studentnum,564) from student_parquet_v where student_id=10 ) t limit 0;
