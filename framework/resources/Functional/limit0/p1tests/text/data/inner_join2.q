select s.name, s.age, s.gpa, v.registration from student_csv_v s inner join voter_csv_v v using (name);
