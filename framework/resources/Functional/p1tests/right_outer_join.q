select student.name, voter.registration from student right outer join voter on (student.name = voter.name) where student.age < 30;
