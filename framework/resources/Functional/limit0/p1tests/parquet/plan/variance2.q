explain plan for select * from ( select variance(student_id),variance(age),variance(gpa),variance(studentnum) from student_parquet_v ) t limit 0;
