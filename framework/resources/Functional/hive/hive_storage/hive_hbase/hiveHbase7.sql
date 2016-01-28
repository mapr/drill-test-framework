select s.name, v.registration from student_hive s right outer join hbase_voter v on (s.name = v.name) where s.student_id > 700;
