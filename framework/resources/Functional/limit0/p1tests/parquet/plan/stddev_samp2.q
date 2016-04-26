explain plan for select * from ( select stddev_samp(student_id),stddev_samp(age),stddev_samp(gpa),stddev_samp(studentnum) from student_parquet_v where age > 30 ) t limit 0;
