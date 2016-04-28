explain plan for select * from ( select stddev(student_id),stddev(age),stddev(gpa),stddev(studentnum) from student_csv_v where age > 30 ) t limit 0;
