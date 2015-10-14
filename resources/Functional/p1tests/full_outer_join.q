select student.name, voter.registration from voter full outer join student on (student.name = voter.name) where student.age < 30 order by student.name;
