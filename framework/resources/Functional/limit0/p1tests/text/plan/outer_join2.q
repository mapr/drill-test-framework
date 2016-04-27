explain plan for select * from ( select s.name, v.registration from student_csv_v s right outer join voter_csv_v v on (s.name = v.name) where s.age < 30 ) t limit 0;
