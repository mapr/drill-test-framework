select s.name, s.age, s.gpa, v.registration from student_csv_v s join voter_csv_v v on (s.name = v.name);
