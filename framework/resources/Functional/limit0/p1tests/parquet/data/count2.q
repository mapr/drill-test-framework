select count(student_id),count(name), count(age),count(gpa), count(studentnum) from student_parquet_v where age < 30;
