select * from (select s.name from student s where s.age < 20 UNION ALL select v.name from voter v where v.age < 20) student;
