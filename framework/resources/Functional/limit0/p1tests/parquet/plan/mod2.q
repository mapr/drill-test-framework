explain plan for select * from ( select mod(student_id, 3), mod(age, 2), mod(studentnum, 1235) from student_parquet_v where student_id=10 ) t limit 0;
