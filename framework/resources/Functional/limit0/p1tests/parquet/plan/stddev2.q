explain plan for select * from ( select stddev(student_id),stddev(age),stddev(gpa),stddev(studentnum) from student_parquet_v where age > 30 ) t limit 0;
