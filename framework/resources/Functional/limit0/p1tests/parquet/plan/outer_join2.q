explain plan for select * from ( select s.name, v.registration from student_parquet_v s right outer join voter_parquet_v v on (s.name = v.name) where s.age < 30 ) t limit 0;
