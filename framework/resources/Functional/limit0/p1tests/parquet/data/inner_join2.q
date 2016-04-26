select s.name, s.age, s.gpa, v.registration from student_parquet_v s inner join voter_parquet_v v using (name);
