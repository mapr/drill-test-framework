select s.name s_name, v.name v_name, v.registration from student_csv_v s left outer join voter_csv_v v on (s.name = v.name) where s.age < 30;
