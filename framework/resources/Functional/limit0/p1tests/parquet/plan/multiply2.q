explain plan for select * from ( select (student_id * 2), (age * 2), (gpa * 2) from student_parquet_v where student_id=10 ) t limit 0;
