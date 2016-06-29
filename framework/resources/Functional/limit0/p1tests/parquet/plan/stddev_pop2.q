explain plan for select * from ( select stddev_pop(student_id),stddev_pop(age),stddev_pop(gpa),stddev_pop(studentnum) from student_parquet_v where age > 30 ) t limit 0;
