explain plan for select * from ( select max(student_id),max(name),max(age),max(gpa),max(studentnum) from student_parquet_v ) t limit 0;
