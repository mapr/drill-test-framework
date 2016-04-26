explain plan for select * from ( select (student_id + 5),(age + 5), (gpa + 2), (gpa + 1), (studentnum + 500) from student_parquet_v where student_id=10 ) t limit 0;
