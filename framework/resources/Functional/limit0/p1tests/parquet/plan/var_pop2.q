explain plan for select * from ( select var_pop(student_id),var_pop(age),var_pop(gpa),var_pop(studentnum) from student_parquet_v ) t limit 0;
