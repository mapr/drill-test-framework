explain plan for select * from ( select s.name, v.registration from voter_parquet_v v full outer join student_parquet_v s on (s.name = v.name) where s.age < 30 order by s.name ) t limit 0;
