select count(distinct(student_id)),count(distinct(name)), count(distinct(age)),count(distinct(gpa)), count(distinct(studentnum)) from student_parquet_v where age < 30;
