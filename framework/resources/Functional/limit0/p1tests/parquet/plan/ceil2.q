explain plan for select * from ( select ceil(student_id),ceil(age),ceil(gpa),ceil(studentnum) from student_parquet_v where student_id=25 ) t limit 0;
