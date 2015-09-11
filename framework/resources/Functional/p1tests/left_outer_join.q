select student.name, voter.name, voter.registration from student left outer join voter on (student.name = voter.name) where student.age < 30;
