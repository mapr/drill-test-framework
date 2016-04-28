explain plan for select * from ( select (student_id - 5),(age - 10),(gpa - 1) from student_parquet_v where student_id=10 ) t limit 0;
