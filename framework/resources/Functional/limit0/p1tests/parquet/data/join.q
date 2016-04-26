select s.name, s.age, s.gpa, v.registration from student_parquet_v s join voter_parquet_v v on (s.name = v.name);
