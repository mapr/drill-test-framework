explain plan for select * from ( select s.name, v.registration from voter_csv_v v full outer join student_csv_v s on (s.name = v.name) where s.age < 30 order by s.name ) t limit 0;
