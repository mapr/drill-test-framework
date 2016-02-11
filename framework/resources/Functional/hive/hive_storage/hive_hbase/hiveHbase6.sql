select s.name, s.age, s.gpa, v.registration from hbase_student s join ext_hbvoter v on (s.name = v.name) where v.key < 300;
