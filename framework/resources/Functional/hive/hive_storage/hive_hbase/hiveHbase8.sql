select s.name, s.age, s.gpa, v.registration from hbase_student s inner join ext_hbvoter v using (name) where v.key < 500 and v.key > 200;
